import 'package:flutter/material.dart';

void main() {
  runApp(const ShahidWarbahApp());
}

class ShahidWarbahApp extends StatelessWidget {
  const ShahidWarbahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شاهد واربح',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('شاهد واربح')),
      body: const Center(child: Text('مرحبًا بك في تطبيق شاهد واربح 👋')),
    );
  }
}