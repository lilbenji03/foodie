import 'package:flutter/material.dart';
import 'package:foodie/service/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => authService.logout(context),
            child: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
