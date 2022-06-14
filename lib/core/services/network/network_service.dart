import 'package:dio/dio.dart';
import 'package:egolden/core/services/network/i_network_service.dart';
import 'package:egolden/core/services/network/response_model.dart';

class NetworkService implements INetworkService {
  NetworkService();
  late Dio _dio;
  // items/getcategories
  // items/getgroups
  static final NetworkService _instance = NetworkService._internal();
  static NetworkService get instance => _instance;

  NetworkService._internal() {
    _dio = Dio();
    _dio.options.baseUrl = "http://192.168.1.10:27500/api/";
    // _dio.options.connectTimeout = 3000;
    // _dio.options.receiveTimeout = 3000;
  }

  @override
  Future<ResponseModel> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response<Map<String, dynamic>> response = await _dio
          .get<Map<String, dynamic>>(path, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return ResponseModel.fromJson(response.data!);
      } else {
        return ResponseModel.error(
            response.statusMessage ?? "Hata mesajı bulunamadı");
      }
    } catch (e) {
      return ResponseModel.error("catch: $e");
    }
  }

  @override
  Future<ResponseModel> post(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    try {
      Response<Map<String, dynamic>> response =
          await _dio.post(path, queryParameters: queryParameters, data: data);
      return response.statusCode == 200
          ? ResponseModel.fromJson(response.data!)
          : ResponseModel.error(
              response.statusMessage ?? "Hata mesajı bulunamadı");
    } catch (e) {
      return ResponseModel.error("catch: $e");
    }
  }
}
