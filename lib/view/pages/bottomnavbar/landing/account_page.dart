import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_app/controller/account_controller.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final AccountController _accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return  Obx(()=>Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('My Account'),
      ),
      body: _accountController.accountData.isNotEmpty ?
      ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10.h,),
                Center(child: Image.network("${_accountController.accountData['imageUrl']}")),
               SizedBox(height: 20.h,),
                showUserData(
                  title: "UserName",
                    data: _accountController.accountData['firstName']
                ),
                showUserData(
                    title: "Email",
                    data: _accountController.accountData['email']
                ),
                showUserData(
                    title: "Phone",
                    data: _accountController.accountData['phone']
                ),

              ],
            ),
          ),
        ],
      ): Center(
          child: CircularProgressIndicator()
      ),
    ),
    );
  }

  Padding showUserData({String? data, String? title,}) {
    return Padding(
          padding:  EdgeInsets.all(10.r),
          child: Row(
            children: [
              Text("$title : ",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
              Text(
                  data.toString(),
                style: TextStyle(fontSize: 18.sp),
                ),
            ],
          ),
        );
  }
}
