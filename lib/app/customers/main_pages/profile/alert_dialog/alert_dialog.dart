import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AlertDialogLogOut {
  static showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        FirebaseAuth.instance.signOut();
        Navigator.pushReplacementNamed(context, '/welcome_page');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Profile Log Out"),
      content: Text("Would you like to Log Our or Continue"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
