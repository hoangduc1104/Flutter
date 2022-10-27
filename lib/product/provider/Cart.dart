import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:kt2/product/model/Product.dart';
import 'package:kt2/product/model/Rate.dart';
import 'package:kt2/product/service/Cart.dart';
import 'package:kt2/product/service/Product.dart';

class CartProvider extends ChangeNotifier {
  List<dynamic> list = [];
  List<dynamic> listProduct = [];
  void getList() async {
    String apiUrl = CartService.GetListItem;
    String apiProductUrl = ProductService.GetListProduct;

    var client = http.Client();
    var client2 = http.Client();
    var jsonCartString = await client.get(Uri.parse(apiUrl));
    var jsonProductString = await client2.get(Uri.parse(apiProductUrl));
    var jsonCartObject = jsonDecode(jsonCartString.body)["products"] as List;

    var jsonProductObject = jsonDecode(jsonProductString.body) as List;
    listProduct = jsonProductObject.map((e) {
      var rate = e['rating'];
      var rating = RatingModel.fromJson(rate);
      return ProductModel.fromJson(e, rating);
    }).toList();
    list = jsonCartObject.map((e) {
      var id = e['productId'];

      for (int i = 0; i < listProduct.length; i++) {
        var item = listProduct[i];

        if (item.id == id) {
          return item;
        }
      }
    }).toList();

    notifyListeners();
  }
}
