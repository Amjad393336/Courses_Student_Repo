// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class SignUpController extends GetxController {
//   final emailController = TextEditingController();
//  final fullNameController = TextEditingController();
  
//   final majorController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
   
 




//   /// تنظيف الكنترولات عند التخلص من الكنترولر
//   @override
//   void onClose() {
//     emailController.dispose();
//      fullNameController.dispose();

//     majorController.dispose();
   
//     confirmPasswordController.dispose();
//     passwordController.dispose();
    
//     super.onClose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  // حقول الإدخال
  final fullNameController = TextEditingController();
  final majorController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // رسائل الخطأ لكل حقل
  final fullNameError = ''.obs;
  final majorError = ''.obs;
  final emailError = ''.obs;
  final passwordError = ''.obs;
  final confirmPasswordError = ''.obs;

  void signUp() {
    // إعادة تهيئة الأخطاء
    fullNameError('');
    majorError('');
    emailError('');
    passwordError('');
    confirmPasswordError('');

    bool isValid = true;

    // التحقق من الاسم الكامل
    if (fullNameController.text.trim().isEmpty) {
      fullNameError('Full Name Is Required');
      isValid = false;
    }

    // التحقق من التخصص
    if (majorController.text.trim().isEmpty) {
      majorError('Major Name Is Required');
      isValid = false;
    }

    // التحقق من البريد الإلكتروني
    if (emailController.text.trim().isEmpty) {
      emailError('Email Name Is Required');
      isValid = false;
    } 

    // التحقق من كلمة المرور
    if (passwordController.text.isEmpty) {
      passwordError('Password Is Required');
      isValid = false;
    } else if (passwordController.text.length < 6) {
      passwordError('Pasword must contains at least 6 numbers');
      isValid = false;
    }

    // التحقق من تأكيد كلمة المرور
    if (confirmPasswordController.text.isEmpty) {
      confirmPasswordError('Confirm Password');
      isValid = false;
    } else if (confirmPasswordController.text != passwordController.text) {
      confirmPasswordError('Passwords are not identical');
      isValid = false;
    }

    if (isValid) {
      // جميع الحقول صحيحة، يمكنك تنفيذ منطق التسجيل هنا
      // مثل إرسال البيانات إلى السيرفر أو التنقل لشاشة أخرى
      Get.snackbar(
        'Success',
        'Registered',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    majorController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
