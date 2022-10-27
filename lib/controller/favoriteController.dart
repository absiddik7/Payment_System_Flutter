import 'package:get/get.dart';
import 'package:payment_system/model/productModel.dart';


class FavoriteController extends GetxController {
  var favItems = <ProductModel>[].obs;
  //int get itemCount => cartItems.length;

  addToCart(ProductModel product) {
    favItems.add(product);
  }
}