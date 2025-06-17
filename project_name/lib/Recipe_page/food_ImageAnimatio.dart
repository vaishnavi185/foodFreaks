import 'dart:convert'; // To decode JSON
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // To load asset files
import 'Info.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarouselFromJson extends StatefulWidget {
   final Map<String, dynamic> recipe;
  const CarouselFromJson({super.key ,required this.recipe});

  @override
  State<CarouselFromJson> createState() => _CarouselFromJsonState();
}

class _CarouselFromJsonState extends State<CarouselFromJson> {
  final PageController _pageController = PageController(viewportFraction: 0.5);
  double _currentPage = 0.0;
  int _currentIndex = 0;
  BoxShadow? _dynamicShadow; // Properly typed
  double _opacity = 1.0;
  List<dynamic> _items = [];

  @override
  void initState() {
    super.initState();
    _loadJson();
    _opacity = 0.8;
    _dynamicShadow = const BoxShadow(
      color: Color.fromARGB(159, 0, 0, 0),
      spreadRadius: 5,
      blurRadius: 50,
      offset: Offset(0, 9),
    );

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
       
      });
    });
  }

  Future<void> _loadJson() async {
    final String response = await rootBundle.loadString('assets/test.json');
    final data = json.decode(response);
    setState(() {
      _items = data;
      _currentIndex = 0; // Reset current index when loading new data
    });
  }

  double _calculateScale(int index) {
    return 1.0 - ((_currentPage - index).abs() * 0.5).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
          _items.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  SizedBox(height: screenWidth / 3.5),
                  Center(
                    child: Container(
                      clipBehavior: Clip.none,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: screenWidth / 1.5,
                      width: screenWidth,
                      child: PageView.builder(
                        itemCount: _items.length,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          final scale = _calculateScale(index);
                          final shadow =
                              scale > 0.85 && _dynamicShadow != null
                                  ? [_dynamicShadow!]
                                  : <BoxShadow>[];
                          final opacity = scale < 0.85 ? 0.7 : 1.0;
                          _opacity = opacity; // Update opacity based on scale

                          final imagePath = _items[index]['MainImage'];

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentIndex = index;}); // Update selected index when tapped
                              final selectedItem = _items[index];
                              print('Image tapped: $imagePath');
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder:
                              //         (context) =>
                              //             InfoRecipe(recipe: selectedItem),
                              //   ),
                              // );
                              
                            },
                            child: Transform.scale(
                              scale: scale,
                              child: Opacity(
                                opacity: opacity,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 30,
                                  ),
                                  height: screenWidth,
                                  width: screenWidth,
                                  decoration: BoxDecoration(
                                    boxShadow: shadow,

                                    borderRadius: BorderRadius.circular(
                                      screenWidth,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(imagePath),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      
                    ),
                  ),
                  Center(
        child: Column(
          children: [
            Text(_items.isNotEmpty ? _items[_currentIndex]['Name'] : '',style: TextStyle(
              color: Colors.white,
              fontSize: 24, fontWeight: FontWeight.bold,
              fontFamily: 'Gilroy',
              )),
              
              Text(_items.isNotEmpty ? _items[_currentIndex]['Description'] ?? "No Description available" : '',
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
                          'assets/Iconly/Curved/Star.svg',
                          color: Color(0xff686F82),
                          width: 20, 
                          height: 20,

                          ),
                        Text(_items.isNotEmpty ? (_items[_currentIndex]['rate'] ?? 'N/A') : 'N/A',
                          style: TextStyle(
                            color: Color(0xff686F82),
                            fontSize: 16, fontWeight: FontWeight.normal,
                            fontFamily: 'Gilroy',
                          )),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                   Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/stopwatch-start.svg',
                          color: Color(0xff686F82),
                          width: 20, 
                          height: 20,

                          ),
                        Text(_items.isNotEmpty?(_items[_currentIndex]['Time'] ?? 'N/A' ) : 'N/A',
                          style: TextStyle(
                            color: Color(0xff686F82),
                            fontSize: 16, fontWeight: FontWeight.normal,
                            fontFamily: 'Gilroy',
                          )),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/fo-hot-trend.svg',
                          color: Color(0xff686F82),
                          width: 20, 
                          height: 20,
                          ),
                        Text(
                          _items.isNotEmpty?( _items[_currentIndex]['Kcal']?? 'N/A') : 'N/A',
                          style: TextStyle(
                            color: Color(0xff686F82),
                            fontSize: 16, fontWeight: FontWeight.normal,
                            fontFamily: 'Gilroy',
                          )),
                      ],
                    ),
                  ),
                 
                ],
               )
        
          ],
        ),
      )
      ],
       ),
    );
  }
}
