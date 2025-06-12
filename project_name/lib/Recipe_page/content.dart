import 'package:flutter/material.dart';
import 'package:project_name/Recipe_page/Info.dart';
import 'package:project_name/Recipe_page/food_ImageAnimatio.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          CarouselFromJson(),
        
        ],
      ),
    );
  }
}
