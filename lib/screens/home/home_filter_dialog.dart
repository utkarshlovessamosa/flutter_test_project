import 'package:flutter/material.dart';
import 'package:flutter_test_project/styles/app_colors.dart';
import '../../database/data.dart'; // Import CourseData
import '../../database/data_helper.dart';

class FilterDialog extends StatefulWidget {
  final Function(List<String>) onApplyFilters;

  const FilterDialog({Key? key, required this.onApplyFilters})
      : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  final List<String> filterOptions = [
    "Sort By",
    "Location",
    "Training Name",
    "Trainer"
  ];
  final Map<String, List<String>> filterItems = {
    "Sort By": ["Date", "Price", "Rating"],
    "Location": CourseDataHelper.getValuesForKey("location"),
    "Training Name": CourseDataHelper.getValuesForKey("title"),
    "Trainer": CourseDataHelper.getValuesForKey("trainerName")
  };

  String selectedFilterOption = "Location";
  List<String> selectedOptions = [];

  List<String> selectedItems = [];
  List<Map<String, String>> courseData = CourseData.getCourseData();

  @override
  void initState() {
    super.initState();
    selectedItems = filterItems["Location"]!;
  }

  void searchItem(String value) {
    print(value);
  }

  List<Map<String, String>> _getFilteredCourses() {
    if (selectedFilterOption == "Location") {
      return courseData
          .where((course) => selectedItems.contains(course["location"]))
          .toList();
    } else if (selectedFilterOption == "Trainer") {
      return courseData
          .where((course) => selectedItems.contains(course["trainerName"]))
          .toList();
    } else if (selectedFilterOption == "Training Name") {
      return courseData
          .where((course) => selectedItems.contains(course["title"]))
          .toList();
    }
    return courseData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.65,
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sorts and Filters",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.grey,
                iconSize: 24.0,
              ),
            ],
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Material(
                            color: Colors.white,
                            child: ListView.builder(
                              itemCount: filterOptions.length,
                              itemBuilder: (context, index) {
                                bool isSelected = filterOptions[index] ==
                                    selectedFilterOption;

                                return isSelected
                                    ? Container(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned.fill(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      color: Color(AppColors
                                                          .tertiaryColor), // Top part color
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 30,
                                                    child: Container(
                                                      color: Color(AppColors
                                                          .primaryColor), // Bottom part color
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ListTile(
                                              tileColor: Color(AppColors
                                                  .primaryVariantColor),
                                              title: Text(
                                                filterOptions[index],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  selectedFilterOption =
                                                      filterOptions[index];
                                                  selectedItems = filterItems[
                                                      selectedFilterOption]!;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                      )
                                    : ListTile(
                                        tileColor: Color(
                                            AppColors.primaryVariantColor),
                                        title: Text(
                                          filterOptions[index],
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selectedFilterOption =
                                                filterOptions[index];
                                            selectedItems = filterItems[
                                                selectedFilterOption]!;
                                          });
                                        },
                                      );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Search",
                            labelStyle: TextStyle(
                                color: Colors.grey[600]), // Label text color
                            prefixIcon: Icon(Icons.search,
                                color: Colors.grey[600]), // Icon color
                            fillColor: Colors.white, // Background color
                            filled: true, // Enables the background color
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey), // Default border color
                              borderRadius:
                                  BorderRadius.circular(4.0), // Rounded corners
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Colors.grey[600]!), // Border when focused
                              borderRadius:
                                  BorderRadius.circular(4.0), // Rounded corners
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .grey[400]!), // Border when not focused
                              borderRadius:
                                  BorderRadius.circular(4.0), // Rounded corners
                            ),
                          ),
                          onChanged: searchItem,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: selectedItems.length,
                          itemBuilder: (context, index) {
                            var filteredCourses = _getFilteredCourses();
                            String courseTitle =
                                filteredCourses[index]["title"] ?? "Unknown";

                            String optionName = selectedItems[index];
                            // Track the selected checkboxes
                            bool isSelected =
                                selectedOptions.contains(optionName);

                            return Row(
                              children: [
                                // The Checkbox remains the same
                                Checkbox(
                                  value: isSelected,
                                  checkColor: Color(AppColors.primaryColor),
                                  activeColor: Color(AppColors.tertiaryColor),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (value == true) {
                                        selectedOptions.add(
                                            optionName); // Add to selected items
                                      } else {
                                        selectedOptions.remove(
                                            optionName); // Remove from selected items
                                      }
                                      widget.onApplyFilters(selectedOptions);
                                    });
                                  },
                                ),

                                // Wrap the text with GestureDetector or InkWell to make it clickable
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // Trigger the checkbox change when text is tapped
                                        isSelected = !isSelected;
                                        if (isSelected) {
                                          selectedOptions.add(
                                              optionName); // Add to selected items
                                        } else {
                                          selectedOptions.remove(
                                              optionName); // Remove from selected items
                                        }
                                        widget.onApplyFilters(selectedOptions);
                                      });
                                    },
                                    child: Text(optionName),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
