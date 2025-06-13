import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class InfoRecipe extends StatefulWidget {
  final Map<String, dynamic> recipe;
  const InfoRecipe({super.key, required this.recipe});
  // This widget receives recipe data as a parameter
  @override
  State<InfoRecipe> createState() => _InfoRecipeState();
}

class _InfoRecipeState extends State<InfoRecipe> {
  @override
 
  // List <dynamic> recipe = [];
  // Future<void> readJson() async {
  //     final String response = await DefaultAssetBundle.of(context)
  //         .loadString('assets/test.json');
  //         final data = await json.decode(response);
  //     setState(() {
  //       recipe = data;
  //     });
      // Implement your JSON reading logic here
    // }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: 
      Center(
        child: Column(
          children: [
            Text(widget.recipe['Name'] ,style: TextStyle(
              color: Colors.white,
              fontSize: 24, fontWeight: FontWeight.bold,
              fontFamily: 'Gilroy',
              )),
              Text(widget.recipe['Description'] ?? " no Description available",
               textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff686F82),
                
                fontSize: 16, fontWeight: FontWeight.normal,
                fontFamily: 'Gilroy',
              )),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/stopwatch-start.svg',
                          color: Color(0xff686F82),
                          width: 20, 
                          height: 20,

                          ),
                        Text("Time: ${widget.recipe['Time'] ?? 'N/A'}",
                          style: TextStyle(
                            color: Color(0xff686F82),
                            fontSize: 16, fontWeight: FontWeight.normal,
                            fontFamily: 'Gilroy',
                          )),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("Servings: ${widget.recipe['Servings'] ?? 'N/A'}",
                    style: TextStyle(
                      color: Color(0xff686F82),
                      fontSize: 16, fontWeight: FontWeight.normal,
                      fontFamily: 'Gilroy',
                    )),
                ],
               )
        
          ],
        ),
      )
    );
  }
}