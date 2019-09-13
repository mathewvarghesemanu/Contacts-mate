import 'package:business_card/Classes/Current_user.dart';
import 'package:flutter/material.dart';
import 'package:business_card/DBoperations.dart';

class ApplyCard extends StatelessWidget {
  ApplyCard({this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
      elevation: 5,
      color: Colors.blueGrey[100],
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 85),
      child: ListTile(
        title: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Blinker',
            color: Colors.black87,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  final String newarg;
  CurrentUser newuser = CurrentUser();
  TextFields({this.newarg, this.newuser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        style: TextStyle(color: Colors.white),
        onChanged: (value) {
          switch (newarg) {
            case 'firstName':
              newuser.firstName = value;

              break;
            case 'lastName':
              newuser.lastName = value;
              break;
            case 'designation':
              newuser.designation = value;
              break;
            case 'phone number':
              newuser.Phone = value;
              break;
            case 'email':
              newuser.email = value;
          }

          print(newuser.firstName);
        },
        decoration: InputDecoration(
          focusColor: Colors.white,
          hintText: newarg,
          hintStyle: TextStyle(color: Colors.white70),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal[800], width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal[900], width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}
