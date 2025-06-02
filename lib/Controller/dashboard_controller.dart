// lib/controllers/dashboard_controller.dart

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:project_2/Model/category_model.dart';
import 'package:project_2/View/Login_Student.dart';
import 'package:shared_preferences/shared_preferences.dart';
// تأكد من أن هذا المسار صحيح ويشير إلى شاشة تسجيل الدخول

class DashboardController extends GetxController {
  final Dio _dio = Dio();

  var isLoading = false.obs;
  var categories = <Category>[].obs;
  var searchQuery = ''.obs;
  var noResults = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;
    try {
      final response = await _dio.get('http://192.168.1.16:8000/api/categories');
      final data = response.data['data'] as List<dynamic>;
      categories.value = data.map((e) => Category.fromJson(e)).toList();
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchCategories(String query) async {
    final q = query.trim();
    if (q.isEmpty) {
      return fetchCategories();
    }
    isLoading.value = true;
    try {
      final resp = await _dio.get(
        'http://192.168.1.16:8000/api/categories/search',
        queryParameters: {'query': q},
      );
      final listData = resp.data['data']['data'] as List;
      if (listData.isEmpty) {
        categories.clear();
        noResults.value = true;
      } else {
        noResults.value = false;
        final list = listData
            .map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList();
        categories.assignAll(list);
      }
    } catch (e) {
      categories.clear();
      noResults.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove('token');
      await prefs.remove('token_type');
      await prefs.remove('refresh_token');
      Get.offAll(() => Login());
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
