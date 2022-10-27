import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:payment_system/controller/cartController.dart';
import 'package:payment_system/controller/favoriteController.dart';
import 'package:payment_system/controller/shoppingController.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.put(ShoppingController());
    final cartController = Get.put(CartController());
    final favController = Get.put(FavoriteController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Home'),
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
        child: GetX<ShoppingController>(builder: (controller) {
          return ListView.builder(
            itemCount: controller.products.length,
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
                          controller.products[index].productImage!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                            right: 5,
                            // favorite button

                            child: FavoriteButton(
                              iconSize: 40,
                              isFavorite: fav,
                              valueChanged: (_isFavorite) {
                                var x = controller.products[index];
                                var y = favController.favItems;

                                if (_isFavorite) {
                                  if (y.contains(x)) {
                                    final snackBar = SnackBar(
                                      content: const Text(
                                          'Already in the favorite!'),
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
                                    favController.favItems
                                        .add(controller.products[index]);
                                  }
                                } else {
                                  favController.favItems.removeAt(index);
                                }
                              },
                            )),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      controller.products[index].productName!,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      "\$ ${controller.products[index].price}",
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
                            if (k.contains(controller.products[index])) {
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
                                  .addToCart(controller.products[index]);
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
        }),
      ),
    );
  }
}
