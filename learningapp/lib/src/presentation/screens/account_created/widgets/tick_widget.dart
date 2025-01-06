import 'package:flutter/material.dart';

class TickWidget extends StatelessWidget {
  const TickWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10, // Set the elevation value here
      shadowColor:
          Colors.pink.withOpacity(0.3), // Optional: Customize the shadow color
      borderRadius: BorderRadius.circular(100),

      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.pink[50],
          // Light pink background
          borderRadius: BorderRadius.circular(
              100), // Circular border radius for a pill shape
          // boxShadow: const [
          //   BoxShadow(
          //     color: Color.fromRGBO(252, 228, 236, 1), // shadow color
          //     spreadRadius: 4,
          //     blurRadius: 5,
          //     offset: Offset(4, 4), // Shadow position relative to the container
          //   ),
          // ],
        ),
        child: Image.asset(
          'assets/images/success.png', // Your image asset
          fit: BoxFit
              .cover, // Ensures the image fills the container without distortion
        ),
      ),
    );
  }
}
