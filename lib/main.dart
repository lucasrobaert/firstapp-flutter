import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Startup Name Genarator',
      home: RandowWords()
    );
  }
}


class RandowWords extends StatefulWidget {
  @override
  _RandowWordsState createState() => _RandowWordsState();
}

class _RandowWordsState extends State<RandowWords> {

  final _suggestions = <WordPair>[];
  final _saved = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if(i.isOdd){
          return Divider();
        }
        final index = i ~/ 2;
        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair){
    final alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}
