import 'package:storeapp/helper/ApiRequest.dart';
import 'package:storeapp/models/ProductModel.dart';

class getGategoryService {
  Future<List<ProductsModel>> getGategory(
      {required String category_name}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$category_name');

    List<ProductsModel> ProductList = [];
    for (int i = 0; i < data.length; i++) {
      ProductList.add(ProductsModel.fromJson(data[i]));
    }
    return ProductList;
  }
}
