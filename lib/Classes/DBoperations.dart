import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:business_card/Classes/Current_user.dart';
import 'package:path/path.dart';

Future getPath() async {
  var databasesPath = await getDatabasesPath();

  String path = join(databasesPath, 'data.db');
  return path;
}

Future CreateDB() async {
  Database database = await openDatabase(await getPath().toString(), version: 1,
      onCreate: (Database database, int version) async {
    await database.execute(
        'CREATE TABLE PersonalData (firstName TEXT,lastName TEXT, designation TEXT, Phone TEXT PRIMARY KEY,email TEXT,imageExist TEXT)');
  });
}

Future AddtoDB(CurrentUser AddUser) async {
//  try {
  Database database = await openDatabase(await getPath().toString(), version: 1,
      onCreate: (Database database, int version) async {
    await database.execute(
        'CREATE TABLE PersonalData (firstName TEXT,lastName TEXT, designation TEXT, Phone TEXT,email TEXT,imageExist TEXT);');
  });
  await database.execute("DELETE FROM PersonalData;");
  await database.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO PersonalData(firstName,lastName, designation, Phone,email,imageExist) VALUES("' +
            AddUser.firstName +
            '","' +
            AddUser.lastName +
            '","' +
            AddUser.designation +
            '","' +
            AddUser.Phone +
            '","' +
            AddUser.email +
            '","' +
            AddUser.imageExist +
            '");');
//    JustReadDB();
  });
  print('addtoDB:inserted');
//  } catch (e) {
//    print('addtoDB:NotInserted');
//  }
}

Future ReadfromDB(CurrentUser ReadUser) async {
  Database database = await openDatabase(getPath().toString(), version: 1,
      onCreate: (Database database, int version) async {
    await database.execute(
        'CREATE TABLE PersonalData (firstName TEXT,lastName TEXT, designation TEXT, Phone TEXT PRIMARY KEY,email TEXT,imageExist TEXT)');
  });

  List<Map> list = await database.rawQuery('SELECT * FROM PersonalData');
  print('reading fromDB:');

//  print(list);
  ReadUser.firstName = list[0]['firstName'];
  ReadUser.lastName = list[0]['lastName'];
  ReadUser.designation = list[0]['designation'];
  ReadUser.Phone = list[0]['Phone'];
  ReadUser.email = list[0]['email'];
  ReadUser.imageExist = list[0]['imageExist'];
//  await database.close();
  print('readfromDB:');
}

Future JustReadDB() async {
  Database database = await openDatabase(getPath().toString(), version: 1);
  List<Map> list = await database.rawQuery('SELECT * FROM PersonalData');
  print(list);
//  print('justReadDB:');
}
