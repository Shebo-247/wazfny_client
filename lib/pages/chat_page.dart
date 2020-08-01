import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List messages = [];

  void getMessages(loggedUserID) {
    print('called get messages');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<FirebaseUser>(context);
    getMessages(loggedUser.uid);
    return Container(
      child: StreamBuilder(
        stream: Firestore.instance
            .collection("Clients")
            .document(loggedUser.uid)
            .collection("Rooms")
            .snapshots(),
        builder: (context, snapshot) {
          print(snapshot);
          return Container();
        },
      ),
    );
  }
}
