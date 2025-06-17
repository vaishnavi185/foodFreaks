import 'package:flutter/material.dart';
import 'package:project_name/Recipe_page/bg.dart';
import 'package:project_name/Recipe_page/content.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Recipe_bg(),
          Positioned(
            top: -(Width/11), // Negative value moves it upward, adjust as needed
            left: 0,
            right: 0,
            bottom: 0,
            child: Content(),
          ),
        ],
      ),
    );
  }
}