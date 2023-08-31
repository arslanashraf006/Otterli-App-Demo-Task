import 'dart:convert';
import 'package:flutter/material.dart';

import '../model/new_product_model.dart';
import 'package:http/http.dart' as http;

class NewProductServices with ChangeNotifier {
  NewProductModel? _data;
  bool _isLoading=false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  NewProductModel? get data => _data;

  set data(value) {
    _data = value;
  }

  String url = 'https://data-otterli-staging.com/api/latest_products/';
  Future getNewProductdata() async {
    var response = await http.get(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Token bfdf77e6a72ce81badfcc847aaf041255cd65928',
        }
    );
    if(response.statusCode == 200 || response.statusCode == 201) {
      _data=NewProductModel.fromJson(json.decode(response.body));
      _isLoading=true;
       notifyListeners();
    }else{
      _isLoading=false;
      notifyListeners();
    }
  }
}