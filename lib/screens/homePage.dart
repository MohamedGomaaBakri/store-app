// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:storeapp/models/ProductModel.dart';
import 'package:storeapp/screens/UpdateProduct.dart';
import 'package:storeapp/services/allProductService.dart';
import 'package:storeapp/widgets/Custom_Card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          )
        ],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16),
        child: FutureBuilder<List<ProductsModel>>(
          future: AllProductsSevice().GetAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductsModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, UpdateProdut.id,
                          arguments: products);
                    },
                    child: CustomCard(
                      product: products[index],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
