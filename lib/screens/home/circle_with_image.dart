import 'package:flutter/material.dart';

class CircleWithImage extends StatelessWidget {
  final String imageUrl; // The image URL or asset path for the icon
  final String smallerImageUrl; // The URL or asset path for the smaller image

  const CircleWithImage({
    Key? key,
    required this.imageUrl,
    required this.smallerImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Large Circle with the image
        ClipOval(
          child: Image.network(
            imageUrl,
            width: 50.0, // Size of the large circle
            height: 50.0,
            fit: BoxFit.cover,
          ),
        ),
        // Smaller circle at the bottom right
        Positioned(
          right: 0,
          bottom: 0,
          child: ClipOval(
            child: Image.network(
              smallerImageUrl,
              width: 25.0, // Size of the smaller circle
              height: 25.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
