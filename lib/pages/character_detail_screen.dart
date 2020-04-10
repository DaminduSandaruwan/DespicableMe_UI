import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatefulWidget {
  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[ 
          Icon(Icons.close),
        ],
      ),
    );
  }
}
