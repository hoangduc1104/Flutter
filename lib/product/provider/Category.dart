import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:kt2/product/service/Product.dart';

class CategoryProvider extends ChangeNotifier {
  List<dynamic> list = [];

  void getList() async {
    String apiUrl = ProductService.GetListCategory;

    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body);

    list = jsonObject;
    list.insert(0, "All");
    notifyListeners();
  }
}
