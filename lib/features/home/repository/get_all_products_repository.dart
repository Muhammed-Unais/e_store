import 'package:e_store/data/network/base_network_api_service.dart';
import 'package:e_store/features/home/model/product_model.dart';
import 'package:e_store/res/constants/app_url.dart';

class GetAllProductRepository {
  final BaseNetWorkApiService _baseNetWorkApiService;

  GetAllProductRepository(this._baseNetWorkApiService);

  Future<List<ProductModel>> getAllProducts(
      Map<String, dynamic> queryParameters) async {
    try {
      final response = await _baseNetWorkApiService.getGetApiResponse(
          AppUrl.getAllProductsApi, queryParameters);
          

      final productModel = productModelFromJson(response);

      return productModel;
    } catch (e) {
      rethrow;
    }
  }
}
