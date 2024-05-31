// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:storeapp/models/ProductModel.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});
  ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: Colors.grey.withOpacity(.3),
              spreadRadius: 0,
              offset: const Offset(10, 10),
            ),
          ],
        ),
        height: 150,
        width: 200,
        child: Card(
          surfaceTintColor: Colors.white,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title.substring(0, 10),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.price}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        right: 20,
        bottom: 85,
        child: Image.network(
          height: 65,
          width: 80,
          product.image,
        ),
      ),
    ]);
  }
}
