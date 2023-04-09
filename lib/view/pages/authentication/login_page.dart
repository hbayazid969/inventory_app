import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inventory_app/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/loginpage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;

  late Box box1;

  @override
  void initState() {
    // TODO: implement initState
    createDB();
    getUserData();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.all(20.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 20.h),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        rememberMe = value ?? false;
                      });
                    },
                  ),
                  Text('Remember me'),
                ],
              ),
              SizedBox(height: 20.h),
              MaterialButton(
                color: Colors.blue,
                minWidth: 150.w,
                onPressed: () {
                  login(_usernameController.text.toString(), _passwordController.text.toString(), true,context);
                  saveUserData();
                  },
                child:  Text('Login',style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp
                ),) ,
              ),
            ],
          ),
        ),
      ),
    );
  }

//Functions for save user Data
  void createDB()async{
    box1 = await Hive.openBox('userData');
    getUserData();
  }

  void saveUserData(){
    if(rememberMe==true){
      box1.put('username', _usernameController.value.text);
      box1.put('password', _passwordController.value.text);
    }
  }

  void getUserData() async{
    if(box1.get('username')!=null){
      _usernameController.text = box1.get('username');
      rememberMe = true;
      setState(() {

      });
    }
    if(box1.get('password')!=null){
      _passwordController.text = box1.get('password');
      rememberMe = true;
      setState(() {

      });
    }
  }
}
