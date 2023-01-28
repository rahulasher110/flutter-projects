import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/utils/assets.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/views/authentication/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppDimensions.pagePadding,
          child: Column(
            children: [
              LottieBuilder.asset(AppAssets.registerLottie),
              SizedBox(
                height: AppDimensions.height30,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: nameController,
                          autofocus: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10),
                              enabled: true,
                              hintText: 'Enter name',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.radius20),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.radius20),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor)))),
                      SizedBox(
                        height: AppDimensions.height20,
                      ),
                      TextFormField(
                          controller: emailController,
                          autofocus: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            }
                            if (!(RegExp(
                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(emailController.text))) {
                              return 'enter valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10),
                              enabled: true,
                              hintText: 'Enter email',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.radius20),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.radius20),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor)))),
                      SizedBox(
                        height: AppDimensions.height20,
                      ),
                      TextFormField(
                          controller: passwordController,
                          autofocus: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter password';
                            }
                            if (value.length < 6) {
                              return 'password must be atleast 6 characters long';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10),
                              enabled: true,
                              hintText: 'Enter password',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.radius20),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.radius20),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor)))),
                      SizedBox(
                        height: AppDimensions.height30,
                      ),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0.5,
                              backgroundColor:
                                  AppColors.primaryColor.withOpacity(0.8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.radius30)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.width20,
                                  vertical: 16),
                            ),
                            onPressed: () => Get.to(const LoginPage()),
                            child: const Text('Sign up')),
                      )
                    ],
                  )),
              SizedBox(
                height: AppDimensions.height20,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: 'Already have an account?',
                  style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontWeight: FontWeight.w500),
                ),
                TextSpan(
                    text: ' Login',
                    style: TextStyle(
                        fontSize: AppDimensions.font16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueColorAsset),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(const LoginPage())),
              ]))
            ],
          ),
        ),
      ),
    );
  }

  // Future signup() async {
  //   final isValid = _formKey.currentState!.validate();
  //   if (!isValid) return;

  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailController.text.trim(),
  //         password: passwordController.text.trim());

  //     emailController.clear();
  //     passwordController.clear();
  //     Get.to(const LoginPage());
  //   } on FirebaseAuthException catch (e) {
  //     Get.snackbar(
  //       e.message.toString(),
  //       "",
  //       icon: const Icon(Icons.person, color: Colors.blue),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  // }
}
