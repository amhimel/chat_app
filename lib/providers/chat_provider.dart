import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_providers.dart';

final chatMessagesProvider = StreamProvider<QuerySnapshot>((ref) {
  return ref
      .watch(firestoreProvider)
      .collection('chat')
      .orderBy('createdAt', descending: true)
      .snapshots();
});
