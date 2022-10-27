import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:payment_system/controller/cartController.dart';
import 'package:payment_system/screens/paymentStatusScreen.dart';


class PaymentController {
  PaymentController(this.context);
  BuildContext context;
  Map<String, dynamic>? paymentIntent;
  final cartController = Get.put(CartController());

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  //applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
                  //googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Sajib'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      
      await Stripe.instance.presentPaymentSheet().then((value) {
        cartController.cartItems.clear();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PaymentStatus()));

        paymentIntent = null;
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51LvwBMLzbftOFktMdWChvVUc3izGd64UNv2xN485TcAU5kp7xXRRu6EUA2PHWEwYqxGSWMHHZ8yst57HmYv1EOq500U6yFpuRS',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }
  

}
