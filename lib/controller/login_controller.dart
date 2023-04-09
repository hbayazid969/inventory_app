import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';


final dio = Dio(BaseOptions(
  baseUrl: 'https://secure-falls-43052.herokuapp.com/api',
));


// @HiveType(typeId: 0)
// class Token {
//   @HiveField(0)
//   late String idToken;
//   Token({required this.idToken});
// }

//  saveToken(String idToken) async {
//   final box = await Hive.openBox<Token>('tokens');
//   await box.put('id', Token(idToken: idToken));
// }


Future<void> login(String username, String password, bool rememberMe) async {
  try {
    final response = await dio.post(
      '/authenticate',
      data: {
        'username': username,
        'password': password,
        'rememberMe': rememberMe,
      },
    );

    print("Login Success");
    print("${response.data}");

   // Get.to(HomePage());

    // final idToken = response.data['id_token'];
    //
    // await saveToken(idToken);



  } on DioError catch (e) {
    print("${e}");
  }
}
