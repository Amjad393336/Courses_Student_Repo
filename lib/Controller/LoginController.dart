import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/Model/Auth_Response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../View/dashboard_student.dart';
import '../../View/Sign_Up_Student.dart';
import '../../View/Login_Student.dart';

class LoginController extends GetxController {
  final Dio _dio = Dio();

  final email = ''.obs;
  final password = ''.obs;
  final isLoading = false.obs;

  Future<void> loginUser() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields', backgroundColor: const Color(0xFFEF5350), colorText: Colors.white);
      return;
    }
    isLoading.value = true;
    try {
      final response = await _dio.post(
        'http://192.168.1.16:8000/api/login',
        data: {'email': email.value, 'password': password.value},
        options: Options(headers: {'Accept': 'application/json'}),
      );
      if (response.statusCode == 200) {
        final auth = AuthResponse.fromJson(response.data);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', auth.token);
        await prefs.setString('token_type', auth.tokenType);
        await prefs.setString('refresh_token', auth.refreshToken);
        Get.offAll(() => const Student_Dashboard());
      } else {
        Get.snackbar('Login Failed', 'HTTP ${response.statusCode}', backgroundColor: const Color(0xFFEF5350), colorText: Colors.white);
      }
    } on DioException catch (e) {
      final msg = e.response?.data['message'] ?? 'Login failed';
      Get.snackbar('Error', msg, backgroundColor: const Color(0xFFEF5350), colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: const Color(0xFFEF5350), colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  void goToSignUp() {
    Get.to(() => const SignUpScreen());
  }
}