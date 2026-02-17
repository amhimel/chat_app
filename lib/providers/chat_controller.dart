import 'package:chat_app/providers/firebase_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatController {
  ChatController(this.ref);

  final Ref ref;
  FirebaseFirestore get _firestore => ref.read(firestoreProvider);

  Future<void> sendMessage(String text) async {
    final user = ref.read(firebaseAuthProvider).currentUser;
    final firestore = ref.read(firestoreProvider);

    final userData = await firestore.collection('users').doc(user!.uid).get();

    await firestore.collection('chat').add({
      'text': text,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData['username'],
    });
  }

  //DELETE MESSAGE
  Future<void> deleteMessage({required String docId}) async {
    await _firestore.collection('chat').doc(docId).delete();
  }

  //RESTORE MESSAGE
  Future<void> restoreMessage({
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection('chat').doc(docId).set(data);
  }
}

final chatControllerProvider = Provider((ref) => ChatController(ref));
