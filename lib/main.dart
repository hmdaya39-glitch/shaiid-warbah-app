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
      title: 'شاهد واربح المال',
      home: Scaffold(
        appBar: AppBar(title: const Text('شاهد واربح المال')),
        body: const Center(
          child: Text(
            'أهلاً بك في تطبيق شاهد واربح 👋',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
