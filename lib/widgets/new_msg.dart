import 'package:flutter/material.dart';

class NewMsg extends StatefulWidget {
  @override
  State<NewMsg> createState() {
    
    return _NewMsgState();
  }
}

class _NewMsgState extends State<NewMsg> {
  var messageController = TextEditingController();
  // final String sender;

  // ChatMessage({required this.text, required this.sender});
  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left:15, right: 3, bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              autocorrect: true,
              textCapitalization: TextCapitalization.sentences,
              enableSuggestions: true,
              decoration: InputDecoration(
                labelText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ],
      )
    );
  }
}