import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for rootBundle
import 'package:project_name/Recipe_page/Info.dart';
import 'package:project_name/Recipe_page/food_ImageAnimatio.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  List<dynamic> _recipes = [];

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  Future<void> _loadJson() async {
    final String response = await rootBundle.loadString('assets/test.json');
    final data = json.decode(response);
    setState(() {
      _recipes = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _recipes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
               CarouselFromJson(
                  recipe: _recipes[0], // Pass the first recipe to the carousel
                ),
                // InfoRecipe(recipe: _recipes[1]), 
              ],
            ),
    );
  }
}
