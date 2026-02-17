import 'package:flutter/material.dart';
import 'package:chat_app/theme.dart';
import 'package:chat_app/screens/auth_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ChatTheme.lightTheme,
      darkTheme: ChatTheme.darkTheme,
      themeMode: ThemeMode.system,
      // auto switch
      title: 'Flutter Chat App',
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapShots) {
          if (userSnapShots.hasData) {
            return ChatScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}
