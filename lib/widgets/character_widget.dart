import 'package:despicable_me/models/character.dart';
import 'package:despicable_me/pages/character_detail_screen.dart';
import 'package:despicable_me/styleguide.dart';
import 'package:despicable_me/widgets/clipper.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;

  const CharacterWidget({Key key, this.character}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;


    return InkWell(
      onTap: (){
        Navigator.push(context, PageRouteBuilder(
          transitionDuration: const Duration(milliseconds:350),
          pageBuilder: (context, _, __) => CharacterDetailScreen(character:character)
        ));
      },
      child: Stack(
        children:[
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: CharacterCardBackgroundClipper(),
              child: Hero(
                tag: "background-${character.name}",
                child: Container(
                  height: 0.55 * screenHeight,
                  width: 0.9 * screenWidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: character.colors,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft
                    )
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0,-0.5),
            child: Hero(
              tag: "image-${character.name}",
              child: Image.asset(
                character.imagePath,
                height: screenHeight * 0.55,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:48,right: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: "name-${character.name}",
                  child: Material(
                    color: Colors.transparent,
                    child: Container(                    
                      child: Text(
                        character.name, 
                        style: AppTheme.heading
                        )
                      )
                    ),
                ),
                Text("Click to Read More",style: AppTheme.subHeading),
              ],
            ),
          )
        ],
      ),
    );
  }
}

