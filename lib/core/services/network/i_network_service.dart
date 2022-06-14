import 'package:egolden/core/services/network/response_model.dart';

abstract class INetworkService {
  Future<ResponseModel> get(String path,
      {Map<String, dynamic>? queryParameters});
  Future<ResponseModel> post(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? data});
}
