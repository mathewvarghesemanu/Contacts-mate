import 'package:business_card/Classes/Current_user.dart';
import 'package:business_card/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:business_card/Reusable/ReusableWidgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

var newvar;

class NullScreen extends StatelessWidget {
  final String id = 'NullScreen';

  @override
  Widget build(BuildContext context) {
    return NullaScreen();
  }
}

class NullaScreen extends StatefulWidget {
  @override
  _NullaScreenState createState() => _NullaScreenState();
}

class _NullaScreenState extends State<NullaScreen> {
  final user = CurrentUser();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 35,
            color: Colors.white70,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: CircleAvatar(
                    child: Icon(
                      Icons.add,
                      size: 80,
                      color: Colors.teal,
                    ),
                    radius: 75.0,
                    backgroundColor: Colors.cyan[300]),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFields(newarg: 'firstName', newuser: user),
                  ),
                  Expanded(
                      child: TextFields(newarg: 'lastName', newuser: user)),
                ],
              ),
              TextFields(newarg: 'designation', newuser: user),
              TextFields(newarg: 'phone number', newuser: user),
              TextFields(newarg: 'email', newuser: user),
              InkWell(
                onTap: () {
                  Alert(
                    content: Icon(Icons.check),
                    context: context,
                    title: "Contact Updated",
                  );
                  setState(() {});
                  Navigator.pop(context);
                },
                child: ApplyCard(
                  label: 'Update my details',
                ),
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.ac_unit,
                ),
                label: Text('Cypher'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
