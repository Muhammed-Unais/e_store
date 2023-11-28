import 'dart:developer';
import 'package:e_store/data/app_response/api_response.dart';
import 'package:e_store/data/network/network_api_service.dart';
import 'package:e_store/features/home/model/product_model.dart';
import 'package:e_store/features/product_details_view/repository/get_a_single_product_details_repositoy.dart';
import 'package:flutter/material.dart';

class SingleProductDetailsViewModel extends ChangeNotifier {
  // Repositories
  final _getSingleProductDetails =
      GetASingleProductDetailsRepository(NetworkApiService());

  // ApiResponse
  ApiResponse<ProductModel> singleProductDetailsResponse =
      ApiResponse.loading();

  void setSingleProductDetailsResponse(ApiResponse<ProductModel> apiResponse) {
    singleProductDetailsResponse = apiResponse;
    notifyListeners();
  }

  Future<void> getSingleProduct(int id) async {
    setSingleProductDetailsResponse(ApiResponse.loading());
    _getSingleProductDetails.getAProductDetails(id).then((value) {
      setSingleProductDetailsResponse(ApiResponse.completed(value));

      log(value.toString());
    }).onError((error, stackTrace) {
      setSingleProductDetailsResponse(ApiResponse.error(error.toString()));
    });
  }
}
