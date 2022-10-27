import 'package:get/get.dart';
import 'package:payment_system/model/productModel.dart';


class ShoppingController extends GetxController {
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    var allProducts = [
      ProductModel(
          id: 1,
          productName: "iPhone 12",
          productImage:
              'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
          price: 899),
      ProductModel(
        id: 2,
        productName: "Samsung s22",
        productImage:
            'https://www.thehindu.com/incoming/aaftll/article65251608.ece/alternates/FREE_1200/_S22_Ultra_Banner_3000x2000.jpg',
        price: 1100,
      ),
      ProductModel(
        id: 3,
        productName: "One Plus",
        productImage:
            'https://media.wired.com/photos/5d8bd834a500f60009b58620/191:100/w_1280,c_limit/Gear-OnePlus-Both.jpg',
        price: 750,
      ),
      ProductModel(
        id: 4,
        productName: "Vivo 3S",
        productImage:
            'https://in-exstatic-vivofs.vivo.com/gdHFRinHEMrj3yPG/1657192245628/203773b7c46bbb1ba4e7c355fb048842.jpg',
        price: 650,
      ),
      ProductModel(
        id: 5,
        productName: "iPhone 13",
        productImage:
            'https://images.indianexpress.com/2021/10/Apple_iPhone13_Inside4.jpg',
        price: 950,
      ),
      ProductModel(
        id: 6,
        productName: "MacBook Pro",
        productImage:
            'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXBwbGUlMjBsYXB0b3B8ZW58MHx8MHx8&w=1000&q=80',
        price: 1300,
      ),
      ProductModel(
        id: 7,
        productName: "Dell Laptop",
        productImage:
            'https://www.startech.com.bd/image/cache/catalog/laptop/toshiba/satellite-pro-c40-g-109/satellite-pro-c40-g-109-01-228x228.webp',
        price: 1200,
      ),
      ProductModel(
          id: 8,
          productName: "iPhone 12",
          productImage:
              'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
          price: 899),
      ProductModel(
        id: 9,
        productName: "Samsung s22",
        productImage:
            'https://www.thehindu.com/incoming/aaftll/article65251608.ece/alternates/FREE_1200/_S22_Ultra_Banner_3000x2000.jpg',
        price: 1100,
      ),
      ProductModel(
        id: 10,
        productName: "One Plus",
        productImage:
            'https://media.wired.com/photos/5d8bd834a500f60009b58620/191:100/w_1280,c_limit/Gear-OnePlus-Both.jpg',
        price: 750,
      ),
      ProductModel(
        id: 11,
        productName: "Vivo 3S",
        productImage:
            'https://in-exstatic-vivofs.vivo.com/gdHFRinHEMrj3yPG/1657192245628/203773b7c46bbb1ba4e7c355fb048842.jpg',
        price: 650,
      ),
      ProductModel(
        id: 12,
        productName: "iPhone 13",
        productImage:
            'https://images.indianexpress.com/2021/10/Apple_iPhone13_Inside4.jpg',
        price: 950,
      ),
      ProductModel(
        id: 13,
        productName: "MacBook Pro",
        productImage:
            'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXBwbGUlMjBsYXB0b3B8ZW58MHx8MHx8&w=1000&q=80',
        price: 1300,
      ),
      ProductModel(
        id: 14,
        productName: "Dell Laptop",
        productImage:
            'https://www.startech.com.bd/image/cache/catalog/laptop/toshiba/satellite-pro-c40-g-109/satellite-pro-c40-g-109-01-228x228.webp',
        price: 1200,
      ),
    ];
    products.value = allProducts;
  }
}
