import 'package:ContactsMate/Screens/AddScreen.dart';
import 'package:ContactsMate/Screens/EditScreen.dart';
import 'package:flutter/material.dart';
import '../Classes/Current_user.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ContactsMate/Reusable/ReusableWidgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ContactsMate/Classes/DBoperations.dart';
import 'package:ContactsMate/Screens/EditScreen.dart';
import 'dart:io';
import 'package:ContactsMate/Classes/FileOperations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HomeScreen extends StatefulWidget {
  final id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imagePath;
  bool loadingState = false;

  @override
  void initState() {
    add();
    super.initState();
  }

  Future add() async {
    try {
//      await CreateDB();
      await ReadfromDB(user);
    } catch (e) {
//      print(e);
    }
    if (user.image == null) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      imagePath = appDocDir.path;
      print(imagePath);
      user.image = await File(imagePath + '/image1.jpg');
    }
    if (user.firstName == null) {
      Navigator.pushNamed(context, EditScreen().id);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      appBar: AppBar(
        centerTitle: true,
        title: FlatButton.icon(
          color: Colors.teal[900],
          onPressed: () async {
            await user.QRGenerate();
            Alert(
                context: context,
                title: "SCAN ME",
                content: QrImage(
                  data: user.QRText,
                  version: QrVersions.auto,
                  size: 320,
                  gapless: false,
                )).show();
          },
          icon: Icon(
            Icons.ac_unit,
            color: Colors.white70,
          ),
          label: Text(
            'Show QR',
            style: TextStyle(fontSize: 25, color: Colors.white70),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, EditScreen().id);
              },
              child: Icon(
                FontAwesomeIcons.edit,
                size: 35,
                color: Colors.white70,
              ),
            ),
          )
        ],
        backgroundColor: Colors.teal[600],
      ),
      body: ModalProgressHUD(
        inAsyncCall: loadingState,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: CircleAvatar(
                      radius: 75.0,
                      backgroundColor: Colors.teal[700],
                      backgroundImage: user.imageExist == '1'
                          ? FileImage(user.image)
                          : AssetImage('img/avatar.jpg'),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  user.firstName == null || user.lastName == null
                      ? ''
                      : user.firstName + ' ' + user.lastName,
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Center(
                child: Text(
                  user.designation == null || user.designation == null
                      ? ''
                      : user.designation.toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Blinker',
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 2.5),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 15,
                    width: 300,
                    child: Divider(
                      height: 2,
                      color: Colors.teal[100],
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: () async {
                  setState(() {
                    print(user.image);
                  });
                },
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal[900],
                      size: 40,
                    ),
                    title: Text(
                      user.Phone == null ? '' : user.Phone,
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
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.teal[900],
                    size: 40,
                  ),
                  title: Text(
                    user.email == null ? '' : user.email,
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
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, AddScreen().id);
                    });
                  },
                  child: new ApplyCard(label: 'Add Contact'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
