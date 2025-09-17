// ignore_for_file: sort_child_properties_last, deprecated_member_use, avoid_print
// ↑ This line tells the Flutter analyzer to ignore certain lint rules:
// - sort_child_properties_last: usually requires properties like `child:`
//   to come after other properties, but we’re ignoring that here.
// - deprecated_member_use: silences warnings when using Flutter APIs
//   that may eventually be replaced in the future.

import 'package:flutter/material.dart';

// This widget represents a simple screen with:
// - A custom AppBar (created with barrs())
// - A search-like TextField inside a decorated container
//
// It’s a StatelessWidget, meaning its layout doesn’t change by itself.
// If you wanted dynamic updates (e.g., reacting to typing), you’d use StatefulWidget.
class Home3 extends StatelessWidget {
  const Home3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar is separated into its own function (barrs) for readability
      appBar: barrs(),

      // Sets the background for the entire page
      backgroundColor: Colors.white,

      // The main body of the page
      body: Column(
        children: [
          // A container is used here mostly for styling and spacing
          Container(
            // Controls external spacing (around the text field)
            margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),

            // Gives the text field a subtle shadow (card-like effect)
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 80, 18, 33).withOpacity(0.11),
                  blurRadius: 20, // how soft/blurry the shadow appears
                  spreadRadius: 0.0, // how far the shadow extends
                ),
              ],
            ),

            // Main input field
            child: TextField(
              // InputDecoration controls how the field looks
              decoration: InputDecoration(
                filled: true, // makes the background inside the field solid
                fillColor: Colors.white, // white field background
                hintText: '   wabili is the goat    ', // placeholder text
                hintStyle: TextStyle(color: Colors.grey, fontSize: 20),

                // Space between text and borders/icons
                contentPadding: EdgeInsets.all(15),

                // Left icon (before the text) → looks like a search bar
                prefixIcon: Icon(Icons.search),

                // Right icon (after the text) → could be used to add an image
                suffixIcon: Icon(Icons.add_a_photo),

                // Custom border: rounded corners, no visible border line
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom AppBar widget extracted into its own function for cleaner code.
  // Contains:
  // - A title in the center
  // - A left "back" button
  // - A right "forward" button
  AppBar barrs() {
    return AppBar(
      // Center title text
      title: Text(
        'WABILI IS HIM',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white, // white app bar background
      elevation: 0, // removes the default app bar shadow
      centerTitle: true, // centers the title
      // Leading widget (left side of AppBar)
      // Used here as a back button with custom styling
      leading: GestureDetector(
        // Tap event callback
        onTap: () {
          print('father ');
        },
        child: Container(
          margin: EdgeInsets.all(10), // spacing between button and screen edges
          alignment: Alignment.center,
          child: Icon(Icons.arrow_back, color: Colors.grey), // back arrow
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.40), // translucent grey background
            borderRadius: BorderRadius.circular(10), // rounded square button
          ),
        ),
      ),

      // Actions widget (right side of AppBar)
      // Here it’s used as a "forward" button
      actions: [
        GestureDetector(
          onTap: () {
            print('is the son wabili');
          },
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37, // fixes button size
            child: Icon(Icons.more_vert_sharp, color: Colors.grey),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.40),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
