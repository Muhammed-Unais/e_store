import 'dart:developer';
import 'package:e_store/data/network/network_api_service.dart';
import 'package:e_store/features/home/model/product_model.dart';
import 'package:e_store/features/home/repository/get_all_products_repository.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  // repositories
  final _getallProductRepo = GetAllProductRepository(NetworkApiService());

  Future<List<ProductModel>> getAllProducts({int? limit}) async {
    List<ProductModel> productModel = [];
    final queryParameters = {"offset": 0, "limit": limit};
    await _getallProductRepo.getAllProducts(queryParameters).then((value) {
      productModel = value;
    }).onError((error, stackTrace) {
      log(error.toString());
    });
    return productModel;
  }
}