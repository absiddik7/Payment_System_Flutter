import 'package:flutter/material.dart';
import 'package:payment_system/controller/paymentController.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {super.key, required this.totalAmount, required this.totalItems});
  final String totalAmount;
  final int totalItems;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final paymentController = PaymentController(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CheckOut'),
        backgroundColor: Colors.green[300],
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 60),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Delivery Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const TextField(
              //controller: blogBodyController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                  labelStyle: TextStyle(fontSize: 20),
                  hintText: 'Wrtie your address here...'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Order Summary',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Items: ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  widget.totalItems.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Delivery Fee: ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '\$ 0',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Price:',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '\$ ${widget.totalAmount.toString()}',
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Payment Method',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Paypal',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await paymentController
                                    .makePayment(widget.totalAmount);
                                
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: const Text('Card',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            )),
                ),
                SizedBox(
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('bKash',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
