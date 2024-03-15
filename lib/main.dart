import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bubble Brain',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bubble Brain'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _theNumber = Random().nextInt(10);
  double _maxNumber = 10;
  double _sliderValue = 1;

  void _resetTheNumber() {
    setState(() {
      _theNumber = Random().nextInt(_maxNumber.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choose a number between 0 and $_maxNumber:',
            ),
            const SizedBox(height: 20),
            Slider(
              value: _sliderValue,
              min: 1,
              max: 7,
              divisions: 6,
              label: _maxNumber.toString(),
              onChanged: (value) {
                setState(
                  () {
                    _sliderValue = value;
                    _maxNumber = pow(10, _sliderValue).toDouble();
                    _theNumber = Random().nextInt(_maxNumber.toInt());
                  },
                );
              },
            ),
            const Text(
              'The random number is:',
            ),
            Text(
              '$_theNumber',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _resetTheNumber,
        tooltip: 'Increment',
        child: const Icon(Icons.start_sharp),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
