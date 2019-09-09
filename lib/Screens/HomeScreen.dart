import 'package:business_card/Screens/AddScreen.dart';
import 'package:flutter/material.dart';
import '../Classes/Current_user.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:business_card/Reusable/ReusableWidgets.dart';

class HomeScreen extends StatefulWidget {
  final id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = CurrentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 75.0,
              backgroundColor: Colors.redAccent,
              backgroundImage: AssetImage('img/Mathew Varghese.jpg'),
            ),
            Text(
              user.name,
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 35.0,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              user.designation.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Blinker',
                  fontSize: 30,
                  color: Colors.white,
                  letterSpacing: 2.5),
            ),
            SizedBox(
              height: 20,
              width: 300,
              child: Divider(
                height: 2,
                color: Colors.teal[100],
              ),
            ),
            Card(
              elevation: 10,
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal[900],
                  size: 40,
                ),
                title: Text(
                  user.phone,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Blinker',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 10,
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Colors.teal[900],
                  size: 40,
                ),
                title: Text(
                  user.email,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Blinker',
                    fontSize: 24,
                  ),
                ),
              ),
            ),
//            SizedBox(
//              height: 10,
//            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, AddScreen().id);
                });
              },
              child: new ApplyCard(label: 'Add Contact'),
            ),
            FlatButton.icon(
              onPressed: () {
                Alert(
                  context: context,
                  title: "SCAN ME",
                  image: Image.asset("img/QR.PNG"),
                ).show();
              },
              icon: Icon(
                Icons.ac_unit,
              ),
              label: Text('Show QR'),
            ),
          ],
        ),
      ),
    );
  }
}