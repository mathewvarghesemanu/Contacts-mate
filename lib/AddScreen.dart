import 'package:flutter/material.dart';
import 'Current_user.dart';
import 'package:business_card/HomeScreen.dart';
import 'package:image_picker/image_picker.dart';

var newvar;

class AddScreen extends StatelessWidget {
  final String id = 'AddScreen';

  @override
  Widget build(BuildContext context) {
    return AddaScreen();
  }
}

class AddaScreen extends StatefulWidget {
  @override
  _AddaScreenState createState() => _AddaScreenState();
}

class _AddaScreenState extends State<AddaScreen> {
  final user = CurrentUser();
  final newuser = NewUser();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: CircleAvatar(
                radius: 75.0,
                backgroundColor: Colors.lightGreen,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            new textfields(newarg: 'name', newuser: newuser),
            new textfields(newarg: 'designation', newuser: newuser),
            new textfields(newarg: 'phone number', newuser: newuser),
            new textfields(newarg: 'email', newuser: newuser),
            FlatButton.icon(
              onPressed: () {
                print(newuser.name);
              },
              icon: Icon(
                Icons.ac_unit,
              ),
              label: Text('Cypher'),
            ),
          ],
        ),
      ),
    ));
  }
}

class textfields extends StatefulWidget {
  textfields({this.newarg, this.newuser});
  final newarg;
  NewUser newuser;
  @override
  _textfieldsState createState() => _textfieldsState();
}

class _textfieldsState extends State<textfields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        style: TextStyle(color: Colors.white),
        onChanged: (value) {
          switch (widget.newarg) {
            case 'name':
              widget.newuser.name = value;
              break;
            case 'designation':
              widget.newuser.designation = value;
              break;
            case 'phone number':
              widget.newuser.phone = value;
              break;
            case 'email':
              widget.newuser.email = value;
              break;
          }
        },
        decoration: InputDecoration(
          focusColor: Colors.white,
          hintText: 'Enter your ' + widget.newarg,
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
