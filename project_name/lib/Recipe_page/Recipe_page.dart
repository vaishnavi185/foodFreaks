import 'package:flutter/material.dart';
import 'package:project_name/Recipe_page/bg.dart';
import 'package:project_name/Recipe_page/content.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold
    (
      body: Stack(
        children: [ Recipe_bg(),
        Content(),
          
        ],
      ),
    );
  }
}