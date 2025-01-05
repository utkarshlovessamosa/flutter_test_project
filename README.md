# flutter_test_project
 
# Two-Screen My Trainings Flutter App

This is a simple Flutter app demonstrating the fundamental concepts of Flutter, including routing, navigation, state-management and UI structure.

## Features

- **Home Screen**: Displays a caraousel along with list of trainings.
- **Details**: A secondary screen that users can navigate to after interacting with the Home screen. This screen displays details of the list items.
- **Responsive Design**: The layout adjusts for different screen sizes, ensuring a smooth user experience across phones and tablets.

## Requirements

Before you begin, ensure you have the following installed:

- **Flutter SDK** (version 3.x or later)
- **Dart SDK** (version 2.x or later)
- A supported editor like **VS Code** or **Android Studio**
- An emulator or physical device to run the app

## Major Components 
two-screen-flutter-app/
│
├── lib/screens/home
│   ├── main.dart               # Entry point for the app
│   ├── home_screen.dart        # Home screen widget
│   └── home_filter_dialog.dart # Filter Bottomsheet to modify home screen listview
    └── details.dart            # Details screen for listview items

│
├── pubspec.yaml          # Project dependencies and settings
└── README.md             # Project documentation (you are here!)

