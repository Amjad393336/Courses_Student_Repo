import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../View/dashboard_student.dart';
import '../../View/Sign_Up_Student.dart';
import '../../View/Login_Student.dart';
import '../Model/Auth_Response.dart';

// هذا الكلاس مسؤول عن عملية تسجيل الدخول
// يستخدم GetX (GetxController) لإدارة الحالة
class LoginController extends GetxController {
  final Dio _dio = Dio(); // كائن Dio للتعامل مع API

  // المتغيرات القابلة للمراقبة (Rx variables) لتخزين بيانات الإدخال
  final email = ''.obs; // بريد المستخدم
  final password = ''.obs; // كلمة المرور
  final isLoading = false.obs; // لمراقبة حالة التحميل (loading spinner)

  // دالة تسجيل الدخول
  Future<void> loginUser() async {
    // التحقق إذا كان الحقول فارغة
    if (email.value.isEmpty || password.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        backgroundColor: const Color(0xFFEF5350),
        colorText: Colors.white,
      );
      return; // وقف العملية إذا في نقص بالبيانات
    }

    // إظهار مؤشر التحميل
    isLoading.value = true;

    try {
      // إرسال طلب تسجيل الدخول إلى السيرفر
      final response = await _dio.post(
        'http://192.168.1.5:8000/api/login', // رابط API (عدله حسب مشروعك)
        data: {
          'email': email.value,
          'password': password.value,
        },
        options: Options(
          headers: {'Accept': 'application/json'}, // إعدادات الطلب
        ),
      );

      // إذا الرد من السيرفر ناجح (statusCode = 200)
      if (response.statusCode == 200) {
        // تحويل الرد إلى كائن AuthResponse
        final auth = AuthResponse.fromJson(response.data);

        // حفظ التوكن في SharedPreferences للتخزين المحلي
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', auth.token);
        await prefs.setString('token_type', auth.tokenType);

        // الانتقال مباشرة إلى لوحة الطالب
        Get.offAll(() => const Student_Dashboard());
      } else {
        // إذا الرد فشل (statusCode != 200)
        Get.snackbar(
          'Login Failed',
          'HTTP ${response.statusCode}',
          backgroundColor: const Color(0xFFEF5350),
          colorText: Colors.white,
        );
      }
    } on DioException catch (e) {
      // معالجة أخطاء Dio (مثلاً خطأ في الاستجابة)
      final msg = e.response?.data['message'] ?? 'Login failed';
      Get.snackbar(
        'Error',
        msg,
        backgroundColor: const Color(0xFFEF5350),
        colorText: Colors.white,
      );
    } catch (e) {
      // معالجة أي استثناءات أخرى غير متوقعة
      Get.snackbar(
        'Error',
        e.toString(),
        duration: const Duration(seconds: 40), // مدة عرض الرسالة
        backgroundColor: const Color(0xFFEF5350),
        colorText: Colors.white,
      );
    } finally {
      // إخفاء مؤشر التحميل في جميع الحالات
      isLoading.value = false;
    }
  }

  // دالة للانتقال إلى شاشة التسجيل Sign Up
  void goToSignUp() {
    Get.to(() => const SignUpScreen());
  }
}
