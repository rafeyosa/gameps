# Introduction
Welcome to the GamePS Project! This project is built using Flutter and GetX as state-management to create mobile application to browse game in Playstation 5

## Getting Started
To get started with this project, ensure you have the following prerequisites:
- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter
- An IDE (Optional but recommended): VS Code, Android Studio, or IntelliJ IDEA

## :ledger: Index

- [About](#beginner-about)
- [Development](#wrench-development)
  - [Development Environment](#nut_and_bolt-environment)
  - [Build](#hammer-build)
- [Run Testing](#mag_right-run-testing)

## :beginner: About

This project  was assignment to build a mobile application to browse the latest released Playstation 5 games, and view more details about said games.

## :wrench: Development

Below you can find about development environment, file structure, build, and deployment

### :nut_and_bolt: Environment

```  
API_KEY=<your key>
API_URL=api.rawg.io  
```  

### :hammer: Build

To build APK file :

```  
flutter build apk --dart-define API_KEY=<your key> --dart-define API_URL=api.rawg.io 
```  

To build AAB file :

```   
flutter build appbundle --dart-define API_KEY=<your key> --dart-define API_URL=api.rawg.io  
```  

To build IPA file :

```  
flutter build ipa --dart-define API_KEY=<your key> --dart-define API_URL=api.rawg.io
```    

## :mag_right: Run Testing

This project uses Flutter's built-in testing framework. Follow the steps below to run tests.

- Open Terminal
- Navigate to the root directory of the project
- Run build_runner command to generate code based on annotations
```
dart run build_runner build
```  
- Run the following command
```
flutter test --coverage
```  
This will generate a `coverage` directory with the test coverage report. To view the report in a human-readable format, you can use the `lcov` tool:
```
genhtml coverage/lcov.info -o coverage/html
``` 
Then open `coverage/html/index.html` in your web browser to view the coverage report.
<img width="1728" alt="Screenshot 2024-06-12 at 18 53 32" src="https://github.com/rafeyosa/gameps/assets/67069286/06432db8-ffda-4eed-a198-c698e2fb7ad3">

