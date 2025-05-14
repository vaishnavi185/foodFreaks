import 'package:flutter/material.dart';

class ImgAnimation extends StatefulWidget {
  const ImgAnimation({super.key});

  @override
  State<ImgAnimation> createState() => _ImgAnimationState();
}

class _ImgAnimationState extends State<ImgAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool zoomedIn = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _toggleZoom() {
    if (zoomedIn) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    zoomedIn = !zoomedIn;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(height: Width/4,
            width: Width/4,
            margin: EdgeInsets.all(Width/9),
              decoration: BoxDecoration( 
              borderRadius: BorderRadius.all(Radius.circular(100)),
              image: DecorationImage(image: AssetImage("assets/unsplash_fdlZBWIP0aM.png"),fit: BoxFit.fill)
            ),),
            Container(height: Width/4,
            width: Width/4,
            margin: EdgeInsets.all(Width/9),
              decoration: BoxDecoration( 
              borderRadius: BorderRadius.all(Radius.circular(100)),
              image: DecorationImage(image: AssetImage("assets/unsplash_fdlZBWIP0aM.png"),fit: BoxFit.fill)
            ),),
            Container(height: Width/4,
            width: Width/4,
            margin: EdgeInsets.all(Width/20),
              decoration: BoxDecoration( 
              borderRadius: BorderRadius.all(Radius.circular(100)),
              image: DecorationImage(image: AssetImage("assets/unsplash_fdlZBWIP0aM.png"),fit: BoxFit.fill)
            ),),
          ],
        ),
      )
    );
  }
}