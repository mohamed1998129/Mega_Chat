import 'package:flutter/material.dart';
import 'package:mega_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebae.intializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
     theme: ThemeData(
         primarySwatch: Colors.pink,
         backgroundColor: Colors.pink,
         accentColor: Colors.deepPurple,
         accentColorBrightness: Brightness.dark,
     ),
      home: ChatScreen(),
    );
  }
}
