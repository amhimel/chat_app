import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  var _enteredMessage = '';
  final _messageController = TextEditingController();

  void _sendMessage() async {
    // to hide the keyboard after sending message
    FocusScope.of(context).unfocus();
    final userId =  await FirebaseAuth.instance.currentUser;
    final userData =  await FirebaseFirestore.instance
        .collection('users')
        .doc(userId?.uid)
        .get();
    FirebaseFirestore.instance.collection("chat").add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': userId?.uid,
      'username': userData['username'],
    });
    _messageController.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: "Send a message..."),
              onChanged: (value) {
                //we can use this value to send message
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
            icon: _enteredMessage.trim().isEmpty
                ? Icon(Icons.send, color: Theme.of(context).disabledColor)
                : Icon(Icons.send, color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
