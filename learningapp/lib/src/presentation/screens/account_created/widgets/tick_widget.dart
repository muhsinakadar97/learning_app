import 'package:flutter/material.dart';

class TickWidget extends StatelessWidget {
  const TickWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.pink[50], // Light pink background
        borderRadius: BorderRadius.circular(
            100), // Circular border radius for a pill shape
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFCE4EC).withOpacity(0.5),
            // color: const Color(0xFFE91E63)
            //     .withOpacity(0.5), // Pink shadow with 50% opacity
            blurRadius: 2, // How blurry the shadow is
            spreadRadius: 2, // How far the shadow spreads
            offset:
                const Offset(4, 8), // Shadow position relative to the container
          ),
        ],
      ),
      child: Image.asset(
        'assets/images/success.png', // Your image asset
        fit: BoxFit
            .cover, // Ensures the image fills the container without distortion
      ),
    );
  }
}
