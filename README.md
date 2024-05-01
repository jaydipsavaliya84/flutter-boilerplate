# flutter_boiler_plate

A Flutter boilerplate is a pre-configured project template that provides a starting point for your Flutter app development.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Features

- Core Routes
- MVC Architecture
- HTTP CRUD Method (MVC Architecture )
- SQLite CRUD Method (MVC Architecture )
- Local Notification
- Local Database using sqflite package
- Switch To Dark or Light Mode
- Banner Ad - Google Mobile Ads (Google Admob)
- Firebase Remote Config
- Provider
- Permission Handler

## Reusable Widgets

- Drawer With DrawerTile
- Navbar
- Full Screen Loader
- No Data Found
- On Screen Loader For Full Screen
- No More Content For Load More Content
- showMessage For Snack Bar
- Banner Ad Widget From Google Admob Ads
- Banner Ad Widget From Google Admob Ads Using Firebase Remote Config
- Permission Handler Widget Dialog For Permission Handler Package

## Steps to start project
1. Start the emulator on your machine. If you doesn't have one already created, [create one](https://developer.android.com/studio/run/managing-avds).
2. Go to root of the project and run `flutter pub get`
3. Click on the green play button at the toolbar of Android Studio.
4. Let the application boot and get installed into the emulator.

## Connect real device over Wi-Fi
1. Connect your device with laptop using USB and connect mobile with same WiFi to which your laptop is connect
2. Open CMD/Terminal
3. Check if device correctly connected using `adb devices`
4. Run `adb tcpip 5555`
5. Open your mobile `Settings` > `About Phone` > `Status` > `IP Address` (IP Address will change everytime you connect)
6. Run `adb connect <your_mobile_ip>` eg: - `adb connect 192.168.1.6`
7. Remove the USB cable.

## If by using above step you are not able to connect to device than try commands below

1. Run `adb kill-server`
2. Run `adb usb`
3. Run `adb tcpip 5555`
4. Run `adb connect <your_mobile_ip>:5555`