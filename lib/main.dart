import 'package:chatapp/chat_page.dart';
import 'package:chatapp/core/theme/theme.dart';
import 'package:chatapp/features/auth/login_page.dart';
import 'package:chatapp/message_page.dart';
import 'package:chatapp/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      home: const LoginPage(),
    );
  }
}
