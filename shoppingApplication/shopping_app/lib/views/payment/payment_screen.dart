import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:lottie/lottie.dart';
import 'package:shopping_app/utils/assets.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/widgets/app_icon.dart';

class PaymentScreen extends StatefulWidget {
  final double totalPrice;
  const PaymentScreen({super.key, required this.totalPrice});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<String> paymentText = [
    'It is safe and secure',
    'your trust is our pride',
    'We do not share the information\nto third parties.'
  ];

  Map<String, dynamic>? paymentIntent;
  String SECRET_KEY = "secret_key";

  @override
  void initState() {
    // TODO: implement initState
    Stripe.publishableKey =
        "pk_test_51MUXbASCVTlr6fhsuMKa9fejw5g0mO6ny4AUiJzHeralPwWhLDZz7Sk95w1Q5b5lfPut3rG5Z1RlmGiRF3EBL7pP00kp2gS0qV";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.5,
        leading: AppIconWidget(
          onClick: () => Get.back(),
          icon: Icons.arrow_back_ios,
          backgroundColor: AppColors.whiteColor,
          iconColor: Colors.black,
          size: AppDimensions.iconSize24,
        ),
        title: const Text(
          'Make Payment',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.height20),
          child: Column(
            children: [
              LottieBuilder.asset(AppAssets.paymentLottie),
              SizedBox(
                height: AppDimensions.height45,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: paymentText
                    .map((e) => Row(
                          children: [
                            Container(
                              height: AppDimensions.height10,
                              margin: EdgeInsets.only(
                                top: AppDimensions.height10,
                              ),
                              width: AppDimensions.height10,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: AppDimensions.width10,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: AppDimensions.height10),
                              child: Text(
                                e,
                                maxLines: 3,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ))
                    .toList(),
              ),
              Expanded(child: Container()),
              ElevatedButton(
                  onPressed: () async {
                    await makePayment();
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimensions.radius30),
                  ))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LottieBuilder.asset(
                        AppAssets.cardPayment,
                        height: AppDimensions.height100,
                      ),
                      Text(
                        'Pay:  ₹ ${widget.totalPrice}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  calculateAmount(String amount) {
    final calculatedAmount = int.parse(amount) * 100;
    return calculatedAmount.toString();
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          headers: {
            'Authorization': 'Bearer $SECRET_KEY',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: body);
      print(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('10', 'USD');

      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  style: ThemeMode.light,
                  merchantDisplayName: 'Rahul singh'))
          .then((value) {});

      // display paymnet sheet
      displayPaymentSheet();
    } catch (e) {}
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    children: [Text('payment successful')],
                  ),
                ));

        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('error is : $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('error is $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text('cancelled'),
              ));
    } catch (e) {
      print(e);
    }
  }
}
