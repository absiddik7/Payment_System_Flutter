import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:payment_system/controller/cartController.dart';
import 'package:payment_system/controller/favoriteController.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    //final shoppingController = Get.put(ShoppingController());
    final cartController = Get.put(CartController());
    final favController = Get.put(FavoriteController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Favorite'),
        backgroundColor: Colors.blue[300],
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 60),
            child: Row(
              children: [
                GetX<CartController>(builder: (controllers) {
                  return Badge(
                    toAnimate: false,
                    shape: BadgeShape.circle,
                    position: BadgePosition.topEnd(top: -12, end: -15),
                    badgeColor: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(8),
                    badgeContent: Text(controllers.itemCount.toString(),
                        style:
                            const TextStyle(fontSize: 10, color: Colors.white)),
                    child: const Icon(
                      Icons.shopping_cart,
                    ),
                  );
                })
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: GetX<FavoriteController>(builder: (controller) {
           if (controller.favItems.isEmpty) {
                    return const Center(
                      child: Text('No favorite items!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            //fontSize: 20,
                          )),
                    );
                  } else {
                          return ListView.builder(
                            itemCount: controller.favItems.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Column(children: [
                                    Stack(
                                      children: [
                                        //product image
                                        Image.network(
                                          controller.favItems[index].productImage!,
                                          height: 200,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                        Positioned(
                                            right: 5,
                                            // favorite button
                                            child: FavoriteButton(
                                              iconSize: 40,
                                              isFavorite: true,
                                              valueChanged: (isFavorite) {
                                                if (isFavorite==false) {
                                                  favController.favItems.removeAt(index);
                                                } 
                                              },
                                            )),
                                      ],
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      controller.favItems[index].productName!,
                                      style: const TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    Text(
                                      "\$ ${controller.favItems[index].price}",
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(height: 4),
                                    SizedBox(
                                      height: 30,
                                      width: 120,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            var k = cartController.cartItems;
                                            if (k.contains(controller.favItems[index])) {
                                              final snackBar = SnackBar(
                                                content: const Text('Already in the cart!'),
                                                action: SnackBarAction(
                                                  label: 'Ok',
                                                  onPressed: () {
                                                    //do some thing
                                                  },
                                                ),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            } else {
                                              cartController
                                                  .addToCart(controller.favItems[index]);
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              elevation: 12.0,
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                //fontSize: 20,
                                              )),
                                          child: const Text('Add to Cart'),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                  ]),
                                ),
                              );
                            },
                          );
                  }
        }),
      ),
    );
  }
}
