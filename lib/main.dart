import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:votingrenewindex/detail.dart';
import 'package:votingrenewindex/home_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: 'list',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.grey,
          accentColor: Colors.black,
        ),
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            HomeScreen(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue[900],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            );
          },
        ),
      ),

    );
  }
}
