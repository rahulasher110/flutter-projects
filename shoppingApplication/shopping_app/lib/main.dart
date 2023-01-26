import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/views/authentication/landing_page.dart';
import 'package:shopping_app/views/dashboard/payment_screen.dart';

import 'views/dashboard/product_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ListOfProducts(),
      home: PaymentScreen(
        totalPrice: 100,
      ),
    );
  }
}
