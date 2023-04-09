import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_app/controller/login_controller.dart';
import 'package:inventory_app/view/pages/authentication/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'view/pages/bottomnavbar/bottom_navbar_page.dart';

void main() async {
  await Hive.initFlutter();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return GetMaterialApp(
          title: 'Inventory app',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: LoginPage.routeName,
          routes: {
            LoginPage.routeName: (context) => LoginPage(),
            BottomNavbarPage.routeName: (context) => BottomNavbarPage(),
          }

      );
    }
    );
  }
}

