import 'package:flutter/material.dart';

void displaymassageError(String titletext, String errormassage, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => Center(
            child: AlertDialog(
              title: Text(titletext,style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              content: Text(errormassage),
              actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
            ),
          ));
}
