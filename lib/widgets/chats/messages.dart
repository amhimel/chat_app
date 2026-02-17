import 'package:chat_app/providers/chat_controller.dart';
import 'package:chat_app/providers/chat_provider.dart';
import 'package:chat_app/providers/firebase_providers.dart';
import 'package:chat_app/widgets/chats/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Messages extends ConsumerWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatAsync = ref.watch(chatMessagesProvider);
    final user = ref.watch(firebaseAuthProvider).currentUser;

    return chatAsync.when(
      data: (chatSnapshot) {
        final chatDocs = chatSnapshot.docs;

        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (ctx, index) {
            final doc = chatDocs[index];
            final data = doc.data() as Map<String, dynamic>;

            final isMe = data['userId'] == user?.uid;

            return GestureDetector(
              onLongPress: () async {
                if (!isMe) return;

                //first delete
                await ref
                    .read(chatControllerProvider)
                    .deleteMessage(docId: doc.id);

                ScaffoldMessenger.of(context).clearSnackBars();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Message deleted"),
                    duration: const Duration(seconds: 4),
                    action: SnackBarAction(
                      label: "UNDO",
                      onPressed: () async {
                        await ref
                            .read(chatControllerProvider)
                            .restoreMessage(docId: doc.id, data: data);
                      },
                    ),
                  ),
                );
              },
              child: MessageBubble(
                uniqueKey: ValueKey(doc.id),
                message: data['text'],
                userName: data['username'],
                isMe: isMe,
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(e.toString())),
    );
  }
}
