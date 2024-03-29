import 'package:chaloapp/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class  CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BusTicketBookingPageState createState() => _BusTicketBookingPageState();
}

class _BusTicketBookingPageState extends State<CompleteProfileForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emialController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController addresssController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comlete Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:const EdgeInsets.all(10),
              child: 
              Image.network("data:image/jpeg;base64,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",
              height: 200,
              width: 100,),),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'User Name'),
            ),
            TextField(
              controller: fullnameController,
              decoration: const  InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: emialController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: contactController,
              decoration: InputDecoration(labelText: 'Contact Number',
              suffixIcon: IconButton(onPressed: (() {
                // goto souce
              }), icon:const Icon(Icons.search))),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: addresssController,
              decoration: const InputDecoration(
                labelText: 'Address',
                hintText: 'Your Address'
            ),
              
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                bookTicket();
              },
              child: const Text('Create Profile'),
            ),
          ],
        ),
      ),
    );
  }

  void bookTicket() {
    String user = usernameController.text;
    String fullname = fullnameController.text;
    String email = emialController.text;
    String contact = contactController.text;
    String address = addresssController.text;

    // Validate user input
    if (user.isEmpty || fullname.isEmpty || email.isEmpty || contact.isEmpty || address.isEmpty ) {
      // Show an error message
      showErrorMessage();
      return;
    }

    // Proceed to book the ticket
    showTicketDialog(user, fullname, email, contact, address);
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

  void showTicketDialog(String name, String source, String destination, String Age, String ticketid ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profile Create Sucessfully'
          ,style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Ticketid : $ticketid'),
              Text('Name: $name'),
              Text('Age: $Age'),
              Text('Source: $source'),
              Text('Destination: $destination'),
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
