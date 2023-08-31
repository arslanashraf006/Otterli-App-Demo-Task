import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/reviews_model.dart';

class ReviewsServices with ChangeNotifier {

  ReviewModel? _data;
  bool _isloaded = false;

  bool get isloaded => _isloaded;


  ReviewModel? get data => _data;

  String url = 'https://data-otterli-staging.com/api/ratings';
  Future getReviewData() async {
    var response = await http.get(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Token bfdf77e6a72ce81badfcc847aaf041255cd65928',
        }
    );
    if(response.statusCode == 200 || response.statusCode == 201) {
      _data=ReviewModel.fromJson(json.decode(response.body));
      _isloaded= true;
      notifyListeners();
    }else{
      _isloaded= false;
      notifyListeners();
      throw Exception('Error');
    }
  }
}