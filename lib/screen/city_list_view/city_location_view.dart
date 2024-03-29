import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var searchName = "";
  getcurrentlocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("permission denied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentposition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      print("latitude = ${currentposition.altitude.toString()}");
      print("longitude = ${currentposition.longitude.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SizedBox(
          height: 40,
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchName = value;
              });
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                filled: true,
                fillColor: const Color.fromARGB(255, 39, 39, 39),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                )),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('City')
              .orderBy('City_name')
              .startAt([searchName]).endAt([searchName + "\uf8ff"]).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Error is ${snapshot.error}');
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              getcurrentlocation();
              return const Text("Loading");
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  return ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(data['City_name'].toString()),
                    subtitle: Text(data['State'].toString()),
                    selectedTileColor: Colors.white,
                    selectedColor: Colors.red,
                    selected: true,
                    minVerticalPadding: 25.0,
                  );
                });
          }),
    );
  }
}
