import 'package:business_card/Screens/AddScreen.dart';
import 'package:business_card/Screens/EditScreen.dart';
import 'package:flutter/material.dart';
import '../Classes/Current_user.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:business_card/Reusable/ReusableWidgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:business_card/DBoperations.dart';

class HomeScreen extends StatefulWidget {
  final id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    add();
    super.initState();
  }

  Future add() async {
    try {
      await CreateDB();
      await ReadfromDB(user);
      setState(() {});
//      await AddtoDB(user);
    } catch (e) {
//      print(e);
    }
    if (user.firstName == null) {
      Navigator.pushNamed(context, NullScreen().id);
    }

//    user.show();

//    JustReadDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, NullScreen().id);
              },
              child: Icon(
                FontAwesomeIcons.edit,
                size: 35,
                color: Colors.white70,
              ),
            ),
          )
        ],
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 75.0,
                  backgroundColor: Colors.teal[700],
                  backgroundImage: AssetImage('img/Mathew Varghese.jpg'),
                ),
                Text(
                  user.firstName == null || user.lastName == null
                      ? 'NULL'
                      : user.firstName + ' ' + user.lastName,
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  user.designation == null || user.designation == null
                      ? 'null'
                      : user.designation.toUpperCase(),
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
                InkWell(
                  onTap: () async {
//                    await ReadfromDB(user);
                    setState(() {});
                  },
                  child: Card(
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
                        user.Phone == null ? 'null' : user.Phone,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Blinker',
                          fontSize: 30,
                        ),
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
                      user.email == null ? 'null' : user.email,
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
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, AddScreen().id);
                    });
                  },
                  child: new ApplyCard(label: 'Add Contact'),
                ),
                FlatButton.icon(
                  onPressed: () async {
                    await user.QRGenerate();
                    Alert(
                        context: context,
                        title: "SCAN ME",
//                    image: Image.asset("img/QR.PNG"),
                        content: QrImage(
                          data: user.QRText,
                          version: QrVersions.auto,
                          size: 320,
                          gapless: false,
                        )).show();
                  },
                  icon: Icon(
                    Icons.ac_unit,
                  ),
                  label: Text('Show QR'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
