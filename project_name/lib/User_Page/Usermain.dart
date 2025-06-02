import 'package:flutter/material.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x2B2E37),
      appBar: AppBar(
          backgroundColor: Color(0x2B2E37),
        title: Text("Good Morning",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w200,
        color: Color(0xFF686F82),

        ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.person_pin))
        ],
        
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Find your dishes",
              
              prefixIcon: Icon(Icons.search),
              filled: true,
              // ...existing code...
fillColor: Color(0xFF252830),
// ...existing code...
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Row(
            children: [
              Text("Recent Views"),
              SizedBox(width: 10),
              Text("All"),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios),
              )
            ],
          )
        ],

      ),
      
    );
  }
}
