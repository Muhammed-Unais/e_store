import 'dart:convert';
import 'package:e_store/data/network/base_network_api_service.dart';
import 'package:e_store/features/home/model/product_model.dart';
import 'package:e_store/res/constants/app_url.dart';

class GetASingleProductDetailsRepository {
  final BaseNetWorkApiService _baseNetWorkApiService;

  GetASingleProductDetailsRepository(this._baseNetWorkApiService);

  Future<ProductModel> getAProductDetails(int id) async {
    try {
      final response = await _baseNetWorkApiService
          .getGetApiResponse("${AppUrl.getAllProductsApi}/$id", {});

      final json = jsonDecode(response) as Map<String, dynamic>;
      return ProductModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
