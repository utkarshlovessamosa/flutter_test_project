// Stores data to be populated at different components, could be replaced by database integrations in the future

import 'package:flutter/material.dart';
import '../../styles/app_colors.dart';
import 'circle_with_image.dart';
import 'dotted_line_painter.dart';

class HomeListViewItem extends StatelessWidget {
  final String? title;
  final String? dates;
  final String? trainerName;
  final String? courseStatus;
  final String? location;
  final String? time;
  final String? imageUrl;
  final String? smallerImageUrl;
  final VoidCallback onTap;

  const HomeListViewItem({
    Key? key,
    required this.title,
    required this.dates,
    required this.trainerName,
    required this.courseStatus,
    required this.location,
    required this.time,
    required this.onTap,
    required this.imageUrl,
    required this.smallerImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 210,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dates ?? "",
                        style: const TextStyle(
                          fontSize: 18.0, // Custom font size
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        time ?? "",
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    location ?? "",
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Dotted Line Separator (with height constraint or full expansion)
            Container(
              height: 150, // Ensures it stretches vertically
              child: CustomPaint(
                painter: DottedLinePainter(),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseStatus ?? "",
                        style: const TextStyle(
                          fontSize: 12.0, // Custom font size
                          fontWeight: FontWeight.bold,
                          color: Color(AppColors.tertiaryColor),
                        ),
                      ),
                      Text(
                        title ?? "",
                        style: const TextStyle(
                          fontSize: 18.0, // Custom font size
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleWithImage(
                              imageUrl: imageUrl ?? "",
                              smallerImageUrl: smallerImageUrl ?? ""),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Keynote Speaker",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(trainerName ?? "")
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment:
                        Alignment.bottomRight, // Align the button to the right
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle the button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(AppColors
                            .tertiaryColor), // Set the background color to red
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0), // Optional: adjust padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              4.0), // Optional: add rounded corners
                        ),
                      ),
                      child: Text(
                        "Enrol Now",
                        style: TextStyle(
                            color: Colors.white, // White text
                            fontWeight: FontWeight.bold,
                            fontSize: 16 // Bold text
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
