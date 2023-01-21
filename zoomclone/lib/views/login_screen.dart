import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoomclone/utils/dimension.dart';
import 'package:zoomclone/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Image.asset('assets/images/onboarding.jpeg'),
          ),
          CustomButton(
            text: 'Google Sign in',
            onPressed: () {},
            fontSize: AppDimensions.font20,
          )
        ],
      ),
    );
  }
}
