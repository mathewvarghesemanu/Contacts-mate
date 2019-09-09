import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 75.0,
              backgroundColor: Colors.redAccent,
              backgroundImage: AssetImage('img/Mathew Varghese.jpg'),
            ),
            Text(
              'Mathew Varghese',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 35.0,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'ENGINEER',
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
                  '+91-9446050001',
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
                  'mathewvarghesemanu@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Blinker',
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 10,
              color: Colors.blueGrey[100],
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              child: ListTile(
                title: Text(
                  'Add Contact',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Blinker',
                    color: Colors.black87,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            FlatButton.icon(
              onPressed: null,
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
