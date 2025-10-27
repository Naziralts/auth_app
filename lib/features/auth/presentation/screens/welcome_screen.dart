import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  final String email;

  const WelcomeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text('Добро пожаловать'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Привет, $email 👋',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E1E2C),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
