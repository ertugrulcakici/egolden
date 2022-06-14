import 'package:egolden/core/services/database/i_database_service.dart';
import 'package:egolden/core/services/network/network_service.dart';
import 'package:egolden/core/services/network/response_model.dart';
import 'package:egolden/product/constants/database_constants.dart';
import 'package:egolden/product/models/banner_model.dart';
import 'package:egolden/product/models/product_model.dart';

class DatabaseService extends NetworkService implements IDatabaseService {
  DatabaseService();
  static final DatabaseService _instance = DatabaseService._internal();
  static DatabaseService get instance => _instance;

  DatabaseService._internal();

  @override
  Future<BannerModel?> getBanner(String bannerId) async {
    ResponseModel response =
        await get(DatabaseConstants.bannerBaseUrl + bannerId);
    return response.isSuccess ? BannerModel.fromJson(response.data) : null;
  }

  @override
  Future getHomeData() {
    throw UnimplementedError();
  }

  @override
  Future<ProductModel?> getProduct(String productId) async {
    ResponseModel response =
        await get(DatabaseConstants.productBaseUrl + productId);
    return response.isSuccess ? ProductModel.fromJson(response.data) : null;
  }
}
