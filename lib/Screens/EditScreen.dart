import 'package:business_card/Classes/Current_user.dart';
import 'package:business_card/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:business_card/Reusable/ReusableWidgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:business_card/Classes/getimage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:business_card/DBoperations.dart';

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
  @override
  bool loading = false;
  File _image;

  Future getImage(var source) async {
    var image = await ImagePicker.pickImage(
      source: source,
    );

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.teal,
          appBar: AppBar(
            title: Text('Edit My Info'),
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, HomeScreen().id);
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 100),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.cyan[300],
                      backgroundImage:
                          _image == null ? null : FileImage(_image),
                      child: InkWell(
                          onTap: () async {
                            Alert(
                              content: Row(
                                children: <Widget>[
                                  ApplyCard(
                                    label: '1',
                                  ),
                                  ApplyCard(
                                    label: '2',
                                  ),
                                ],
                              ),
                              context: context,
                              title: "Contact Updated",
                            );

                            setState(() {
                              getImage(ImageSource.camera);
                            });
                          },
                          child: _image == null
                              ? Icon(
                                  Icons.add,
                                  size: 80,
                                  color: Colors.teal,
                                )
                              : null),
                    ),
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
                    onTap: () async {
                      await AddtoDB(user);
                      Alert(
                        type: AlertType.success,
                        closeFunction: () {
                          Navigator.pushNamed(context, HomeScreen().id);
                        },
                        context: context,
                        title: "Contact Updated",
                      ).show();

//                      Navigator.pushNamed(context, HomeScreen().id);
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
