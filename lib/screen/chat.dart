import 'package:chat_app/widgets/new_msg.dart';
import 'package:chat_app/widgets/chat_msg.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebase = FirebaseAuth.instance;

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              firebase.signOut();
            },
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      body: Column(
        children: [
          ChatMessage(),
          NewMsg(),
          
        ],
      )
    );
  }
}