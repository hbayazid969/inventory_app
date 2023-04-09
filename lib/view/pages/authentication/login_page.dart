import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_app/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/loginpage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

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
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value ?? false;
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
                  login(_usernameController.text.toString(), _passwordController.text.toString(), true);
                },
                child: Text('Login',style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
