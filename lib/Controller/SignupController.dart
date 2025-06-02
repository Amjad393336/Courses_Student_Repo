import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/Model/SignupRequest.dart';

import '../../View/Login_Student.dart';

class SignupController extends GetxController {
  final firstName = ''.obs;
  final lastName = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final phone = ''.obs;
  final country = ''.obs;
  final city = ''.obs;
  final gender = ''.obs;
  final role = ''.obs;
  final dob = ''.obs;
  final isLoading = false.obs;
  final Dio _dio = Dio();

  Future<void> registerUser() async {
    if ([firstName, lastName, email, password, phone, country, city, gender, role, dob]
        .any((e) => e.value.isEmpty)) {
      Get.snackbar('Error', 'Please fill all fields', backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    isLoading.value = true;
    try {
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
      final resp = await _dio.post(
        'http://192.168.1.16:8000/api/student/register',
        data: req.toJson(),
        options: Options(
          headers: {'Accept': 'application/json'},
          validateStatus: (status) => status! < 500,
        ),
      );
      final status = resp.data['status'] as String?;
      final message = resp.data['message'] as String?;
      if (status == 'success' && resp.statusCode == 201) {
        Get.snackbar('Success', message ?? 'Registration successful', backgroundColor: Colors.green, colorText: Colors.white);
        Get.offAll(() => Login());
      } else {
        Get.snackbar('Error', message ?? 'Unknown error', backgroundColor: Colors.red, colorText: Colors.white);
      }
    } on DioException catch (e) {
      final msg = e.response?.data['message'] ?? 'Connection error';
      Get.snackbar('Error', msg, backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  void goToLogin() {
    Get.offAll(() => Login());
  }
}