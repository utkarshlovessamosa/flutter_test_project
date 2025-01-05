import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_test_project/database/data_helper.dart';
import 'package:flutter_test_project/screens/home/home_list_view_item.dart';
import 'package:get/get.dart';
import '../../database/data.dart';
import '../../styles/app_colors.dart';
import 'home_filter_dialog.dart';
import 'details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();  // GlobalKey for Scaffold

  List<Map<String, String>> _courseData = CourseData.getCourseData();
  final List<Map<String, String>> _highlightData = CourseData.getCourseData();
  final List<String> _carouselImages = CourseData.getCarouselImages();
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  void _moveCarousel(bool forward) {
    setState(() {
      if (forward) {
        _currentIndex = (_currentIndex + 1) % _carouselImages.length;
      } else {
        _currentIndex = (_currentIndex - 1 + _carouselImages.length) %
            _carouselImages.length;
      }
    });
    _carouselController.animateToPage(
      _currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,  // Assign the GlobalKey to Scaffold
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Trainings",
          style: TextStyle(
              color: Color(AppColors.primaryColor),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(AppColors.tertiaryColor),
        actions: [
          // Drawer icon at the top right of the AppBar
          IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.white, // Change the icon color to white
            onPressed: () {
              // Open the endDrawer when the icon is pressed
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.white,
        child: ListView(
          children: <Widget>[
            // Drawer items go here
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Handle tap
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Handle tap
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Top Half: Carousel with Buttons
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color:
                              Color(AppColors.tertiaryColor), // Top part color
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color(
                              AppColors.primaryColor), // Bottom part color
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 30,
                    child: Text(
                      "Highlights",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(AppColors.primaryColor),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                CarouselSlider(
                  carouselController: _carouselController,
                  items: _carouselImages.map((url) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(16.0, 30, 16, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                  //carouselController: _carouselController,
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    // initialPage: 0,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(36, 30, 36, 20),
                    color: Colors.black
                        .withOpacity(0.5), // Semi-transparent grey overlay
                  ),
                ),
                Positioned(
                  left: 0.0,
                  child: Container(
                    height: 80,
                    width: 25,
                    color: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      onPressed: () => _moveCarousel(false),
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 16.0,
                    ),
                  ),
                ),
                Positioned(
                  right: 0.0,
                  child: Container(
                    height: 80,
                    width: 25,
                    color: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      onPressed: () => _moveCarousel(false),
                      icon: const Icon(Icons.arrow_forward_ios),
                      color: Colors.white,
                      iconSize: 16.0,
                    ),
                  ),
                ),
                Positioned(
                  left: 50.0,
                  right: 50.0,
                  bottom: 30,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _highlightData[_currentIndex]["title"] ?? "",
                          style: TextStyle(
                            color: Color(AppColors.primaryColor),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          (_highlightData[_currentIndex]["location"] ?? "") +
                              " " +
                              (_highlightData[_currentIndex]["dates"] ?? ""),
                          style: TextStyle(
                            color: Color(AppColors.primaryVariantColor),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Distributes space between children
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\$975",
                                  style: TextStyle(
                                      color: Color(AppColors.tertiaryColor),
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 2.0,
                                      decorationColor: Colors.red),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "\$825",
                                  style: TextStyle(
                                      color: Color(
                                        AppColors.tertiaryColor,
                                      ),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "View Details",
                                  style: TextStyle(
                                      color: Color(
                                          AppColors.primaryVariantDarkColor),
                                      fontSize: 12,
                                      decorationThickness: 2.0,
                                      decorationColor: Colors.red),
                                  textAlign: TextAlign.left,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color:
                                      Color(AppColors.primaryVariantDarkColor),
                                  size: 12,
                                )
                              ],
                            ),
                          ],
                        )
                      ]),
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                // Show the filter dialog when tapped
                showModalBottomSheet(
                  context: context,
                  isScrollControlled:
                      true, // Allow dialog to take custom height
                  backgroundColor:
                      Colors.transparent, // Make the background transparent
                  builder: (BuildContext context) {
                    return FilterDialog(
                      onApplyFilters: (List<String> list) {
                        setState(() {
                          _courseData =
                              CourseDataHelper.filterCoursesByValues(list);
                        });
                      },
                    ); // Show the FilterDialog
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color (optional)

                  border: Border.all(
                    color: Color(
                        AppColors.primaryVariantDarkColor), // Border color
                    width: 1.0, // Border width
                  ),
                  borderRadius:
                      BorderRadius.circular(4.0), // Rounded corners (optional)
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.filter_list_rounded,
                      size: 20,
                    ),
                    Text("Filter")
                  ],
                ),
              ),
            ),
          ),

          const Divider(height: 1, color: Colors.grey),
          // Bottom Half: ListView
          Expanded(
            flex: 1,
            child: Container(
              color: Color(AppColors
                  .primaryVariantColor), // Set the background color of the ListView
              child: ListView.builder(
                itemCount: _courseData.length,
                itemBuilder: (context, index) {
                  return HomeListViewItem(
                    title: _courseData[index]["title"],
                    dates: _courseData[index]["dates"],
                    trainerName: _courseData[index]["trainerName"],
                    courseStatus: _courseData[index]["courseStatus"],
                    location: _courseData[index]["location"],
                    time: _courseData[index]["time"],
                    imageUrl: _courseData[index]["imageUrl"],
                    smallerImageUrl: _courseData[index]["smallerImageUrl"],
                    onTap: () {
                      Get.to(
                          () => HomeDetailsScreen(course: _courseData[index]));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
