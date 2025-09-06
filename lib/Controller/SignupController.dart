import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/Model/SignupRequest.dart';
import '../../View/Login_Student.dart';

// هذا الكلاس مسؤول عن التحكم بعملية التسجيل (Sign up)
// يستخدم GetX (GetxController) لإدارة الحالة state
class SignupController extends GetxController {
  // المتغيرات القابلة للمراقبة (Rx) لكل حقل من حقول النموذج
  final firstName = ''.obs;
  final lastName = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final phone = ''.obs;
  final country = ''.obs;
  final city = ''.obs;
  final gender = ''.obs;
  final role = ''.obs;
  final dob = ''.obs; // تاريخ الميلاد
  final isLoading = false.obs; // لمراقبة حالة التحميل (loading spinner)

  // كائن Dio للتعامل مع API
  final Dio _dio = Dio();

  // دالة التسجيل في النظام
  Future<void> registerUser() async {
    // التحقق إذا كان أي حقل فارغ
    if ([
      firstName,
      lastName,
      email,
      password,
      phone,
      country,
      city,
      gender,
      role,
      dob
    ].any((e) => e.value.isEmpty)) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return; // وقف العملية
    }

    // إظهار مؤشر التحميل
    isLoading.value = true;

    try {
      // تجهيز البيانات كـ object من نوع SignupRequest
      final req = SignupRequest(
        firstName: firstName.value,
        lastName: lastName.value,
        email: email.value,
        password: password.value,
        phone: phone.value,
        country: country.value,
        city: city.value,
        gender: gender.value,
        role: role.value,
        dateOfBirth: dob.value,
      );

      // إرسال الطلب إلى API
      final resp = await _dio.post(
<<<<<<< HEAD
        'http://192.168.1.5:8000/api/student/register', // رابط الـ API
        data: req.toJson(), // تحويل البيانات إلى JSON
=======
        'http://192.168.1.5:8000/api/student/register',
        data: req.toJson(),
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
        options: Options(
          headers: {'Accept': 'application/json'},
          validateStatus: (status) =>
              status! < 500, // اعتبر كل status < 500 صحيح
        ),
      );

      // قراءة الاستجابة من السيرفر
      final status = resp.data['status'] as String?;
      final message = resp.data['message'] as String?;

      // إذا الاستجابة ناجحة (status == success و code == 201)
      if (status == 'success' && resp.statusCode == 201) {
        Get.snackbar(
          'Success',
          message ?? 'Registration successful',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        // الانتقال إلى صفحة تسجيل الدخول بعد نجاح التسجيل
        Get.offAll(() => Login());
      } else {
        // إذا فشل التسجيل
        Get.snackbar(
          'Error',
          message ?? 'Unknown error',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on DioException catch (e) {
      // في حالة خطأ اتصال أو خطأ من السيرفر
      final msg = e.response?.data['message'] ?? 'Connection error';
      Get.snackbar(
        'Error',
        msg,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      // إخفاء مؤشر التحميل بأي حال
      isLoading.value = false;
    }
  }

  // دالة للانتقال مباشرة إلى صفحة تسجيل الدخول
  void goToLogin() {
    Get.offAll(() => Login());
  }
}
