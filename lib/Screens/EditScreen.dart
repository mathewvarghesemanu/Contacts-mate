import 'package:business_card/Classes/Current_user.dart';
import 'package:business_card/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:business_card/Reusable/ReusableWidgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:business_card/Classes/getimage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:business_card/Classes/DBoperations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:business_card/Classes/FileOperations.dart';

var newvar;

class EditScreen extends StatelessWidget {
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
  File image;

  @override
  bool loading = false;

  Future<File> getImage(var source) async {
    var tempImage = await ImagePicker.pickImage(source: source);

    setState(() {});
    return tempImage;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.teal[800],
          appBar: AppBar(
            title: Text('Edit My Info'),
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context, () {
                  setState(() {});
                });
              },
              child: Icon(
                Icons.arrow_back,
                size: 35,
                color: Colors.white70,
              ),
            ),
            backgroundColor: Colors.teal[600],
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
                      backgroundImage: image == null ? null : FileImage(image),
                      child: InkWell(
                          onTap: () async {
                            Alert(
                              type: AlertType.none,
                              content: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        image =
                                            await getImage(ImageSource.camera);

                                        Navigator.pop(context);
                                      },
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 40),
                                          child: Text(
                                            'Camera',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        image =
                                            await getImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 40),
                                          child: Text(
                                            'Gallery',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              context: context,
                              title: "Select Image Source",
                            ).show();

                            setState(() {});
                          },
                          child: image == null
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
                        child: TextFields(newarg: '*firstName', newuser: user),
                      ),
                      Expanded(
                          child:
                              TextFields(newarg: '*lastName', newuser: user)),
                    ],
                  ),
                  TextFields(newarg: 'designation', newuser: user),
                  TextFields(
                      newarg: '*phone number with country code', newuser: user),
                  TextFields(newarg: 'email', newuser: user),
                  InkWell(
                    onTap: () async {
                      user.image = image;
                      await CopyPaste(user);
                      user.imageExist = '1';
                      setState(() {});
                      await AddtoDB(user);
                      print(user.image);
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
                ],
              ),
            ),
          ),
        ));
  }
}
