import 'dart:convert';
import '../model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriesServices with ChangeNotifier {

  CategoriesModel? _data;
  bool _isloaded = false;

  bool get isloaded => _isloaded;

  CategoriesModel? get data => _data;


  String url = 'https://data-otterli-staging.com/api/categories/?icons=True';
  Future getCategoriesdata() async {
    var response = await http.get(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Token bfdf77e6a72ce81badfcc847aaf041255cd65928',
        }
    );
    if(response.statusCode == 200 || response.statusCode == 201) {
      _data = CategoriesModel.fromJson(json.decode(response.body));
      _isloaded= true;
      notifyListeners();
    }else{
      _isloaded = false;
      notifyListeners();
      throw Exception('Error');
    }
  }
}