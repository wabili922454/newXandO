// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'learning',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 214, 73, 2),
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            print('object');
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.menu, color: Colors.black),
          ),
        ),

        actions: [
          GestureDetector(
            onTap: () {
              print('searching');
            },
            child: Container(
              height: 37,
              width: 37,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.search, color: Colors.black),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'WABILI IS HERE TO PRACTISE ON HIS FLUTTER SKILLS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.25),
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 214, 73, 2),
                  ),
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  child: Text(
                    'click me ',
                    style: GoogleFonts.notoSansImperialAramaic(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'so just bear with me ',
                style: GoogleFonts.notoSansImperialAramaic(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
