import 'package:flutter/material.dart';

class Frorm extends StatefulWidget {
  const Frorm({super.key});

  @override
  State<Frorm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Frorm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: const Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align children to the start
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
            ), // Add equal padding from the left
            child: Text(
              'Enter your',
              style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0), // Same padding as above
            child: Text(
              'information',
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Column(
            children: [
              Container(
                height: 500.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xFF1E293B),
                ),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align children to the top
                  mainAxisAlignment:
                      MainAxisAlignment
                          .start, // Align children to the start horizontally
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        10.0,
                      ), // Add some padding if needed
                      child: Text(
                        "First Name",
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 100),
                    Padding(
                      padding: const EdgeInsets.all(
                        10.0,
                      ), // Add some padding if needed
                      child: Text(
                        "Last Name",
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
