import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:kt2/product/model/Product.dart';
import 'package:kt2/product/model/Rate.dart';
import 'package:kt2/product/service/Product.dart';

class ProductProivder extends ChangeNotifier {
  List<ProductModel> list = [];

  void getList(String category, String keyword) async {
    String apiUrl = category == "All" || category == ""
        ? ProductService.GetListProduct
        : ProductService.GetProductByCategory + category;
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body) as List;
    //var newListObject = jsonObject['articles'] as List;
    if (keyword == "" && keyword.isEmpty) {
      list = jsonObject.map((e) {
        var rate = e['rating'];
        var rating = RatingModel.fromJson(rate);
        return ProductModel.fromJson(e, rating);
      }).toList();
    }
    if (keyword != "" && keyword.isNotEmpty) {
      var listSearch = jsonObject.map((e) {
        var rate = e['rating'];
        var rating = RatingModel.fromJson(rate);
        return ProductModel.fromJson(e, rating);
      }).toList();
      List<ProductModel> result = [];
      for (int i = 0; i < listSearch.length; i++) {
        var item = listSearch[i];
        final check = item.title?.toLowerCase().contains(keyword.toLowerCase());

        if (check ?? false) {
          result.add(item);
        }
      }
      list = result;
    }

    notifyListeners();
  }
}
