import 'package:chat_app/providers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewMessages extends ConsumerStatefulWidget {
  const NewMessages({super.key});

  @override
  ConsumerState<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends ConsumerState<NewMessages> {
  final _controller = TextEditingController();
  var _enteredMessage = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();

    await ref.read(chatControllerProvider).sendMessage(_enteredMessage);

    _controller.clear();
    setState(() {
      _enteredMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: (value) {
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
