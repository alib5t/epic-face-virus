import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    playSound();
  }

  Future<void> playSound() async {
    await player.setReleaseMode(ReleaseMode.loop);
    await player.play(AssetSource('sound.mp3'));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/image.png',
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
            ),
            const Text(
              'YOU FOUND THE EPİC FACE!!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}