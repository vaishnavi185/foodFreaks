import 'dart:convert'; // To decode JSON
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // To load asset files

class CarouselFromJson extends StatefulWidget {
  const CarouselFromJson({super.key});

  @override
  State<CarouselFromJson> createState() => _CarouselFromJsonState();
}

class _CarouselFromJsonState extends State<CarouselFromJson> {
  final PageController _pageController = PageController(viewportFraction: 0.5);
  double _currentPage = 0.0;

  // List to hold decoded JSON items
  List<dynamic> _items = [];

  @override
  void initState() {
    super.initState();

    // Load JSON data from assets on initialization
    _loadJson();

    // Listen to page scroll for zooming logic
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  // Function to load and parse JSON file from assets
  Future<void> _loadJson() async {
    // Load the raw string from the asset file
    final String response = await rootBundle.loadString('assets/test.json');

    // Decode the JSON string into a Dart list
    final data = json.decode(response);

    // Update state with parsed data
    setState(() {
      _items = data;
    });
  }

  // Function to calculate zoom scale for each image
  double _calculateScale(int index) {
    return 1.0 - ((_currentPage - index).abs() * 0.5).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
          _items.isEmpty
              ? const Center(child: CircularProgressIndicator()) // Show loading
              : Center(
                child: SizedBox(
                  height: Width/2,width: Width,
                  child: PageView.builder(
                    itemCount: _items.length,
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      final scale = _calculateScale(index);

                      // ✅ Accessing image path from decoded JSON data
                      final imagePath = _items[index]['MainImage'];

                      return Transform.scale(
                        scale: scale,
                        child: Container( height: Width/20, width:Width/20 ,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 18, 18, 18).withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 50,
                               offset: Offset(0, 9),
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(Width)),
                          image:DecorationImage
                          (image: AssetImage(imagePath),fit: BoxFit.fill,)), 
                        ),
                      );
                    },
                  ),
                ),
              ),
    );
  }
}
