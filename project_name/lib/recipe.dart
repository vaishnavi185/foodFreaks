import 'package:flutter/material.dart';
import 'package:project_name/Home.dart';

class Recipe_page extends StatelessWidget {
  const Recipe_page({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff2C2F38),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset("assets/Iconly/Curved/Arrow.png"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            icon: Image.asset("assets/Iconly/Curved/Heart.png"),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xff2C2F38),
          image: DecorationImage(image: AssetImage("assets/RESBG.png"),fit: BoxFit.cover) ),
          child: Column(
            children: [
              Positioned(child: Container(

              ))
            ],
          ),
      )
     
    );
  }
}
