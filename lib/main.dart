import 'package:flutter/material.dart';
import 'package:foodie/pages/Auth/login_screen.dart';
import 'package:foodie/pages/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://nouuhfbllojdcngdunsl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5vdXVoZmJsbG9qZGNuZ2R1bnNsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ1NTQ5NjcsImV4cCI6MjA3MDEzMDk2N30.oGx11Z0epMC1dSeknibPElE250wom-dKVY-R5rU7ICM',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Authcheck());
  }
}

class Authcheck extends StatelessWidget {
  final supabase = Supabase.instance.client;
  Authcheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: supabase.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final session = supabase.auth.currentSession;
        if (session != null) {
          return HomeScreen(); // Replace with your actual home screen
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
