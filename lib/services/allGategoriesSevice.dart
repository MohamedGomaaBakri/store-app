import 'package:storeapp/helper/ApiRequest.dart';

class allGategoryService {
  Future<List<dynamic>> getAllGategory() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    return data;
  }
}
