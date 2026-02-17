import 'package:chat_app/providers/auth_provider.dart';
import 'package:chat_app/screens/auth_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return MaterialApp(
      theme: ChatTheme.lightTheme,
      darkTheme: ChatTheme.darkTheme,
      themeMode: ThemeMode.system,
      // auto switch
      title: 'Flutter Chat App',
      home: authState.when(
        data: (user) {
          if (user != null) {
            return const ChatScreen();
          }
          return const AuthScreen();
        },
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (e, _) => Scaffold(body: Center(child: Text(e.toString()))),
      ),
    );
  }
}
