import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:inventory_app/view/pages/bottomnavbar/bottom_navbar_page.dart';

final dio = Dio(BaseOptions(
  baseUrl: 'https://secure-falls-43052.herokuapp.com/api',
));

String ?token ;

Future<void> login(String username, String password, bool rememberMe,BuildContext context) async {
  try {
    final response = await dio.post(
      '/authenticate',
      data: {
        'username': username,
        'password': password,
        'rememberMe': rememberMe,
      },
    );

    late Box box1;
    box1 = await Hive.openBox('userToken');
    box1.put('token', response.data['id_token']);
    if(box1.get('token')!=null){
        token = box1.get('token');
      }

    print("Your token is >>> ${token}");

    print("Login Success");
    print("${response.data}");



    Get.snackbar("Great!","Login Success",
      duration: Duration(seconds: 1),
      snackPosition: SnackPosition.BOTTOM,
    );

   Get.to(()=> BottomNavbarPage());

  } on DioError catch (e) {
    print("${e}");

    Get.snackbar("Oops!","Something went wrong",
      duration: Duration(seconds: 1),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
