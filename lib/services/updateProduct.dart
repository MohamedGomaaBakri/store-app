import 'package:storeapp/helper/ApiRequest.dart';
import 'package:storeapp/models/ProductModel.dart';

class UpdateProductService {
  Future<dynamic> updateproduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        // ignore: missing_required_param
        await Api().put(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });

    return ProductsModel.fromJson(data);
  }
}
