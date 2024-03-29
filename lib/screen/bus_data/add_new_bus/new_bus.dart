import 'package:chaloapp/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewBusAdd extends StatefulWidget {
  const NewBusAdd({super.key});

  @override
  _BusTicketBookingPageState createState() => _BusTicketBookingPageState();
}

class _BusTicketBookingPageState extends State<NewBusAdd> {
  TextEditingController busnumController = TextEditingController();
  TextEditingController drivernameController = TextEditingController();
  TextEditingController drivermobileController = TextEditingController();
  TextEditingController conductornameController = TextEditingController();
  TextEditingController conductormobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Bus Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: busnumController,
              decoration:
                  const InputDecoration(labelText: 'Enter the Bus Number'),
            ),
            TextField(
              controller: drivernameController,
              decoration:
                  const InputDecoration(labelText: 'Enter the Driver Name'),
            ),
            TextField(
              controller: drivermobileController,
              decoration:
                  const InputDecoration(labelText: 'Enter the Driver Number'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: conductornameController,
              decoration:
                  const InputDecoration(labelText: 'Enter the Conductor Name'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: conductormobileController,
              decoration: const InputDecoration(
                  labelText: 'Enter the Conductor Number'),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                bookTicket();
              },
              child: const Text('Add bus'),
            ),
          ],
        ),
      ),
    );
  }

  void bookTicket() {
    String busnum = busnumController.text;
    String drivername = drivernameController.text;
    String drivernum = drivermobileController.text;
    String condname = conductornameController.text;
    String condnum = conductormobileController.text;

    // Validate user input
    if (busnum.isEmpty ||
        drivername.isEmpty ||
        drivernum.isEmpty ||
        condname.isEmpty ||
        condnum.isEmpty) {
      // Show an error message
      showErrorMessage();
      return;
    } else {
      // Save data to database
      FirebaseFirestore.instance.collection('new_bus_registration').add({
        'Bus_number': busnum,
        'Driver_Name': drivername,
        'Driver_Number': drivernum,
        'Conductor_Name': condname,
        'Conductor_Number': condnum
      });
      print("Data store sucessfully!.......");
    }

    // Proceed to book the ticket
    showTicketDialog(busnum, drivername, drivernum, condname, condnum);
  }

  void showErrorMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Please fill in all the fields.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  void showTicketDialog(String busnum, String dname, String dnumber,
      String Condname, String Condnum) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Bus added Sucessfully',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Bus Number : $busnum'),
              Text('Driver Name: $dname'),
              Text('Driver Number: $dnumber'),
              Text('Conductor Name: $Condname'),
              Text('Conductor Number: $Condnum'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: const Text('Back to Home'),
            ),
          ],
        );
      },
    );
  }
}
