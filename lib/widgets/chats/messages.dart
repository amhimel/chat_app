import 'package:chat_app/widgets/chats/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    void deleteWithSnackBar({
      required BuildContext context,
      required String docId,
      required Map<String, dynamic> messageData,
    }) async {
      final scaffold = ScaffoldMessenger.of(context);

      // First delete from Firestore
      await FirebaseFirestore.instance.collection('chat').doc(docId).delete();

      scaffold.clearSnackBars();

      scaffold.showSnackBar(
        SnackBar(
          content: const Text('Message deleted'),
          duration: const Duration(seconds: 4),
          action: SnackBarAction(
            label: 'UNDO',
            onPressed: () async {
              // Restore message if undo pressed
              await FirebaseFirestore.instance
                  .collection('chat')
                  .doc(docId)
                  .set(messageData);
            },
          ),
        ),
      );
    }

    return FutureBuilder(
      future: Future.value(FirebaseAuth.instance.currentUser),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("chat")
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (ctx, chatSnapshot) {
            if (chatSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            final chatDocs = chatSnapshot.data?.docs;
            return ListView.builder(
              reverse: true,
              itemCount: chatDocs?.length,
              itemBuilder: (ctx, index) {
                final doc = chatDocs![index];
                return GestureDetector(
                  onLongPress: () {
                    if (doc['userId'] ==
                        FirebaseAuth.instance.currentUser!.uid) {
                      deleteWithSnackBar(
                        context: context,
                        docId: doc.id,
                        messageData: doc.data(),
                      );
                    }
                  },
                  child: MessageBubble(
                    uniqueKey: ValueKey(chatDocs?[index].id),
                    message: chatDocs?[index]['text'],
                    userName: chatDocs?[index]['username'],
                    isMe: chatDocs?[index]['userId'] == snapshot.data?.uid,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
