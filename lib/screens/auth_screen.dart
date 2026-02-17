import 'package:chat_app/providers/auth_controller.dart';
import 'package:chat_app/widgets/auth/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

@override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    void submit(
      String username,
      String email,
      String password,
      bool isLogin,
      BuildContext ctx,
    ) async {
      try {
        await ref
            .read(authControllerProvider.notifier)
            .submitAuthForm(
              username: username,
              email: email,
              password: password,
              isLogin: isLogin,
            );
      } catch (e) {
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Theme.of(ctx).colorScheme.error,
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Auth Screen')),
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(
        submitFn: submit,
        isLoading: authState.isLoading, 
      ),
    );
  }

}
