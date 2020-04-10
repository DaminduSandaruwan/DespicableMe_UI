

import 'package:despicable_me/models/character.dart';
import 'package:despicable_me/styleguide.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatefulWidget {
  final Character character;

  const CharacterDetailScreen({Key key, this.character}) : super(key: key);

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.character.colors,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft
              )
            ),
          ),
          SingleChildScrollView(            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[ 
                SizedBox(height: 40),              
                Padding(
                  padding: const EdgeInsets.only(top:8.0, left: 16),
                  child: IconButton(
                    iconSize: 40,
                    icon:Icon(Icons.close), 
                    color: Colors.white.withOpacity(0.9),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    widget.character.imagePath, 
                    height:screenHeight*0.45 ,
                  )
                ),
                Text(
                  widget.character.name,
                  style: AppTheme.heading,
                ),
                Text(
                  widget.character.description,
                  style: AppTheme.subHeading,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
