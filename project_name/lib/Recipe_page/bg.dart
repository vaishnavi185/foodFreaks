import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_name/Home.dart';

class Recipe_bg extends StatelessWidget {
  const Recipe_bg({super.key});

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
      body: LayoutBuilder(
        builder: (context,constraints) {
          final Width = constraints.maxWidth;
          final circleDiameter = Width * 2;
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xff2C2F38),
              image: DecorationImage(image: AssetImage("assets/RESBG.png"),fit: BoxFit.cover) ),
              child: Stack(
                children: [
                  Positioned( top: Width/5,
                  left: (Width - (Width /2))/3,

                    child: Image.asset("assets/foodbg.png",height: Width/2.5,)
                   ),
                  Positioned(
                    bottom: -circleDiameter/5+50,
                    left: -Width / 2,
                    child: Container(
                    width: circleDiameter,
                      height: circleDiameter,
                      decoration: BoxDecoration(
                        color: Color(0xff272A32),
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("assets/Rectangle.png"))
                      ),
                  )),
                  
                ],
              ),
          );
        }
      )
     
    );
  }
}
