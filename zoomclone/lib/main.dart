import 'package:flutter/material.dart';
import 'package:zoomclone/utils/colors.dart';
import 'package:zoomclone/views/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: AppColors.backgroundColor),
      routes: {'/login': (context) => LoginScreen()},
      home: LoginScreen(),
    );
  }
}
