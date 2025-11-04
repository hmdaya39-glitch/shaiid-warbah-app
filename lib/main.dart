import 'package:flutter/material.dart';

void main() {
  runApp(const ShahidWarbahApp());
}

class ShahidWarbahApp extends StatelessWidget {
  const ShahidWarbahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شاهد واربح المال',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('شاهد واربح المال'),
      ),
      body: const Center(
        child: Text(
          'أهلاً بك في تطبيق شاهد واربح المال 🎬💰',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
