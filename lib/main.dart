import 'package:flutter/material.dart';
import 'package:storeapp/screens/UpdateProduct.dart';
import 'package:storeapp/screens/homePage.dart';

void main() {
  runApp(const storeapp());
}

class storeapp extends StatelessWidget {
  const storeapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProdut.id: (context) => UpdateProdut(),
      },
      initialRoute: HomePage.id,
    );
  }
}
