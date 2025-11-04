import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MobileAds.instance.initialize();
  runApp(const ShahidWarbahApp());
}

class ShahidWarbahApp extends StatelessWidget {
  const ShahidWarbahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شاهد واربح',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _points = 0;

  void _watchVideo() {
    setState(() {
      _points += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('شاهد واربح المال 💰'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('رصيدك الحالي: $_points نقطة', style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _watchVideo,
              icon: const Icon(Icons.play_circle_fill),
              label: const Text('شاهد فيديو واربح'),
            ),
          ],
        ),
      ),
    );
  }
}
