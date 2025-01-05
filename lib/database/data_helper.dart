import 'data.dart';

class CourseDataHelper {
  /// Extracts all the values for the provided key from the course data.
  static List<String> getValuesForKey(String key) {
    List<Map<String, String>> courses = CourseData.getCourseData();

    // Extract values for the provided key
    return courses
        .where((course) => course.containsKey(key)) // Ensure the key exists
        .map((course) => course[key]!) // Access the value for the key
        .toList();
  }

  /// Extracts courses where any value matches a string in the provided list.
  static List<Map<String, String>> filterCoursesByValues(List<String> values) {
    List<Map<String, String>> courses = CourseData.getCourseData();

    return courses.where((course) {
      // Check if any course value matches a value in the provided list
      return course.values.any((courseValue) => values.contains(courseValue));
    }).toList();
  }
}
