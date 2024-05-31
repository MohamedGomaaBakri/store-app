// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/ProductModel.dart';
import 'package:storeapp/services/updateProduct.dart';
import 'package:storeapp/widgets/Custom_textField.dart';

import '../widgets/Custom_button.dart';

// ignore: must_be_immutable
class UpdateProdut extends StatefulWidget {
  UpdateProdut({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProdut> createState() => _UpdateProdutState();
}

class _UpdateProdutState extends State<UpdateProdut> {
  bool isloading = false;

  String? productName, desc, price, image;

  @override
  Widget build(BuildContext context) {
    ProductsModel products =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              onChanged: (p0) {
                productName = p0;
              },
              hintText: 'Product Name',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: 'description',
              onChanged: (p0) {
                desc = p0;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: 'price',
              onChanged: (p0) {
                price = p0;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: 'image',
              onChanged: (p0) {
                image = p0;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              buttonText: 'Add Product',
              onTap: () {
                isloading = true;
                setState(() {});
                try {
                  updateProduct(products);
                  print('sucssess');
                } catch (e) {
                  print(e.toString());
                }

                isloading = false;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateProduct(ProductsModel products) {
    UpdateProductService().updateproduct(
        title: productName!,
        price: price!,
        description: desc!,
        image: image!,
        category: products.category);
  }
}
