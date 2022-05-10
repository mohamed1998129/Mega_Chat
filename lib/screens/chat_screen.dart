import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream:Firestore.instance.collection('chats/0AyB0KUoAY3PLQdrkPnQ/messages').snapshots(),
        builder:(ctx,snapShot){
          if(snapShot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          final docs = snapShot.data.docs;
         return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (ctx,index)=> Container(
              padding: EdgeInsets.all(8),
              child: Text(docs[index]['text']),
            ),
          );
        }

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Firestore.instance.collection('chats/0AyB0KUoAY3PLQdrkPnQ/messages').snapshots().listen((event) {
            event.documents.forEach((element){
              print(element['text']);
            });
          });
        },
      ),
    );
  }
}
