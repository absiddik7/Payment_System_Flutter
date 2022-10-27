import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_system/controller/cartController.dart';
import 'package:payment_system/controller/paymentController.dart';
import 'package:payment_system/controller/shoppingController.dart';
import 'package:payment_system/stripePayment/paymentScreen.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.put(ShoppingController());
    final cartController = Get.put(CartController());
    final paymentController = PaymentController(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart'),
        backgroundColor: Colors.blue[300],
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 60),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: GetX<CartController>(builder: (controller) {
                  if (controller.cartItems.isEmpty) {
                    return const Center(
                      child: Text('No item in the cart!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            //fontSize: 20,
                          )),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.cartItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        controller
                                            .cartItems[index].productImage!,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.fill,
                                      ),
                                      const SizedBox(width: 5.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .cartItems[index].productName!,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "\$ ${controller.cartItems[index].price}",
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            color: Colors.red,
                                            onPressed: () {
                                              controller.cartItems
                                                  .removeAt(index);
                                            },
                                          ),
                                        ],
                                      ),
                                      //const SizedBox(height: 4),
                                    ],
                                  ),
                                ]),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 12),
                color: Colors.grey.shade300,
                child: Column(
                  children: [
                    GetX<CartController>(builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price: \$ ${controller.totalPrice.toString()}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 40,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: ElevatedButton(
                                onPressed: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PaymentScreen(
                                                totalAmount: controller
                                                    .totalPrice
                                                    .toString(),
                                                totalItems:
                                                    controller.itemCount,
                                              )));

                                  //await paymentController.makePayment(controller.totalPrice.toString());
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepOrange,
                                    elevation: 12.0,
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      //fontSize: 20,
                                    )),
                                child: const Text('Check Out'),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
