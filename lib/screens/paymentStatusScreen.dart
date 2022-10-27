import 'package:flutter/material.dart';
import 'package:payment_system/home.dart';


class PaymentStatus extends StatefulWidget {
  const PaymentStatus({super.key});

  @override
  State<PaymentStatus> createState() => _PaymentStatusState();
}

class _PaymentStatusState extends State<PaymentStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8HhqUOy4lrVmYX9431ePxYBdQr-GczLSXQA&usqp=CAU',
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Payment Successful',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 40,
                // width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          ModalRoute.withName("/Home"));
                    },
                    child: const Text('Shop More',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
