import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    this.message,
    this.isMe,
    this.uniqueKey,
    this.userName,
  });

  final String? message;
  final String? userName;
  final bool? isMe;
  final Key? uniqueKey;

  @override
  Widget build(BuildContext context) {
    final String firstLetter =
    userName != null && userName!.isNotEmpty
        ? userName![0].toUpperCase()
        : '';

    return Row(
      mainAxisAlignment:
      isMe! ? MainAxisAlignment.end : MainAxisAlignment.start,

      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 180,
              margin: const EdgeInsets.symmetric(
                  vertical: 12, horizontal: 8),
              padding: const EdgeInsets.symmetric(
                  vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: isMe!
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: isMe!
                      ? const Radius.circular(12)
                      : const Radius.circular(0),
                  bottomRight: isMe!
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                ),
              ),
              child: Text(
                message ?? '',
                style: TextStyle(
                  color: isMe! ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),

            /// 🔥 Avatar Positioned Above Bubble
            Positioned(
              top: -2,
              right: isMe! ? 0 : null,
              left: isMe! ? null : 0,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: isMe!
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                child: Text(
                  firstLetter,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


