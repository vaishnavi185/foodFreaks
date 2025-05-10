import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_name/login.dart';
// import 'package:new_flutter/login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFF6532), // Orange background
      body: Stack(
        children: [
          // Black Container with Rounded Top
          Positioned(
            top: size.height * 0.10, // Positioned lower for aesthetics
            child: Container(
              height: size.height *1, // Takes up the rest of the screen
              width: size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF262930),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(92),
                  topRight: Radius.circular(92),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(40, 60, 30, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    Text(
                  "Getting Started",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "create account to continue",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                    color: const Color(0XFF8B8787),
                  ),
                ),
                SizedBox(height: 9),
                Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            print('Facebook clicked');
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            size: 35,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 2),
                        IconButton(
                          onPressed: () {
                            print('Google clicked');
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.facebook,
                            size: 35,
                            color: const Color(0xff4268B3),
                          ),
                        ),
                      ],
                    ),
                    //
                    // const SizedBox(height: 90),
                    // Google Signup Icon
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     GestureDetector(
                    //       onTap: () {
                    //         // TODO: Add Google Sign-In functionality
                    //       },
                    //       child: const FaIcon(
                    //         FontAwesomeIcons.google,
                    //         size: 30,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    const SizedBox(height: 60),

                    // Email Input
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Email Input
                      Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email, color: Colors.grey),
                            hintText: "Enter your email",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),

                      // Username Input
                      Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person, color: Colors.grey),
                            hintText: "Enter your username",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),

                      // Password Input
                      Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                            hintText: "Enter your password",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:const Color(0xff1E1E1E),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "SIGNUP",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Signup Link

                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize
                            .min, // Makes the row take only necessary space
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Centers the children inside the row
                        children: [
                          Text(
                            "Already have Account?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                            textAlign: TextAlign.center,
                          ),SizedBox(
                            width: 7,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login()),
                              );
                            },
                            child: const Text(
                              "login",
                              style: TextStyle(
                                color: Color.fromARGB(255, 249, 136, 7),
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                              
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Welcome Text Above the Container
          // Positioned(
          //   top: MediaQuery.of(context).size.height * 0.35, // 30% from the top
          //   left: MediaQuery.of(context).size.width * 0.05, // 5% from the left

          //   child: Column(
          //     children: [
          //       Text(
          //         "Getting Started",
          //         style: TextStyle(
          //           fontSize: 25,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white,
          //         ),
          //       ),
          //       SizedBox(height: 2),
          //       Text(
          //         "create account to continue",
          //         style: TextStyle(
          //           fontSize: 15,
          //           color: Colors.white70,
          //         ),
          //       ),
          //       SizedBox(height: 9),
          //       Row(
          //            mainAxisAlignment: MainAxisAlignment.start,
          //             children: [
          //              const SizedBox(width: 10),
          //               IconButton(
          //                 onPressed: () {
          //                   print('Facebook clicked');
          //                 },
          //                 icon: FaIcon(
          //                   FontAwesomeIcons.google,
          //                   size: 30,
          //                   color: Colors.blue,
          //                 ),
          //               ),
          //               const SizedBox(width: 2),
          //               IconButton(
          //                 onPressed: () {
          //                   print('Google clicked');
          //                 },
          //                 icon: FaIcon(
          //                   FontAwesomeIcons.facebook,
          //                   size: 30,
          //                   color: Colors.red,
          //                 ),
          //               ),
          //             ],
          //           ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}