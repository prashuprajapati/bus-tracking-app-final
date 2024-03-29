import 'package:chaloapp/pages/admin_page.dart';
import 'package:chaloapp/screen/complete_profile/components/complete_profile_form.dart';
import 'package:chaloapp/screen/ticket_booking/controllers/pages_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screen/city_list_view/city_location_view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Drawer Header
          Container(
            height: 200,
            width: 300,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: DrawerHeader(
                  child: Center(
                      child: Text(
                "C H A L O\n Bus App",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ))),
            ),
          ),

          // Home Page
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.stars),
              title: Text("Book Your Tickets "),
              selectedTileColor: Colors.grey,
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PagesController()));
              }),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("Card Recharge"),
              selectedTileColor: Colors.grey,
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.search),
              title: Text("Stops and Stations"),
              selectedTileColor: Colors.grey,
            ),
          ),

          // Profile Page
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Favorites"),
              selectedColor: Colors.grey,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CompleteProfileForm()));
              },
            ),
          ),

          // Add Buses Page
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: const Icon(Icons.bus_alert_rounded),
              title: const Text("Add buses"),
              selectedColor: Colors.grey,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminPage()));
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchView()));
              },
              leading: const Icon(Icons.location_on),
              title: Text("Change City"),
              selectedTileColor: Colors.grey,
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text("Change Language"),
              selectedTileColor: Colors.grey,
            ),
          ),
          // Setting Page
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              selectedColor: Colors.grey,
            ),
          ),

          // Help Page
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.help),
              title: Text("Support"),
              selectedColor: Colors.grey,
            ),
          ),

          // Logout
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text("Logout"),
              selectedColor: Colors.grey,
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
