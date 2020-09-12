import 'package:cloud_firestore/cloud_firestore.dart';

class Detail{
  final String id;
  final String title;
  final String subtitle;
  final String user;
  final String createdat;
  final bool like;
  final String comment;
  final DocumentReference reference;

  Detail.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        id = map['id'],
        subtitle = map['subtitle'],
        user = map['user'],
        createdat = map['createdat'],
        like = map['like'],
        comment = map['comment'];

  Detail.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Detail<$title:$subtitle>";
}