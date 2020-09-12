import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votingrenewindex/detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Firestore firestore = Firestore.instance;
  Stream<QuerySnapshot> streamData;

  
  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('details').snapshots();
  }
  Widget _fetchData(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('details').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot){
    List<Detail> details = snapshot.map((d) => Detail.fromSnapshot(d)).toList();
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[

            TopBar(),
          ],
        ),
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        children: <Widget>[
          Container(
          padding: EdgeInsets.only(right: 5),
          child: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 20.0,
            onPressed: () {
              Navigator.of(context).pop();
    },
      ),
    ),
          Container(
          padding: EdgeInsets.only(right: 5, left: 5),
    ),
          Container(
          padding: EdgeInsets.only(right: 1),
          child: IconButton(
            color: Colors.black,
            icon: Icon(Icons.menu),
            iconSize: 20.0,
            onPressed: (){
              Navigator.of(context).pop();
    },
    ),
    ),
    ],
    ),
    );
  }
}

