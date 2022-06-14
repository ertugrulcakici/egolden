import 'package:egolden/product/models/banner_model.dart';
import 'package:egolden/product/models/product_model.dart';

abstract class IDatabaseService {
  IDatabaseService();
  Future<BannerModel?> getBanner(String bannerId);
  Future getHomeData();
  Future<ProductModel?> getProduct(String productId);
}
