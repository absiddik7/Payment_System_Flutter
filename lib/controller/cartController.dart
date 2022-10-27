import 'package:get/get.dart';
import 'package:payment_system/model/productModel.dart';


class CartController extends GetxController {
  var cartItems = <ProductModel>[].obs;
  int get itemCount => cartItems.length;
  int get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price!);

  addToCart(ProductModel product) {
    cartItems.add(product);
  }
}
