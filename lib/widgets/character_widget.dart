import 'package:despicable_me/models/character.dart';
import 'package:despicable_me/styleguide.dart';
import 'package:despicable_me/widgets/clipper.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;


    return Stack(
      children:[
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: CharacterCardBackgroundClipper(),
            child: Container(
              height: 0.55 * screenHeight,
              width: 0.9 * screenWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: characters[0].colors,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft
                )
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0,-0.5),
          child: Image.asset(
            characters[0].imagePath,
            height: screenHeight * 0.55,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:48,right: 16, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(characters[0].name, style: AppTheme.heading),
              Text("Click to Read More",style: AppTheme.subHeading),
            ],
          ),
        )
      ],
    );
  }
}

