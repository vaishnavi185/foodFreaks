import 'dart:convert';

import 'package:flutter/material.dart';

class InfoRecipe extends StatefulWidget {
  const InfoRecipe({super.key});

  @override
  State<InfoRecipe> createState() => _InfoRecipeState();
}

class _InfoRecipeState extends State<InfoRecipe> {
  @override
  List <dynamic> recipes = [];
  Future<void> readJson() async {
      final String response = await DefaultAssetBundle.of(context)
          .loadString('assets/test.json');
          final data = await json.decode(response);
      setState(() {
        recipes = data;
      });
      // Implement your JSON reading logic here
    }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: 
      Column(
        children: [

        ],
      )
    );
  }
}