import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Button Page"),
      ),
      body: Stack(
        children: <Widget>[
          // Scrollable content (three containers)
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                bottom: 120), // Add more space for the FAB
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  color: Colors.red,
                  child: const Center(
                      child: Text('Container 1',
                          style: TextStyle(color: Colors.white, fontSize: 24))),
                ),
                Container(
                  height: 200,
                  color: Colors.green,
                  child: const Center(
                      child: Text('Container 2',
                          style: TextStyle(color: Colors.white, fontSize: 24))),
                ),
                Container(
                  height: 200,
                  color: Colors.blue,
                  child: const Center(
                      child: Text('Container 3',
                          style: TextStyle(color: Colors.white, fontSize: 24))),
                ),
                Container(
                  height: 200,
                  color: Colors.amber,
                  child: const Center(
                      child: Text('Container 4',
                          style: TextStyle(color: Colors.white, fontSize: 24))),
                ),
              ],
            ),
          ),

          // Floating action button (larger size, aligned bottom center)
          Positioned(
            bottom: 20, // Distance from the bottom of the screen
            left: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width -
                  40, // Set the width of the FAB (larger size)
              height: 60,
              child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.blue,
                  elevation: 10, // Optional: custom background color
                  child: const Text(
                      "Submit") // Optional: to give it a shadow effect
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
