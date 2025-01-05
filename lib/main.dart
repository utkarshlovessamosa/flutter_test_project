import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'screens/home/home_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Trainings",
      initialRoute: "/home_screen",
      getPages: [
        GetPage(name: "/home_screen", page: () => const HomeScreen()),

      ],
    )

  );
}

