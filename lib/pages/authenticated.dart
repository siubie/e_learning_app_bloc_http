import 'package:flutter/material.dart';

class AuthenticatedPage extends StatelessWidget {
  const AuthenticatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authenticated Page'),
      ),
      body: const Center(
        child: Text("Welcome to Authenticated Page"),
      ),
    );
  }
}
