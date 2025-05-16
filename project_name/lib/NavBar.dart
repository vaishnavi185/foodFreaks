import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: <Widget>[
        const Center(child:Text("home")),
        const Center(child:Text("barcode")),
        const Center(child:Text("profile"))
      ][currentPageIndex],
      bottomNavigationBar:
      Container(
        decoration: BoxDecoration(
          color: Color(0xff252830).withOpacity(0.8),
          borderRadius: BorderRadius.vertical(top: Radius.circular(46))
        ),
        padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          height: 72,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index){
            setState(() {
              currentPageIndex = index ;

            });
          },
          destinations: <Widget>[
            buildDestination(Icons.home_outlined, Icons.home_filled,0),
            buildDestination(Icons.qr_code_scanner_outlined, Icons.qr_code_scanner_outlined,1),
            buildDestination(Icons.person_4_outlined, Icons.person_4_outlined,2),
          ]
          ),
      )

    );
  }
  NavigationDestination buildDestination(IconData icon,IconData selectedicon, int index){
    final bool isSelected = currentPageIndex == index;
    return NavigationDestination( label: "", icon: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isSelected ? selectedicon :icon,
          color: Color(0xffA3A9BA),
        ),
        const SizedBox(height: 4),
      ],
    ),
    selectedIcon: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          selectedicon,
          color: Color(0xffFF7269),
        ),
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffFF7269),
          ),
        )
      ],
    ),
    );
  }
}
