import 'package:flutter/material.dart';
import '../../styles/app_colors.dart';

class HomeDetailsScreen extends StatelessWidget {
  final Map<String, String> course;

  HomeDetailsScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course['title'] ?? 'Course Details', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Color(AppColors.tertiaryColor),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white, // Make the back button color white
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Image
            Image.network(
              course['imageUrl'] ?? '',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),

            // Course Title
            Text(
              course['title'] ?? 'No title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // Course Location
            Text(
              'Location: ${course['location'] ?? 'No location'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),

            // Course Dates
            Text(
              'Dates: ${course['dates'] ?? 'No dates available'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),

            // Course Trainer
            Text(
              'Trainer: ${course['trainerName'] ?? 'No trainer'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            // Course Price
            Text(
              'Price: \$${course['price'] ?? 'N/A'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Course Description (optional)
            Text(
              course['description'] ?? 'No description available',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
