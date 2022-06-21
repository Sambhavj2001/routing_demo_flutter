import 'package:get/get.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  List<Product> productData = [];

  List<Product> cartItem = List<Product>.empty().obs;
  addtoCart(Product item) {
    print("calling addToCart");
    cartItem.add(item);
  }
  double get totalprice => cartItem.fold(0, (sum, item) => sum + item.price);
  int get count => cartItem.length;
  @override
  void onInit() {
    super.onInit();
    fatchProductData();
  }

  fatchProductData() async {
    await Future.delayed(Duration(seconds: 5));

    List<Product> serverResponse = [
      Product(
        id: 1,
        price: 7000,
        productDescription: 'some description about product',
        productImage: 'assets/images/shoes1.jpg',
        productName: 'Adidas',
        favorite: false,
      ),
      Product(
        id: 2,
        price: 10000,
        productDescription: 'some description about product',
        productImage: 'assets/images/shoes2.jpg',
        productName: 'Air Jordan 1',
         favorite: false,
      ),
      Product(
        id: 3,
        price: 11000,
        productDescription: 'some description about product',
        productImage: 'assets/images/shoes3.jpg',
        productName: 'Nike',
        favorite: false,
      ),

      Product(
        id: 4,
        price: 8000,
        productDescription: 'some description about product',
        productImage: 'assets/images/shoes4.jpg',
        productName: 'Adidas Sports',
        favorite: false,
      ),
    ];

    productData.assignAll(serverResponse);
    print(productData);
    update();
  }

  addtoFavorites(id){
    var index = productData.indexWhere((element) => element.id == id);
    productData[index].favorite = !productData[index].favorite;
    update();

  }
}
