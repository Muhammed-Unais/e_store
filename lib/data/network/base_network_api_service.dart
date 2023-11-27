abstract interface class BaseNetWorkApiService {
  Future<dynamic> getGetApiResponse(
    String endPoint,Map<String, dynamic>? queryParameters,
  );
}