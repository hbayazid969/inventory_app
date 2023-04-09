
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:inventory_app/controller/login_controller.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://secure-falls-43052.herokuapp.com/api',
  ));

  Future<Map<String, dynamic>> fetchAccountData() async {
    try {
      Map<String, String> headers = {'Authorization': 'Bearer ${token}'};
      Options options = Options(headers: headers);
      final response = await _dio.get('/account',options: options);
      return response.data;
    } catch (error) {
      Get.snackbar(
        'Error',
        'Failed to fetch products: ${error.toString()}',
        duration: Duration(seconds: 1),
        snackPosition: SnackPosition.BOTTOM,
      );
      throw error.toString();
    }
  }
}

class AccountController extends GetxController {
  final ApiService _apiService = ApiService();

  RxMap<String, dynamic> accountData = RxMap({});

  @override
  void onInit() {
    super.onInit();
    fetchAccountData();
  }

  Future<void> fetchAccountData() async {
    final data = await _apiService.fetchAccountData();
    accountData.value = data;
  }
}

