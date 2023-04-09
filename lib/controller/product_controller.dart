import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:inventory_app/controller/login_controller.dart';
import 'package:inventory_app/model/response_model/product_model.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://secure-falls-43052.herokuapp.com/api',
  ));

  Future<List<dynamic>> fetchProducts() async {
    try {

      Map<String, String> headers = {'Authorization': 'Bearer ${token}'};
      Options options = Options(headers: headers);
      final response = await _dio.get('/products',options: options);
      return response.data;
    } catch (error) {
      Get.snackbar(
        'Error',
        'Failed to fetch products: ${error.toString()}',
        duration: Duration(seconds: 1),
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }
}

class ProductController extends GetxController {
  final ApiService _apiService = ApiService();

  RxList<dynamic> products = RxList([]);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final data = await _apiService.fetchProducts();
    products.value = data;
  }
}

