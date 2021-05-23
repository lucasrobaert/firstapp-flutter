import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Welcome to flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body:  Center(
          child: RandowWords(),
        ),
      ),
    );
  }
}


class RandowWords extends StatefulWidget {
  @override
  _RandowWordsState createState() => _RandowWordsState();
}

class _RandowWordsState extends State<RandowWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}
