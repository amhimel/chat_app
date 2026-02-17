import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_providers.dart';

class AuthController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    // No initial async work needed
  }

  Future<void> submitAuthForm({
    required String username,
    required String email,
    required String password,
    required bool isLogin,
  }) async {
    final auth = ref.read(firebaseAuthProvider);
    final firestore = ref.read(firestoreProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      UserCredential authResult;

      if (isLogin) {
        authResult = await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        authResult = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await firestore.collection('users').doc(authResult.user!.uid).set({
          'username': username,
          'email': email,
        });
      }
    });
  }

  Future<void> logout() async {
    await ref.read(firebaseAuthProvider).signOut();
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, void>(
  AuthController.new,
);
