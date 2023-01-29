import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/utils/assets.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/views/authentication/signup_page.dart';
import 'package:shopping_app/views/dashboard/product_list_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: AppDimensions.pagePadding,
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimensions.height30,
                  ),
                  LottieBuilder.asset(AppAssets.loginLottie),
                  SizedBox(
                    height: AppDimensions.height30,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              controller: emailController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enter your email';
                                }
                                if (!(RegExp(
                                        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                    .hasMatch(emailController.text))) {
                                  return 'enter valid email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enter your password';
                                }
                                if (value.length < 6) {
                                  return 'password must be atleast 6 characters long';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
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
                                        color: AppColors.primaryColor),
                                  ))),
                          SizedBox(
                            height: AppDimensions.height45,
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
                                onPressed: () => Get.to(const ListOfProducts()),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: AppDimensions.font16,
                                      fontWeight: FontWeight.w500),
                                )),
                          )
                        ],
                      )),
                  SizedBox(
                    height: AppDimensions.height20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                      text: 'Don\' have an account?',
                      style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                        text: ' Sign up',
                        style: TextStyle(
                            fontSize: AppDimensions.font16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blueColorAsset),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(const SignUpPage())),
                  ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future signIn() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailController.text.trim(),
  //         password: passwordController.text.trim());
  //     emailController.clear();
  //     passwordController.clear();
  //     Get.to(const ListOfProducts());
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
