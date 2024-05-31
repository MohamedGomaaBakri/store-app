import 'package:storeapp/helper/ApiRequest.dart';
import 'package:storeapp/models/ProductModel.dart';

class AllProductsSevice {
  Future<List<ProductsModel>> GetAllProducts() async {
    try {
      List<dynamic> data =
          await Api().get(url: 'https://fakestoreapi.com/products');

      List<ProductsModel> productList = [];
      for (int i = 0; i < data.length; i++) {
        ProductsModel product = ProductsModel.fromJson(data[i]);

        productList.add(product);
      }
      return productList;
    } catch (e, stackTrace) {
      print("Error fetching products: $e");
      print("StackTrace: $stackTrace");
      return []; // Return null in case of error
    }
  }
}
