import '../constants.dart';
import '../widgets/custom_font.dart';
import '../widgets/custom_inkwell_button.dart';
import '../widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              // Logo
              Image.asset(
                'assets/logo/logo.png',
                height: 80.h,
              ),
              SizedBox(height: 80.h),
              // Title
              Align(
                alignment: Alignment.centerLeft,
                child: CustomFont(
                  text: 'Create an Account',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.h),
              // Email
              CustomTextFormField(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                controller: emailController,
                hintText: 'Email',
                fontSize: 14.sp,
                hintTextSize: 14.sp, 
                onSaved: (value) => emailController.text = value!, 
                validator: (value) => value!.isEmpty ? 'Required' : null, fontColor: Colors.black, 
              ),
              SizedBox(height: 15.h),
              // Password
              CustomTextFormField(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                controller: passwordController,
                isObscure: true,
                hintText: 'Password',
                fontSize: 14.sp,
                hintTextSize: 14.sp,
                onSaved: (value) => passwordController.text = value!,
                validator: (value) => value!.isEmpty ? 'Required' : null, fontColor: Colors.black,
              ),
              SizedBox(height: 15.h),
              // Confirm Password
              CustomTextFormField(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                controller: confirmPasswordController,
                isObscure: true,
                hintText: 'Confirm Password',
                fontSize: 14.sp,
                hintTextSize: 14.sp,
                onSaved: (value) => confirmPasswordController.text = value!,
                validator: (value) => value!.isEmpty ? 'Required' : null, fontColor: Colors.black,
              ),
              SizedBox(height: 30.h),
              // Register Button
              CustomInkwellButton(
                onTap: () {},
                height: 55.h,
                width: ScreenUtil().screenWidth,
                buttonName: 'Register',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
              // Footer
              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ", style: TextStyle(fontSize: 13.sp)),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp, color: FB_DARK_PRIMARY),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}