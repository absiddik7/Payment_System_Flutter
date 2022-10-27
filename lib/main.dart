import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_system/home.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // set the publishable key for Stripe - this is mandatory
  Stripe.publishableKey =
      'pk_test_51LvwBMLzbftOFktMJVxgGAcw3hNHQxpRP8BGKIaKGsKQKT9WXAADn2ZMVxKscJUFZOKfAKfJb7PozNwPzfacCgHV006XU2C2Q6';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
