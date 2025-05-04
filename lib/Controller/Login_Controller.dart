import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
 
  final emailError = ''.obs;
  final passwordError = ''.obs;

  void login() {
    // إعادة تهيئة الأخطاء
    
    emailError('');
    passwordError('');
    

    bool isValid = true;

    // التحقق من الاسم الكامل
   

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
   

    if (isValid) {
      // جميع الحقول صحيحة، يمكنك تنفيذ منطق التسجيل هنا
      // مثل إرسال البيانات إلى السيرفر أو التنقل لشاشة أخرى
      Get.snackbar(
        'Success',
        'Login',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  /// تنظيف الكنترولات عند التخلص من الكنترولر
  @override
  void onClose() {
    emailController.dispose();
  
    passwordController.dispose();
    
    super.onClose();
  }
}