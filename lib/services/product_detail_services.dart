import 'dart:convert';
import 'package:http/http.dart';

import '/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/product_detail_model.dart';

class ProductDetailServices  {

  ProductDetailModel? _data;

  bool _isloading=false;

  bool get isloading => _isloading;

  set isloading(bool value) {
    _isloading = value;
  }

  ProductDetailModel? get data => _data;



  Future<ProductDetailModel?> getProductDetaildata(int idss) async {
    String url = 'https://data-otterli-staging.com/api/product_details/$idss';
    Response response = await http.get(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Token bfdf77e6a72ce81badfcc847aaf041255cd65928',
        }
    );
    if(response.statusCode == 200 || response.statusCode == 201) {
      _data=ProductDetailModel.fromJson(json.decode(response.body));
      _isloading=true;
      return _data;
     // notifyListeners();

    }else{
      _isloading=false;
     // notifyListeners();
      throw Exception('Error');
    }
  }
}