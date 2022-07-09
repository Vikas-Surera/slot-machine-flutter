import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _options = ['apple.png', 'cherry.png', 'star.png'];

  String _slot1 = 'star.png';
  String _slot2 = 'star.png';
  String _slot3 = 'star.png';

  int _credits = 1000;

  void _runSlot() {
    Random random = Random();

    final int rand1 = 0 + random.nextInt(3);
    final int rand2 = 0 + random.nextInt(3);
    final int rand3 = 0 + random.nextInt(3);

    setState(() {
      if (rand1 == rand2 && rand2 == rand3) {
        _credits += 200;
      } else {
        _credits -= 25;
      }

      _slot1 = _options[rand1];
      _slot2 = _options[rand2];
      _slot3 = _options[rand3];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'FlutterUI Slots! ',
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const Spacer(),
            Text('Credits: $_credits'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Row(
                children: [
                  Flexible(child: Image.asset('assets/$_slot1')),
                  Flexible(child: Image.asset('assets/$_slot2')),
                  Flexible(child: Image.asset('assets/$_slot3')),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              ),
              onPressed: _runSlot,
              child: const Text('Spin'),
            ),
            const Spacer(),
          ],
        ),
      ),
    ));
  }
}
