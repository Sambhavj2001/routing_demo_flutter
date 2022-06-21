import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesapp/controllers/product_controller.dart';
import 'package:shoesapp/detail/cart.dart';
import 'package:shoesapp/detail/description.dart';

import '../controllers/product_controller.dart';

class ProductScreen extends StatelessWidget {
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("List of products"),
        actions: [
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Get.to(CartScreen());
                },
                icon: Icon(Icons.shopping_cart),
                label: GetX<ProductController>(
                  builder: (controller) =>
                 Text(productController.count.toString(),),
                ),
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ProductController>(
              builder: (controller) {
                return ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 5,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 120,
                                width: double.infinity,
                                child: Image.asset(
                                  productController
                                      .productData[index].productImage,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      productController
                                          .productData[index].productName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: () {
                                    productController.addtoFavorites(productController.productData[index].id);
                                    },
                                  icon: Icon(
                                    productController
                                        .productData[index].favorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Price : ${productController.productData[index].price} ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        productController.addtoCart(productController.productData[index]);
                                      },
                                      child: Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.to(DetailScreen());
                                      },
                                      child: Text(
                                        'Description',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: productController.productData.length);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GetX<ProductController>(
              builder: (controller)=>Text(
            "Total Amount : ${productController.totalprice}",
            style: TextStyle(fontSize: 20, color: Colors.white),
             ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

//-------------------------






