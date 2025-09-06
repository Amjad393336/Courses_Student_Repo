// // // // lib/controllers/dashboard_controller.dart
// // //
// // // import 'package:get/get.dart';
// // // import 'package:dio/dio.dart';
// // // import 'package:project_2/Model/category_model.dart';
// // // import 'package:project_2/View/Login_Student.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // // // تأكد من أن هذا المسار صحيح ويشير إلى شاشة تسجيل الدخول
// // //
// // // class DashboardController extends GetxController {
// // //   final Dio _dio = Dio();
// // //
// // //   var isLoading = false.obs;
// // //   var categories = <Category>[].obs;
// // //   var searchQuery = ''.obs;
// // //   var noResults = false.obs;
// // //
// // //   @override
// // //   void onInit() {
// // //     super.onInit();
// // //     fetchCategories();
// // //   }
// // //
// // //   Future<void> fetchCategories() async {
// // //     isLoading.value = true;
// // //     try {
// // //       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
// // //       final data = response.data['data'] as List<dynamic>;
// // //       categories.value = data.map((e) => Category.fromJson(e)).toList();
// // //     } catch (e) {
// // //       Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e');
// // //     } finally {
// // //       isLoading.value = false;
// // //     }
// // //   }
// // //
// // //
// // //
// // //   Future<void> logout() async {
// // //     isLoading.value = true;
// // //     final prefs = await SharedPreferences.getInstance();
// // //     try {
// // //       await prefs.remove('token');
// // //       await prefs.remove('token_type');
// // //       await prefs.remove('refresh_token');
// // //       Get.offAll(() => Login());
// // //     } catch (e) {
// // //       Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e');
// // //     } finally {
// // //       isLoading.value = false;
// // //     }
// // //   }
// // // }
// //
// // // lib/controllers/dashboard_controller.dart
// //
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:dio/dio.dart';
// // import 'package:project_2/Model/category_model.dart';
// // import 'package:project_2/View/Login_Student.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import '../Model/course-model.dart';
// //
// // class DashboardController extends GetxController {
// //   final Dio _dio = Dio();
// //
// //   var isLoading = false.obs;
// //   var categories = <Category>[].obs;
// //   var coursesByTeacher = <CourseByTeacher>[].obs;
// //   var searchQuery = ''.obs;
// //   var noResults = false.obs;
// //   var searchingByTeacher = false.obs;
// //   void clearCourseSearch() {
// //     searchingByTeacher.value = false;
// //     coursesByTeacher.clear();
// //     noResults.value = false;
// //   }
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     fetchCategories();
// //   }
// //
// //   Future<void> fetchCategories() async {
// //     isLoading.value = true;
// //     searchingByTeacher.value = false;
// //     try {
// //       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
// //       final data = response.data['data'] as List<dynamic>;
// //       categories.value = data.map((e) => Category.fromJson(e)).toList();
// //       noResults.value = categories.isEmpty;
// //     } catch (e) {
// //       Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e');
// //       noResults.value = true;
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// //
// //   Future<void> searchCoursesByTeacher(String teacherName) async {
// //     if (teacherName.trim().isEmpty) {
// //       fetchCategories();
// //       return;
// //     }
// //     isLoading.value = true;
// //     searchingByTeacher.value = true;
// //     try {
// //       final response = await _dio.post(
// //         'http://192.168.1.5:8000:8000/api/courses/byTeacher',
// //         data: {'teacher_name': teacherName},
// //         options: Options(headers: {'Accept': 'application/json'}),
// //       );
// //       final resultList = response.data['data'] as List<dynamic>;
// //       if (resultList.isEmpty) {
// //         coursesByTeacher.clear();
// //         noResults.value = true;
// //       } else {
// //         coursesByTeacher.value =
// //             resultList.map((e) => CourseByTeacher.fromJson(e)).toList();
// //         noResults.value = false;
// //       }
// //     } on DioException catch (e) {
// //       final msg = e.response?.data['message'] ?? 'خطأ غير معروف في البحث';
// //       Get.snackbar('خطأ', msg.toString(), backgroundColor: Colors.red, colorText: Colors.white);
// //       noResults.value = true;
// //     } catch (e) {
// //       Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e');
// //       noResults.value = true;
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// //
// //   Future<void> logout() async {
// //     isLoading.value = true;
// //     final prefs = await SharedPreferences.getInstance();
// //     try {
// //       await prefs.remove('token');
// //       await prefs.remove('token_type');
// //       await prefs.remove('refresh_token');
// //       Get.offAll(() => Login());
// //     } catch (e) {
// //       Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e');
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// // }
// //
//
// // lib/Controller/dashboard_controller.dart
//
// // import 'package:get/get.dart';
// // import 'package:dio/dio.dart' as dio;
// // import 'package:project_2/Model/category_model.dart';
// // import 'package:project_2/View/Login_Student.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import '../Model/course-model.dart';
// //
// // class DashboardController extends GetxController {
// //   final dio.Dio _dio = dio.Dio();
// //
// //   var isLoading = false.obs;
// //   var categories = <Category>[].obs;
// //   var searchQuery = ''.obs;
// //   var noResults = false.obs;
// //   var searchingByTeacher = false.obs;
// //   var searchingByCourse = false.obs;
// //
// //   var coursesByTeacher = <Course>[].obs;
// //   var coursesByName = <Course>[].obs;
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     fetchCategories();
// //   }
// //
// //   Future<void> fetchCategories() async {
// //     isLoading.value = true;
// //     searchingByTeacher.value = false;
// //     searchingByCourse.value = false;
// //     noResults.value = false;
// //     try {
// //       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
// //       final data = response.data['data'] as List<dynamic>;
// //       categories.value = data.map((e) => Category.fromJson(e)).toList();
// //       noResults.value = categories.isEmpty;
// //     } catch (e) {
// //       Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e');
// //       noResults.value = true;
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// //
// //   Future<void> searchCoursesByTeacher(String teacherName) async {
// //     if (teacherName.trim().isEmpty) return;
// //     isLoading.value = true;
// //     searchingByTeacher.value = true;
// //     searchingByCourse.value = false;
// //     noResults.value = false;
// //     coursesByTeacher.clear();
// //
// //     try {
// //       final response = await _dio.post(
// //         'http://192.168.1.5:8000:8000/api/courses/byTeacher',
// //         data: {"teacher_name": teacherName.trim()},
// //       );
// //       if (response.data['status'] == "success") {
// //         final List<dynamic> data = response.data['data'];
// //         coursesByTeacher.value = data.map((e) => Course.fromJson(e)).toList();
// //         noResults.value = coursesByTeacher.isEmpty;
// //       } else {
// //         noResults.value = true;
// //         Get.snackbar('بحث', 'لم يتم العثور على كورسات للأستاذ');
// //       }
// //     } catch (e) {
// //       noResults.value = true;
// //       Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e');
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// //
// //   Future<void> searchCoursesByName(String courseName) async {
// //     if (courseName.trim().isEmpty) return;
// //     isLoading.value = true;
// //     searchingByTeacher.value = false;
// //     searchingByCourse.value = true;
// //     noResults.value = false;
// //     coursesByName.clear();
// //
// //     try {
// //       final response = await _dio.post(
// //         'http://192.168.1.5:8000:8000/api/courses/byName',
// //         data: {"course_name": courseName.trim()},
// //       );
// //       if (response.data['status'] == "success") {
// //         final List<dynamic> data = response.data['data'];
// //         coursesByName.value = data.map((e) => Course.fromJson(e)).toList();
// //         noResults.value = coursesByName.isEmpty;
// //       } else {
// //         noResults.value = true;
// //         Get.snackbar('بحث', 'لم يتم العثور على كورسات بهذا الاسم');
// //       }
// //     } catch (e) {
// //       noResults.value = true;
// //       Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e');
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// //
// //   // لمسح نتائج البحث والعودة للفئات
// //   void clearCourseSearch() {
// //     searchingByTeacher.value = false;
// //     searchingByCourse.value = false;
// //     coursesByTeacher.clear();
// //     coursesByName.clear();
// //     fetchCategories();
// //   }
// //
// //   Future<void> logout() async {
// //     isLoading.value = true;
// //     final prefs = await SharedPreferences.getInstance();
// //     try {
// //       await prefs.remove('token');
// //       await prefs.remove('token_type');
// //       await prefs.remove('refresh_token');
// //       Get.offAll(() => Login());
// //     } catch (e) {
// //       Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e');
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// // }
// // lib/Controller/dashboard_controller.dart
//
// // import 'package:dio/dio.dart' as dio;
// // import 'package:get/get.dart';
// // import 'package:dio/dio.dart';
// //
// // import 'package:project_2/Model/category_model.dart';
// // import 'package:project_2/View/Login_Student.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import '../Model/course-model.dart';
// //
// // class DashboardController extends GetxController {
// //   final Dio _dio = Dio();
// //
// //   var isLoading = false.obs;
// //   var categories = <Category>[].obs;
// //   var noResults = false.obs;
// //
// //   // بحث متقدم
// //   var coursesBySearch = <Course>[].obs; // قائمة نتائج البحث سواء باسم أستاذ أو كورس
// //   var searchType = 'teacher'.obs; // teacher OR course
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     fetchCategories();
// //   }
// //
// //   /// جلب الفئات الرئيسية
// //   Future<void> fetchCategories() async {
// //     isLoading.value = true;
// //     noResults.value = false;
// //     try {
// //       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
// //       final data = response.data['data'] as List<dynamic>;
// //       categories.value = data.map((e) => Category.fromJson(e)).toList();
// //       noResults.value = categories.isEmpty;
// //       coursesBySearch.clear();
// //     } catch (e) {
// //       Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e');
// //       noResults.value = true;
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// //
// //   /// بحث ذكي: إذا كان نوع البحث teacher يبحث باسم أستاذ، إذا كان course يبحث باسم كورس
// //   Future<void> searchCourses(String value) async {
// //     value = value.trim();
// //     if (value.isEmpty) return;
// //
// //     isLoading.value = true;
// //     noResults.value = false;
// //     coursesBySearch.clear();
// //
// //     try {
// //     late dio.Response res;
// //       if (searchType.value == 'teacher') {
// //         res = await _dio.post(
// //           'http://192.168.1.5:8000:8000/api/courses/byTeacher',
// //           data: {'teacher_name': value},
// //           options: Options(headers: {'Accept': 'application/json'}),
// //         );
// //       } else {
// //         res = await _dio.post(
// //           'http://192.168.1.5:8000:8000/api/courses/byName',
// //           data: {'course_name': value},
// //           options: Options(headers: {'Accept': 'application/json'}),
// //         );
// //       }
// //
// //       if (res.statusCode == 200 && res.data['status'] == 'success') {
// //         final data = res.data['data'] as List<dynamic>;
// //         coursesBySearch.value =
// //             data.map((e) => Course.fromJson(e)).toList();
// //         noResults.value = coursesBySearch.isEmpty;
// //       } else {
// //         Get.snackbar('تنبيه', 'لا توجد نتائج لهذا البحث');
// //         noResults.value = true;
// //       }
// //     } catch (e) {
// //       Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e');
// //       noResults.value = true;
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// //
// //   /// لإلغاء نتائج البحث والعودة للعرض الافتراضي
// //   void clearCourseSearch() {
// //     coursesBySearch.clear();
// //     noResults.value = false;
// //   }
// //
// //   /// تسجيل الخروج
// //   Future<void> logout() async {
// //     isLoading.value = true;
// //     final prefs = await SharedPreferences.getInstance();
// //     try {
// //       await prefs.remove('token');
// //       await prefs.remove('token_type');
// //       await prefs.remove('refresh_token');
// //       Get.offAll(() => Login());
// //     } catch (e) {
// //       Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e');
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// // }
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/View/Login_Student.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../Model/course-model.dart';
//
// class DashboardController extends GetxController {
//   final dio.Dio _dio = dio.Dio();
//
//   var isLoading = false.obs;
//   var categories = <Category>[].obs;
//   var coursesBySearch = <Course>[].obs;
//   var noResults = false.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//   }
//
//   Future<void> fetchCategories() async {
//     isLoading.value = true;
//     coursesBySearch.clear();
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
//       final data = response.data['data'] as List<dynamic>;
//       categories.value = data.map((e) => Category.fromJson(e)).toList();
//       noResults.value = categories.isEmpty;
//     } catch (e) {
//       Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e');
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   Future<void> searchCourses(String value) async {
//     value = value.trim();
//     if (value.isEmpty) {
//       coursesBySearch.clear();
//       noResults.value = false;
//       fetchCategories();
//       return;
//     }
//     isLoading.value = true;
//     coursesBySearch.clear();
//     noResults.value = false;
//
//     try {
//       // ابحث أولاً باسم الأستاذ
//       dio.Response resTeacher = await _dio.post(
//         'http://192.168.1.5:8000:8000/api/courses/byTeacher',
//         data: {'teacher_name': value},
//         options: dio.Options(headers: {'Accept': 'application/json'}),
//       );
//       List<Course> results = [];
//       if (resTeacher.data['status'] == 'success' && resTeacher.data['data'] is List) {
//         results = (resTeacher.data['data'] as List)
//             .map((e) => Course.fromJson(e)).toList();
//       }
//       // إذا لم تظهر نتائج باسم الأستاذ، جرّب باسم الكورس
//       if (results.isEmpty) {
//         dio.Response resCourse = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byName',
//           data: {'course_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCourse.data['status'] == 'success' && resCourse.data['data'] is List) {
//           results = (resCourse.data['data'] as List)
//               .map((e) => Course.fromJson(e)).toList();
//         }
//       }
//       coursesBySearch.value = results;
//       noResults.value = results.isEmpty;
//     } catch (e) {
//       Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e');
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   void clearCourseSearch() {
//     coursesBySearch.clear();
//     noResults.value = false;
//     fetchCategories();
//   }
//
//   Future<void> logout() async {
//     isLoading.value = true;
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       await prefs.remove('token');
//       await prefs.remove('token_type');
//       await prefs.remove('refresh_token');
//       Get.offAll(() => Login());
//     } catch (e) {
//       Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
//
//

// lib/Controller/dashboard_controller.dart

// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/View/Login_Student.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Model/course-model.dart';
//
// class DashboardController extends GetxController {
//   final dio.Dio _dio = dio.Dio();
//
//   var isLoading = false.obs;
//   var categories = <Category>[].obs;
//   var coursesBySearch = <Course>[].obs;
//   var noResults = false.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//   }
//
//   Future<void> fetchCategories() async {
//     isLoading.value = true;
//     coursesBySearch.clear();
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
//       final data = response.data['data'] as List<dynamic>;
//       categories.value = data.map((e) => Category.fromJson(e)).toList();
//       noResults.value = categories.isEmpty;
//     } catch (e) {
//       Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e');
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   /// البحث باسم أستاذ أو كورس أو فئة
//   Future<void> searchCourses(String value) async {
//     value = value.trim();
//     if (value.isEmpty) {
//       coursesBySearch.clear();
//       noResults.value = false;
//       fetchCategories();
//       return;
//     }
//     isLoading.value = true;
//     coursesBySearch.clear();
//     noResults.value = false;
//
//     try {
//       // 1- بحث باسم الأستاذ
//       dio.Response resTeacher = await _dio.post(
//         'http://192.168.1.5:8000:8000/api/courses/byTeacher',
//         data: {'teacher_name': value},
//         options: dio.Options(headers: {'Accept': 'application/json'}),
//       );
//       List<Course> results = [];
//       if (resTeacher.data['status'] == 'success' && resTeacher.data['data'] is List) {
//         results = (resTeacher.data['data'] as List)
//             .map((e) => Course.fromJson(e)).toList();
//       }
//
//       // 2- إذا لم تظهر نتائج باسم الأستاذ، جرّب باسم الكورس
//       if (results.isEmpty) {
//         dio.Response resCourse = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byName',
//           data: {'course_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCourse.data['status'] == 'success' && resCourse.data['data'] is List) {
//           results = (resCourse.data['data'] as List)
//               .map((e) => Course.fromJson(e)).toList();
//         }
//       }
//
//       // 3- إذا لم تظهر نتائج باسم الكورس، جرّب باسم الفئة
//       if (results.isEmpty) {
//         dio.Response resCategory = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byCategory',
//           data: {'category_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCategory.data['status'] == 'success' && resCategory.data['data'] is List) {
//           results = (resCategory.data['data'] as List)
//               .map((e) => Course.fromJson(e)).toList();
//         }
//       }
//
//       coursesBySearch.value = results;
//       noResults.value = results.isEmpty;
//     } catch (e) {
//       Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e');
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   void clearCourseSearch() {
//     coursesBySearch.clear();
//     noResults.value = false;
//     fetchCategories();
//   }
//
//   Future<void> logout() async {
//     isLoading.value = true;
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       await prefs.remove('token');
//       await prefs.remove('token_type');
//       await prefs.remove('refresh_token');
//       Get.offAll(() => Login());
//     } catch (e) {
//       Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// lib/Controller/dashboard_controller.dart

// lib/Controller/dashboard_controller.dart
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/View/Login_Student.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Model/course-model.dart';

// class DashboardController extends GetxController {
//   final dio.Dio _dio = dio.Dio();

//   var isLoading = false.obs;
//   var categories = <Category>[].obs;
//   var coursesBySearch = <Course>[].obs;
//   var coursesByCategory = <Course>[].obs; // الجديد
//   var noResults = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//   }

//   Future<void> fetchCategories() async {
//     isLoading.value = true;
//     coursesBySearch.clear();
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
//       final data = response.data['data'] as List<dynamic>;
//       categories.value = data.map((e) => Category.fromJson(e)).toList();
//       noResults.value = categories.isEmpty;
//     } catch (e) {
//       Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e');
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // الدالة الجديدة: جلب كورسات حسب التصنيف
//   Future<void> fetchCoursesByCategoryId(int categoryId) async {
//     isLoading.value = true;
//     coursesByCategory.clear();
//     noResults.value = false;
//     try {
//       final response = await _dio.get(
//           'http://192.168.1.5:8000:8000/api/courses/byCategory/$categoryId',
//           options: dio.Options(headers: {'Accept': 'application/json'}));
//       if (response.data['status'] == 'success') {
//         final data = response.data['data'] as List<dynamic>;
//         coursesByCategory.value = data.map((e) => Course.fromJson(e)).toList();
//         noResults.value = coursesByCategory.isEmpty;
//       } else {
//         coursesByCategory.clear();
//         noResults.value = true;
//       }
//     } catch (e) {
//       Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الكورسات: $e');
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // باقي دوال البحث لم تتغير...

//   Future<void> searchCourses(String value) async {
//     value = value.trim();
//     if (value.isEmpty) {
//       coursesBySearch.clear();
//       noResults.value = false;
//       fetchCategories();
//       return;
//     }
//     isLoading.value = true;
//     coursesBySearch.clear();
//     noResults.value = false;

//     try {
//       dio.Response resTeacher = await _dio.post(
//         'http://192.168.1.5:8000:8000/api/courses/byTeacher',
//         data: {'teacher_name': value},
//         options: dio.Options(headers: {'Accept': 'application/json'}),
//       );
//       List<Course> results = [];
//       if (resTeacher.data['status'] == 'success' && resTeacher.data['data'] is List) {
//         results = (resTeacher.data['data'] as List)
//             .map((e) => Course.fromJson(e)).toList();
//       }

//       if (results.isEmpty) {
//         dio.Response resCourse = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byName',
//           data: {'course_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCourse.data['status'] == 'success' && resCourse.data['data'] is List) {
//           results = (resCourse.data['data'] as List)
//               .map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       if (results.isEmpty) {
//         dio.Response resCategory = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byCategory',
//           data: {'category_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCategory.data['status'] == 'success' && resCategory.data['data'] is List) {
//           results = (resCategory.data['data'] as List)
//               .map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       coursesBySearch.value = results;
//       noResults.value = results.isEmpty;
//     } catch (e) {
//       Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e');
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void clearCourseSearch() {
//     coursesBySearch.clear();
//     noResults.value = false;
//     fetchCategories();
//   }

//   Future<void> logout() async {
//     isLoading.value = true;
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       await prefs.remove('token');
//       await prefs.remove('token_type');
//       await prefs.remove('refresh_token');
//       Get.offAll(() => Login());
//     } catch (e) {
//       Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
// lib/Controller/dashboard_controller.dart
// lib/Controller/dashboard_controller.dart

//
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/Model/course-model.dart';
// import 'package:project_2/View/Login_Student.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class DashboardController extends GetxController {
//   final dio.Dio _dio = dio.Dio();
//
//   var isLoading = false.obs;
//   var categories = <Category>[].obs;
//   var coursesBySearch = <Course>[].obs;
//   var coursesByCategory = <Course>[].obs;
//   var noResults = false.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//   }
//
//   Future<void> fetchCategories() async {
//     isLoading.value = true;
//     coursesBySearch.clear();
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
//       final data = response.data['data'] as List<dynamic>;
//       categories.value = data.map((e) => Category.fromJson(e)).toList();
//       noResults.value = categories.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // الحل: استدعِ هذه الدالة فقط من initState في صفحة عرض الكورسات وليس من build أو Obx
//
//   // باقي دوال البحث لم تتغير ...
//   Future<void> searchCourses(String value) async {
//     value = value.trim();
//     if (value.isEmpty) {
//       coursesBySearch.clear();
//       noResults.value = false;
//       fetchCategories();
//       return;
//     }
//     isLoading.value = true;
//     coursesBySearch.clear();
//     noResults.value = false;
//
//     try {
//       dio.Response resTeacher = await _dio.post(
//         'http://192.168.1.5:8000:8000/api/courses/byTeacher',
//         data: {'teacher_name': value},
//         options: dio.Options(headers: {'Accept': 'application/json'}),
//       );
//       List<Course> results = [];
//       if (resTeacher.data['status'] == 'success' && resTeacher.data['data'] is List) {
//         results = (resTeacher.data['data'] as List)
//             .map((e) => Course.fromJson(e)).toList();
//       }
//
//       if (results.isEmpty) {
//         dio.Response resCourse = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byName',
//           data: {'course_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCourse.data['status'] == 'success' && resCourse.data['data'] is List) {
//           results = (resCourse.data['data'] as List)
//               .map((e) => Course.fromJson(e)).toList();
//         }
//       }
//
//       if (results.isEmpty) {
//         dio.Response resCategory = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byCategory',
//           data: {'category_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCategory.data['status'] == 'success' && resCategory.data['data'] is List) {
//           results = (resCategory.data['data'] as List)
//               .map((e) => Course.fromJson(e)).toList();
//         }
//       }
//
//       coursesBySearch.value = results;
//       noResults.value = results.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   void clearCourseSearch() {
//     coursesBySearch.clear();
//     noResults.value = false;
//     fetchCategories();
//   }
//
//   Future<void> logout() async {
//     isLoading.value = true;
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       await prefs.remove('token');
//       await prefs.remove('token_type');
//       await prefs.remove('refresh_token');
//       Get.offAll(() => Login());
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e'));
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:project_2/Model/category_model.dart';

// import 'package:project_2/View/Login_Student.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../Model/course-model.dart';

// class DashboardController extends GetxController {
//   final dio.Dio _dio = dio.Dio();

//   var isLoading = false.obs;
//   var categories = <Category>[].obs;
//   var coursesBySearch = <Course>[].obs;
//   var coursesByCategory = <Course>[].obs;
//   var noResults = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//   }

//   Future<void> fetchCategories() async {
//     isLoading.value = true;
//     coursesBySearch.clear();
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
//       final data = response.data['data'] as List<dynamic>;
//       categories.value = data.map((e) => Category.fromJson(e)).toList();
//       noResults.value = categories.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // جلب الكورسات حسب التصنيف بالآي دي:
//   Future<void> fetchCoursesByCategoryId(int categoryId) async {
//     isLoading.value = true;
//     coursesByCategory.clear();
//     noResults.value = false;
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/courses/byCategory/$categoryId');
//       if (response.data['status'] == 'success' && response.data['data'] is List) {
//         coursesByCategory.value = (response.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//       } else {
//         coursesByCategory.clear();
//         noResults.value = true;
//       }
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'تعذر جلب الكورسات: $e'));
//       coursesByCategory.clear();
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }
//   Future<void> searchCourses(String value) async {
//     value = value.trim();
//     if (value.isEmpty) {
//       coursesBySearch.clear();
//       noResults.value = false;
//       fetchCategories();
//       return;
//     }
//     isLoading.value = true;
//     coursesBySearch.clear();
//     noResults.value = false;

//     try {
//       dio.Response resTeacher = await _dio.post(
//         'http://192.168.1.5:8000:8000/api/courses/byTeacher',
//         data: {'teacher_name': value},
//         options: dio.Options(headers: {'Accept': 'application/json'}),
//       );
//       List<Course> results = [];
//       if (resTeacher.data['status'] == 'success' && resTeacher.data['data'] is List) {
//         results = (resTeacher.data['data'] as List)
//             .map((e) => Course.fromJson(e)).toList();
//       }

//       if (results.isEmpty) {
//         dio.Response resCourse = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byName',
//           data: {'course_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCourse.data['status'] == 'success' && resCourse.data['data'] is List) {
//           results = (resCourse.data['data'] as List)
//               .map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       if (results.isEmpty) {
//         dio.Response resCategory = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byCategory',
//           data: {'category_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCategory.data['status'] == 'success' && resCategory.data['data'] is List) {
//           results = (resCategory.data['data'] as List)
//               .map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       coursesBySearch.value = results;
//       noResults.value = results.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void clearCourseSearch() {
//     coursesBySearch.clear();
//     noResults.value = false;
//     fetchCategories();
//   }

//   Future<void> logout() async {
//     isLoading.value = true;
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       await prefs.remove('token');
//       await prefs.remove('token_type');
//       await prefs.remove('refresh_token');
//       Get.offAll(() => Login());
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e'));
//     } finally {
//       isLoading.value = false;
//     }
//   }

// }

// lib/Controller/dashboard_controller.dart
// import 'dart:async';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/Model/course-model.dart';
// import 'package:project_2/Model/exam.dart';
// import 'package:project_2/View/Login_Student.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DashboardController extends GetxController {
//   final dio.Dio _dio = dio.Dio();

//   // ===== الحالة العامة =====
//   var isLoading = false.obs;
//   var categories = <Category>[].obs;
//   var coursesBySearch = <Course>[].obs;
//   var coursesByCategory = <Course>[].obs;
//   var noResults = false.obs;

//   // ===== حالة الامتحان =====
//   var examLoading = false.obs;
//   var examError = ''.obs;
//   var currentExam = Rxn<Exam>();
//   var remainingSeconds = 0.obs;
//   Timer? _timer;

//   /// اختيارات الطالب: questionId -> choiceId
//   var selectedChoiceByQid = <int, int>{}.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//   }

//   // =========================
//   //  Categories & Courses
//   // =========================
//   Future<void> fetchCategories() async {
//     isLoading.value = true;
//     coursesBySearch.clear();
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
//       final data = response.data['data'] as List<dynamic>;
//       categories.value = data.map((e) => Category.fromJson(e)).toList();
//       noResults.value = categories.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> fetchCoursesByCategoryId(int categoryId) async {
//     isLoading.value = true;
//     coursesByCategory.clear();
//     noResults.value = false;
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/courses/byCategory/$categoryId');
//       if (response.data['status'] == 'success' && response.data['data'] is List) {
//         coursesByCategory.value =
//             (response.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//       } else {
//         coursesByCategory.clear();
//         noResults.value = true;
//       }
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'تعذر جلب الكورسات: $e'));
//       coursesByCategory.clear();
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> searchCourses(String value) async {
//     value = value.trim();
//     if (value.isEmpty) {
//       coursesBySearch.clear();
//       noResults.value = false;
//       fetchCategories();
//       return;
//     }
//     isLoading.value = true;
//     coursesBySearch.clear();
//     noResults.value = false;

//     try {
//       dio.Response resTeacher = await _dio.post(
//         'http://192.168.1.5:8000:8000/api/courses/byTeacher',
//         data: {'teacher_name': value},
//         options: dio.Options(headers: {'Accept': 'application/json'}),
//       );
//       List<Course> results = [];
//       if (resTeacher.data['status'] == 'success' && resTeacher.data['data'] is List) {
//         results = (resTeacher.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//       }

//       if (results.isEmpty) {
//         dio.Response resCourse = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byName',
//           data: {'course_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCourse.data['status'] == 'success' && resCourse.data['data'] is List) {
//           results = (resCourse.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       if (results.isEmpty) {
//         dio.Response resCategory = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byCategory',
//           data: {'category_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCategory.data['status'] == 'success' && resCategory.data['data'] is List) {
//           results = (resCategory.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       coursesBySearch.value = results;
//       noResults.value = results.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void clearCourseSearch() {
//     coursesBySearch.clear();
//     noResults.value = false;
//     fetchCategories();
//   }

//   Future<void> logout() async {
//     isLoading.value = true;
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       await prefs.remove('token');
//       await prefs.remove('token_type');
//       await prefs.remove('refresh_token');
//       Get.offAll(() => Login());
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e'));
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // =========================
//   //          Exam
//   // =========================
//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     final tokenType = prefs.getString('token_type') ?? 'Bearer';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty) 'Authorization': '$tokenType $token',
//     };
//   }

//   /// تحديد الـ courseId حسب قواعدك:
//   /// - طبي=1, رياضيات=2, كيمياء=3
//   /// - Chemistry Nuclear=4, Chemistry Normal=4
//   int resolveCourseIdForExam({
//     required String? categoryName,
//     required String courseName,
//     required int fallbackCourseId,
//   }) {
//     final name = (categoryName ?? '').trim();
//     if (name == 'طبي') return 1;
//     if (name == 'رياضيات') return 2;
//     if (name == 'كيمياء') return 3;

//     // overrides by course title
//     final title = courseName.trim();
//     if (title == 'Chemistry Nuclear') return 4;
//     if (title == 'Chemistry Normal') return 4;

//     // fallback على courseId القادم من الـ API
//     return fallbackCourseId;
//   }

//   /// يجلب الامتحان لكورس معيّن
//   Future<void> fetchExamByCourseId(int courseId) async {
//     examLoading.value = true;
//     examError.value = '';
//     currentExam.value = null;
//     selectedChoiceByQid.clear();
//     _stopTimer();

//     try {
//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000:8000/api/courses/$courseId/exam/student';
//       final res = await _dio.get(url, options: dio.Options(headers: headers));

//       if (res.data is Map && (res.data['status']?.toString().toLowerCase() == 'success')) {
//         final exam = Exam.fromApiRoot(res.data as Map<String, dynamic>);
//         if (exam == null) {
//           examError.value = 'لم يتم العثور على بيانات امتحان.';
//         } else {
//           currentExam.value = exam;
//           remainingSeconds.value = exam.durationMinutes * 60;
//           _startTimer();
//         }
//       } else {
//         examError.value = res.data?['message']?.toString() ?? 'فشل جلب الامتحان.';
//       }
//     } catch (e) {
//       examError.value = 'فشل جلب الامتحان: $e';
//     } finally {
//       examLoading.value = false;
//     }
//   }

//   void selectChoice(int questionId, int choiceId) {
//     selectedChoiceByQid[questionId] = choiceId;
//     selectedChoiceByQid.refresh();
//   }

//   Future<void> submitExamAnswers() async {
//     // مكان الربط مع API التسليم (POST) عندما يصبح جاهزًا
//     final answered = selectedChoiceByQid.length;
//     Get.snackbar('تم', 'حفظت $answered إجابة محليًا. (اربط POST لاحقًا)');
//   }

//   void _startTimer() {
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       if (remainingSeconds.value <= 0) {
//         _timer?.cancel();
//       } else {
//         remainingSeconds.value = remainingSeconds.value - 1;
//       }
//     });
//   }

//   void _stopTimer() {
//     _timer?.cancel();
//     _timer = null;
//   }

//   String formatRemaining() {
//     final s = remainingSeconds.value;
//     final m = s ~/ 60;
//     final r = s % 60;
//     final mm = m.toString().padLeft(2, '0');
//     final ss = r.toString().padLeft(2, '0');
//     return '$mm:$ss';
//   }
// }

// import 'dart:async';
// import 'dart:ui';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/Model/course-model.dart';
// import 'package:project_2/Model/exam.dart';
// import 'package:project_2/View/Login_Student.dart';

// class DashboardController extends GetxController {
//   final dio.Dio _dio = dio.Dio();

//   // ===== الحالة العامة =====
//   var isLoading = false.obs;
//   var categories = <Category>[].obs;
//   var coursesBySearch = <Course>[].obs;
//   var coursesByCategory = <Course>[].obs;
//   var noResults = false.obs;

//   // ===== حالة الامتحان =====
//   var examLoading = false.obs;
//   var examError = ''.obs;
//   var currentExam = Rxn<Exam>();
//   var currentAttempt = Rxn<ExamAttempt>();
//   var examStarted = false.obs;

//   var remainingSeconds = 0.obs;
//   Timer? _timer;

//   /// اختيارات الطالب: questionId -> choiceId
//   var selectedChoiceByQid = <int, int>{}.obs;

//   // آخر وقت بدء معروف (من السيرفر أو من الاستعادة)
//   final lastStartedAt = Rxn<DateTime>();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//   }

//   // =========================
//   //  Categories & Courses (كما هي)
//   // =========================
//   Future<void> fetchCategories() async {
//     isLoading.value = true;
//     coursesBySearch.clear();
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
//       final data = response.data['data'] as List<dynamic>;
//       categories.value = data.map((e) => Category.fromJson(e)).toList();
//       noResults.value = categories.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> fetchCoursesByCategoryId(int categoryId) async {
//     isLoading.value = true;
//     coursesByCategory.clear();
//     noResults.value = false;
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/courses/byCategory/$categoryId');
//       if (response.data['status'] == 'success' && response.data['data'] is List) {
//         coursesByCategory.value =
//             (response.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//       } else {
//         coursesByCategory.clear();
//         noResults.value = true;
//       }
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'تعذر جلب الكورسات: $e'));
//       coursesByCategory.clear();
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> searchCourses(String value) async {
//     value = value.trim();
//     if (value.isEmpty) {
//       coursesBySearch.clear();
//       noResults.value = false;
//       fetchCategories();
//       return;
//     }
//     isLoading.value = true;
//     coursesBySearch.clear();
//     noResults.value = false;

//     try {
//       dio.Response resTeacher = await _dio.post(
//         'http://192.168.1.5:8000:8000/api/courses/byTeacher',
//         data: {'teacher_name': value},
//         options: dio.Options(headers: {'Accept': 'application/json'}),
//       );
//       List<Course> results = [];
//       if (resTeacher.data['status'] == 'success' && resTeacher.data['data'] is List) {
//         results = (resTeacher.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//       }

//       if (results.isEmpty) {
//         dio.Response resCourse = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byName',
//           data: {'course_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCourse.data['status'] == 'success' && resCourse.data['data'] is List) {
//           results = (resCourse.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       if (results.isEmpty) {
//         dio.Response resCategory = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byCategory',
//           data: {'category_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCategory.data['status'] == 'success' && resCategory.data['data'] is List) {
//           results = (resCategory.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       coursesBySearch.value = results;
//       noResults.value = results.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void clearCourseSearch() {
//     coursesBySearch.clear();
//     noResults.value = false;
//     fetchCategories();
//   }

//   Future<void> logout() async {
//     isLoading.value = true;
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       await prefs.remove('token');
//       await prefs.remove('token_type');
//       await prefs.remove('refresh_token');
//       Get.offAll(() => Login());
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e'));
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // =========================
//   //          Auth helpers
//   // =========================
//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty) 'Authorization': 'Bearer $token',
//     };
//   }

//   Future<bool> _ensureAuthOrGoLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     if (token == null || token.isEmpty) {
//       _goLogin('الرجاء تسجيل الدخول للمتابعة.');
//       return false;
//     }
//     return true;
//   }

//   void _goLogin(String message) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token');
//     await prefs.remove('token_type');
//     Get.offAll(() => Login());
//     Future.microtask(() => Get.snackbar('تنبيه', message, snackPosition: SnackPosition.BOTTOM));
//   }

//   // =========================
//   //          Exam
//   // =========================

//   int resolveCourseIdForExam({
//     required String? categoryName,
//     required String courseName,
//     required int fallbackCourseId,
//   }) {
//     if (fallbackCourseId > 0) return fallbackCourseId;
//     final title = courseName.trim();
//     if (title == 'Chemistry Nuclear') return 4;
//     if (title == 'Chemistry Normal') return 4;
//     final cat = (categoryName ?? '').trim();
//     if (cat == 'طبي') return 1;
//     if (cat == 'رياضيات') return 2;
//     if (cat == 'كيمياء') return 3;
//     return 0;
//   }

//   // مفاتيح التخزين للمحاولة
//   String _kStartedAt(int courseId) => 'exam_${courseId}_started_at';
//   String _kDuration(int courseId) => 'exam_${courseId}_duration';
//   String _kAttemptId(int courseId) => 'exam_${courseId}_attempt_id';

//   Future<void> _persistAttempt({
//     required int courseId,
//     required DateTime startedAt,
//     required int durationMinutes,
//     int? attemptId,
//   }) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_kStartedAt(courseId), startedAt.toIso8601String());
//     await prefs.setInt(_kDuration(courseId), durationMinutes);
//     if (attemptId != null) await prefs.setInt(_kAttemptId(courseId), attemptId);
//   }

//   Future<void> _clearPersistedAttempt(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_kStartedAt(courseId));
//     await prefs.remove(_kDuration(courseId));
//     await prefs.remove(_kAttemptId(courseId));
//   }

//   Future<void> restoreExamTimerIfAny(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     final s = prefs.getString(_kStartedAt(courseId));
//     final dur = prefs.getInt(_kDuration(courseId));
//     if (s == null || dur == null) return;

//     try {
//       final started = DateTime.parse(s);
//       final total = dur * 60;
//       final elapsed = DateTime.now().difference(started).inSeconds;
//       final remain = total - elapsed;
//       if (remain > 0) {
//         lastStartedAt.value = started;
//         remainingSeconds.value = remain;
//         examStarted.value = true;
//         _startTimer();
//       } else {
//         await _clearPersistedAttempt(courseId);
//         examStarted.value = false;
//         remainingSeconds.value = 0;
//       }
//     } catch (_) {
//       // تجاهل أي parsing خطأ
//     }
//   }

//   Future<void> fetchExamByCourseId(int courseId) async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     examLoading.value = true;
//     examError.value = '';
//     currentExam.value = null;
//     currentAttempt.value = null;
//     selectedChoiceByQid.clear();
//     // لا نضبط examStarted هنا، لأنه قد يكون مستأنف من التخزين
//     _stopTimer();

//     try {
//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000:8000/api/courses/$courseId/exam/student';

//       final res = await _dio.get(
//         url,
//         options: dio.Options(headers: headers, validateStatus: (_) => true),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح بالوصول إلى الامتحان.';
//         examError.value = '403 — $msg';
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         final exam = Exam.fromApiRoot(res.data as Map<String, dynamic>);
//         if (exam == null) {
//           examError.value = 'لم يتم العثور على بيانات الامتحان.';
//         } else {
//           currentExam.value = exam;
//           remainingSeconds.value = exam.durationMinutes * 60; // تحضير
//           // حاول استعادة محاولة سابقة (إن وُجدت)
//           await restoreExamTimerIfAny(courseId);
//         }
//       } else {
//         examError.value = 'فشل جلب الامتحان (HTTP $status): ${res.data}';
//       }
//     } catch (e) {
//       examError.value = 'فشل جلب الامتحان: $e';
//     } finally {
//       examLoading.value = false;
//     }
//   }

//   Future<void> startExam(int courseId) async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     // يجب أن تكون الأسئلة محمّلة
//     if (currentExam.value == null) {
//       await fetchExamByCourseId(courseId);
//       if (currentExam.value == null) return;
//     }

//     try {
//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000:8000/api/exams/$courseId/start';

//       final res = await _dio.post(
//         url,
//         options: dio.Options(headers: headers, validateStatus: (_) => true),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح ببدء الامتحان.';
//         Get.snackbar('403', msg, snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         final attempt = ExamAttempt.fromApiRoot(res.data as Map<String, dynamic>);
//         currentAttempt.value = attempt;
//         lastStartedAt.value = attempt?.startedAt;

//         // ابدأ المؤقّت اعتمادًا على started_at من السيرفر
//         final startedAt = attempt?.startedAt ?? DateTime.now();
//         final duration = currentExam.value!.durationMinutes;
//         await _persistAttempt(
//           courseId: courseId,
//           startedAt: startedAt,
//           durationMinutes: duration,
//           attemptId: attempt?.id,
//         );

//         final total = duration * 60;
//         final elapsed = DateTime.now().difference(startedAt).inSeconds;
//         remainingSeconds.value = (total - elapsed).clamp(0, total);
//         examStarted.value = remainingSeconds.value > 0;
//         _startTimer();

//         final ts = attempt?.startedAt?.toIso8601String() ?? '';
//         Get.snackbar('تم بدء الامتحان', ts.isEmpty ? 'بدأ العدّ التنازلي' : 'started_at: $ts',
//             snackPosition: SnackPosition.BOTTOM);

//       } else {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'فشل بدء الامتحان.';
//         Get.snackbar('خطأ', 'HTTP $status — $msg',
//             snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//       }
//     } catch (e) {
//       Get.snackbar('خطأ', 'استثناء أثناء بدء الامتحان: $e',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//     }
//   }

//   void selectChoice(int questionId, int choiceId) {
//     selectedChoiceByQid[questionId] = choiceId;
//     selectedChoiceByQid.refresh();
//   }

//   Future<void> submitExamAnswers() async {
//     if (!examStarted.value) {
//       Get.snackbar('تنبيه', 'ابدأ الامتحان أولًا.',
//           snackPosition: SnackPosition.BOTTOM);
//       return;
//     }
//     final answered = selectedChoiceByQid.length;
//     Get.snackbar('تم', 'حفظت $answered إجابة محليًا. (اربط POST لاحقًا)',
//         snackPosition: SnackPosition.BOTTOM);
//   }

//   void _startTimer() {
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
//       if (remainingSeconds.value <= 0) {
//         _timer?.cancel();
//         examStarted.value = false;
//         // امسح المحاولة المحفوظة لأنها انتهت
//         if (currentExam.value != null) {
//           await _clearPersistedAttempt(currentExam.value!.courseId);
//         }
//       } else {
//         remainingSeconds.value = remainingSeconds.value - 1;
//       }
//     });
//   }

//   void _stopTimer() {
//     _timer?.cancel();
//     _timer = null;
//   }

//   String formatRemaining() {
//     final s = remainingSeconds.value;
//     final m = s ~/ 60;
//     final r = s % 60;
//     final mm = m.toString().padLeft(2, '0');
//     final ss = r.toString().padLeft(2, '0');
//     return '$mm:$ss';
//   }
// }

// import 'dart:async';
// import 'dart:convert'; // NEW: لازم للتخزين كـ JSON
// import 'dart:ui';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/Model/course-model.dart';
// import 'package:project_2/Model/exam.dart';
// import 'package:project_2/View/Login_Student.dart';

// class DashboardController extends GetxController {
//   final dio.Dio _dio = dio.Dio();

//   // ===== الحالة العامة =====
//   var isLoading = false.obs;
//   var categories = <Category>[].obs;
//   var coursesBySearch = <Course>[].obs;
//   var coursesByCategory = <Course>[].obs;
//   var noResults = false.obs;

//   // ===== حالة الامتحان =====
//   var examLoading = false.obs;
//   var examError = ''.obs;
//   var currentExam = Rxn<Exam>();
//   var currentAttempt = Rxn<ExamAttempt>();
//   var examStarted = false.obs;

//   var remainingSeconds = 0.obs;
//   Timer? _timer;

//   /// اختيارات الطالب: questionId -> choiceId
//   var selectedChoiceByQid = <int, int>{}.obs;

//   // آخر وقت بدء معروف (من السيرفر أو من الاستعادة)
//   final lastStartedAt = Rxn<DateTime>();

//   // NEW: نعرف الكورس الحالي للامتحان حتى نخزّن إجابات هذا الكورس
//   final activeCourseId = RxnInt(); // PERSIST

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//   }

//   // =========================
//   //  Categories & Courses (كما هي)
//   // =========================
//   Future<void> fetchCategories() async {
//     isLoading.value = true;
//     coursesBySearch.clear();
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
//       final data = response.data['data'] as List<dynamic>;
//       categories.value = data.map((e) => Category.fromJson(e)).toList();
//       noResults.value = categories.isEmpty;
//     } catch (e) {
//       Future.microtask(
//           () => Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> fetchCoursesByCategoryId(int categoryId) async {
//     isLoading.value = true;
//     coursesByCategory.clear();
//     noResults.value = false;
//     try {
//       final response = await _dio
//           .get('http://192.168.1.5:8000:8000/api/courses/byCategory/$categoryId');
//       if (response.data['status'] == 'success' &&
//           response.data['data'] is List) {
//         coursesByCategory.value = (response.data['data'] as List)
//             .map((e) => Course.fromJson(e))
//             .toList();
//       } else {
//         coursesByCategory.clear();
//         noResults.value = true;
//       }
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'تعذر جلب الكورسات: $e'));
//       coursesByCategory.clear();
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> searchCourses(String value) async {
//     value = value.trim();
//     if (value.isEmpty) {
//       coursesBySearch.clear();
//       noResults.value = false;
//       fetchCategories();
//       return;
//     }
//     isLoading.value = true;
//     coursesBySearch.clear();
//     noResults.value = false;

//     try {
//       dio.Response resTeacher = await _dio.post(
//         'http://192.168.1.5:8000:8000/api/courses/byTeacher',
//         data: {'teacher_name': value},
//         options: dio.Options(headers: {'Accept': 'application/json'}),
//       );
//       List<Course> results = [];
//       if (resTeacher.data['status'] == 'success' &&
//           resTeacher.data['data'] is List) {
//         results = (resTeacher.data['data'] as List)
//             .map((e) => Course.fromJson(e))
//             .toList();
//       }

//       if (results.isEmpty) {
//         dio.Response resCourse = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byName',
//           data: {'course_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCourse.data['status'] == 'success' &&
//             resCourse.data['data'] is List) {
//           results = (resCourse.data['data'] as List)
//               .map((e) => Course.fromJson(e))
//               .toList();
//         }
//       }

//       if (results.isEmpty) {
//         dio.Response resCategory = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byCategory',
//           data: {'category_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCategory.data['status'] == 'success' &&
//             resCategory.data['data'] is List) {
//           results = (resCategory.data['data'] as List)
//               .map((e) => Course.fromJson(e))
//               .toList();
//         }
//       }

//       coursesBySearch.value = results;
//       noResults.value = results.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void clearCourseSearch() {
//     coursesBySearch.clear();
//     noResults.value = false;
//     fetchCategories();
//   }

//   Future<void> logout() async {
//     isLoading.value = true;
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       await prefs.remove('token');
//       await prefs.remove('token_type');
//       await prefs.remove('refresh_token');
//       Get.offAll(() => Login());
//     } catch (e) {
//       Future.microtask(
//           () => Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e'));
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // =========================
//   //          Auth helpers
//   // =========================
//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty) 'Authorization': 'Bearer $token',
//     };
//   }

//   Future<bool> _ensureAuthOrGoLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     if (token == null || token.isEmpty) {
//       _goLogin('الرجاء تسجيل الدخول للمتابعة.');
//       return false;
//     }
//     return true;
//   }

//   void _goLogin(String message) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token');
//     await prefs.remove('token_type');
//     Get.offAll(() => Login());
//     Future.microtask(() =>
//         Get.snackbar('تنبيه', message, snackPosition: SnackPosition.BOTTOM));
//   }

//   // =========================
//   //          Exam
//   // =========================

//   int resolveCourseIdForExam({
//     required String? categoryName,
//     required String courseName,
//     required int fallbackCourseId,
//   }) {
//     if (fallbackCourseId > 0) return fallbackCourseId;
//     final title = courseName.trim();
//     if (title == 'Chemistry Nuclear') return 4;
//     if (title == 'Chemistry Normal') return 4;
//     final cat = (categoryName ?? '').trim();
//     if (cat == 'طبي') return 1;
//     if (cat == 'رياضيات') return 2;
//     if (cat == 'كيمياء') return 3;
//     return 0;
//   }

//   // مفاتيح التخزين للمحاولة
//   String _kStartedAt(int courseId) => 'exam_${courseId}_started_at';
//   String _kDuration(int courseId) => 'exam_${courseId}_duration';
//   String _kAttemptId(int courseId) => 'exam_${courseId}_attempt_id';
//   // NEW: مفتاح تخزين الإجابات
//   String _kAnswers(int courseId) => 'exam_${courseId}_answers'; // PERSIST

//   Future<void> _persistAttempt({
//     required int courseId,
//     required DateTime startedAt,
//     required int durationMinutes,
//     int? attemptId,
//   }) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_kStartedAt(courseId), startedAt.toIso8601String());
//     await prefs.setInt(_kDuration(courseId), durationMinutes);
//     if (attemptId != null) await prefs.setInt(_kAttemptId(courseId), attemptId);
//   }

//   Future<void> _clearPersistedAttempt(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_kStartedAt(courseId));
//     await prefs.remove(_kDuration(courseId));
//     await prefs.remove(_kAttemptId(courseId));
//     // ملاحظة: لا نحذف الإجابات تلقائيًا لتبقى للعرض بعد انتهاء الوقت
//   }

//   Future<void> restoreExamTimerIfAny(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     final s = prefs.getString(_kStartedAt(courseId));
//     final dur = prefs.getInt(_kDuration(courseId));
//     if (s == null || dur == null) return;

//     try {
//       final started = DateTime.parse(s);
//       final total = dur * 60;
//       final elapsed = DateTime.now().difference(started).inSeconds;
//       final remain = total - elapsed;
//       if (remain > 0) {
//         lastStartedAt.value = started;
//         remainingSeconds.value = remain;
//         examStarted.value = true;
//         _startTimer();
//       } else {
//         await _clearPersistedAttempt(courseId);
//         examStarted.value = false;
//         remainingSeconds.value = 0;
//       }
//     } catch (_) {
//       // تجاهل
//     }
//   }

//   // ====== تخزين/استعادة الإجابات (الميزة الخارقة) ======

//   /// استعادة الإجابات المحفوظة لهذا الكورس
//   Future<void> _restoreAnswers(int courseId) async {
//     // PERSIST
//     final prefs = await SharedPreferences.getInstance();
//     final raw = prefs.getString(_kAnswers(courseId));
//     if (raw == null || raw.isEmpty) return;
//     try {
//       final decoded = jsonDecode(raw);
//       if (decoded is Map) {
//         final restored = <int, int>{};
//         decoded.forEach((k, v) {
//           final q = int.tryParse(k.toString());
//           final c = (v is int) ? v : int.tryParse(v.toString());
//           if (q != null && c != null) restored[q] = c;
//         });
//         selectedChoiceByQid.assignAll(restored);
//       }
//     } catch (_) {
//       // تجاهل
//     }
//   }

//   /// حفظ الإجابات الحالية لهذا الكورس
//   Future<void> _persistAnswers() async {
//     // PERSIST
//     final id = activeCourseId.value;
//     if (id == null) return;
//     final prefs = await SharedPreferences.getInstance();
//     final toStore = <String, int>{};
//     selectedChoiceByQid.forEach((q, c) => toStore[q.toString()] = c);
//     await prefs.setString(_kAnswers(id), jsonEncode(toStore));
//   }

//   /// حذف الإجابات المحفوظة لهذا الكورس (اختياري عند الإرسال/الانتهاء)
//   Future<void> clearSavedAnswers(int courseId) async {
//     // PERSIST
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_kAnswers(courseId));
//   }

//   Future<void> fetchExamByCourseId(int courseId) async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     examLoading.value = true;
//     examError.value = '';
//     currentExam.value = null;
//     currentAttempt.value = null;
//     selectedChoiceByQid.clear();
//     _stopTimer();

//     try {
//       activeCourseId.value = courseId; // NEW: عيّن الكورس النشط للإجابات

//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000:8000/api/courses/$courseId/exam/student';

//       final res = await _dio.get(
//         url,
//         options: dio.Options(headers: headers, validateStatus: (_) => true),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح بالوصول إلى الامتحان.';
//         examError.value = '403 — $msg';
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         final exam = Exam.fromApiRoot(res.data as Map<String, dynamic>);
//         if (exam == null) {
//           examError.value = 'لم يتم العثور على بيانات الامتحان.';
//         } else {
//           currentExam.value = exam;
//           remainingSeconds.value = exam.durationMinutes * 60; // تحضير فقط

//           // NEW: استرجع الإجابات المحفوظة لهذا الكورس
//           await _restoreAnswers(courseId); // PERSIST

//           // ثم حاول استعادة المؤقّت إن كان هناك attempt محفوظ
//           await restoreExamTimerIfAny(courseId);
//         }
//       } else {
//         examError.value = 'فشل جلب الامتحان (HTTP $status): ${res.data}';
//       }
//     } catch (e) {
//       examError.value = 'فشل جلب الامتحان: $e';
//     } finally {
//       examLoading.value = false;
//     }
//   }

//   Future<void> startExam(int courseId) async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     // يجب أن تكون الأسئلة محمّلة
//     if (currentExam.value == null) {
//       await fetchExamByCourseId(courseId);
//       if (currentExam.value == null) return;
//     }

//     try {
//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000:8000/api/exams/$courseId/start';

//       final res = await _dio.post(
//         url,
//         options: dio.Options(headers: headers, validateStatus: (_) => true),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح ببدء الامتحان.';
//         Get.snackbar('403', msg,
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: const Color(0xFFFFE6E6));
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         final attempt =
//             ExamAttempt.fromApiRoot(res.data as Map<String, dynamic>);
//         currentAttempt.value = attempt;
//         lastStartedAt.value = attempt?.startedAt;

//         // ابدأ المؤقّت اعتمادًا على started_at من السيرفر
//         final startedAt = attempt?.startedAt ?? DateTime.now();
//         final duration = currentExam.value!.durationMinutes;
//         await _persistAttempt(
//           courseId: courseId,
//           startedAt: startedAt,
//           durationMinutes: duration,
//           attemptId: attempt?.id,
//         );

//         final total = duration * 60;
//         final elapsed = DateTime.now().difference(startedAt).inSeconds;
//         remainingSeconds.value = (total - elapsed).clamp(0, total);
//         examStarted.value = remainingSeconds.value > 0;
//         _startTimer();

//         final ts = attempt?.startedAt?.toIso8601String() ?? '';
//         Get.snackbar('تم بدء الامتحان',
//             ts.isEmpty ? 'بدأ العدّ التنازلي' : 'started_at: $ts',
//             snackPosition: SnackPosition.BOTTOM);
//       } else {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'فشل بدء الامتحان.';
//         Get.snackbar('خطأ', 'HTTP $status — $msg',
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: const Color(0xFFFFE6E6));
//       }
//     } catch (e) {
//       Get.snackbar('خطأ', 'استثناء أثناء بدء الامتحان: $e',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: const Color(0xFFFFE6E6));
//     }
//   }

//   void selectChoice(int questionId, int choiceId) {
//     // PERSIST
//     selectedChoiceByQid[questionId] = choiceId;
//     selectedChoiceByQid.refresh();
//     // حفظ فوري لأي تغيير
//     _persistAnswers(); // لا تنتظر
//   }

//   Future<void> submitExamAnswers() async {
//     if (!examStarted.value) {
//       Get.snackbar('تنبيه', 'ابدأ الامتحان أولًا.',
//           snackPosition: SnackPosition.BOTTOM);
//       return;
//     }
//     final answered = selectedChoiceByQid.length;
//     Get.snackbar('تم', 'حفظت $answered إجابة محليًا. (اربط POST لاحقًا)',
//         snackPosition: SnackPosition.BOTTOM);
//     // ملاحظة: إذا بدك تمسح الإجابات بعد الإرسال:
//     // if (activeCourseId.value != null) clearSavedAnswers(activeCourseId.value!);
//   }

//   void _startTimer() {
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
//       if (remainingSeconds.value <= 0) {
//         remainingSeconds.value = 0;
//         _timer?.cancel();
//         examStarted.value = false;
//         // لا نمسح الإجابات تلقائيًا — تبقى للعرض بعد انتهاء الوقت
//         if (currentExam.value != null) {
//           await _clearPersistedAttempt(currentExam.value!.courseId);
//         }
//       } else {
//         remainingSeconds.value = remainingSeconds.value - 1;
//       }
//     });
//   }

//   void _stopTimer() {
//     _timer?.cancel();
//     _timer = null;
//   }

//   String formatRemaining() {
//     final s = remainingSeconds.value;
//     final m = s ~/ 60;
//     final r = s % 60;
//     final mm = m.toString().padLeft(2, '0');
//     final ss = r.toString().padLeft(2, '0');
//     return '$mm:$ss';
//   }
// }

// import 'dart:async';
// import 'dart:convert';
// import 'dart:ui';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/Model/course-model.dart';
// import 'package:project_2/Model/exam.dart';
// import 'package:project_2/View/Login_Student.dart';

// class DashboardController extends GetxController {
//   final dio.Dio _dio = dio.Dio();

//   // ===== الحالة العامة =====
//   var isLoading = false.obs;
//   var categories = <Category>[].obs;
//   var coursesBySearch = <Course>[].obs;
//   var coursesByCategory = <Course>[].obs;
//   var noResults = false.obs;

//   // ===== حالة الامتحان =====
//   var examLoading = false.obs;
//   var examError = ''.obs;
//   var currentExam = Rxn<Exam>();
//   var currentAttempt = Rxn<ExamAttempt>();
//   var examStarted = false.obs;
//   var examCompleted = false.obs;              // NEW: بعد التصحيح

//   var submitLoading = false.obs;              // NEW: لزر الإرسال
//   var submitResult = Rxn<ExamSubmitResult>(); // NEW: تفاصيل التصحيح

//   var remainingSeconds = 0.obs;
//   Timer? _timer;

//   /// اختيارات الطالب: questionId -> choiceId
//   var selectedChoiceByQid = <int, int>{}.obs;

//   final lastStartedAt = Rxn<DateTime>();
//   final activeCourseId = RxnInt();

//   // مفاتيح التخزين للمحاولة والإجابات
//   String _kStartedAt(int courseId) => 'exam_${courseId}_started_at';
//   String _kDuration(int courseId) => 'exam_${courseId}_duration';
//   String _kAttemptId(int courseId) => 'exam_${courseId}_attempt_id';
//   String _kAnswers(int courseId) => 'exam_${courseId}_answers';

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//   }

//   // =========================
//   //  Categories & Courses (كما هي)
//   // =========================
//   Future<void> fetchCategories() async {
//     isLoading.value = true;
//     coursesBySearch.clear();
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
//       final data = response.data['data'] as List<dynamic>;
//       categories.value = data.map((e) => Category.fromJson(e)).toList();
//       noResults.value = categories.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> fetchCoursesByCategoryId(int categoryId) async {
//     isLoading.value = true;
//     coursesByCategory.clear();
//     noResults.value = false;
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/courses/byCategory/$categoryId');
//       if (response.data['status'] == 'success' && response.data['data'] is List) {
//         coursesByCategory.value =
//             (response.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//       } else {
//         coursesByCategory.clear();
//         noResults.value = true;
//       }
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'تعذر جلب الكورسات: $e'));
//       coursesByCategory.clear();
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> searchCourses(String value) async {
//     value = value.trim();
//     if (value.isEmpty) {
//       coursesBySearch.clear();
//       noResults.value = false;
//       fetchCategories();
//       return;
//     }
//     isLoading.value = true;
//     coursesBySearch.clear();
//     noResults.value = false;

//     try {
//       final resTeacher = await _dio.post(
//         'http://192.168.1.5:8000:8000/api/courses/byTeacher',
//         data: {'teacher_name': value},
//         options: dio.Options(headers: {'Accept': 'application/json'}),
//       );
//       List<Course> results = [];
//       if (resTeacher.data['status'] == 'success' && resTeacher.data['data'] is List) {
//         results = (resTeacher.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//       }

//       if (results.isEmpty) {
//         final resCourse = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byName',
//           data: {'course_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCourse.data['status'] == 'success' && resCourse.data['data'] is List) {
//           results = (resCourse.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       if (results.isEmpty) {
//         final resCategory = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byCategory',
//           data: {'category_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCategory.data['status'] == 'success' && resCategory.data['data'] is List) {
//           results = (resCategory.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       coursesBySearch.value = results;
//       noResults.value = results.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void clearCourseSearch() {
//     coursesBySearch.clear();
//     noResults.value = false;
//     fetchCategories();
//   }

//   Future<void> logout() async {
//     isLoading.value = true;
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       await prefs.remove('token');
//       await prefs.remove('token_type');
//       await prefs.remove('refresh_token');
//       Get.offAll(() => Login());
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e'));
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // =========================
//   //          Auth
//   // =========================
//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty) 'Authorization': 'Bearer $token',
//     };
//   }

//   Future<bool> _ensureAuthOrGoLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     if (token == null || token.isEmpty) {
//       _goLogin('الرجاء تسجيل الدخول للمتابعة.');
//       return false;
//     }
//     return true;
//   }

//   void _goLogin(String message) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token');
//     await prefs.remove('token_type');
//     Get.offAll(() => Login());
//     Future.microtask(() => Get.snackbar('تنبيه', message, snackPosition: SnackPosition.BOTTOM));
//   }

//   // =========================
//   //          Exam
//   // =========================
//   int resolveCourseIdForExam({
//     required String? categoryName,
//     required String courseName,
//     required int fallbackCourseId,
//   }) {
//     if (fallbackCourseId > 0) return fallbackCourseId;
//     final title = courseName.trim();
//     if (title == 'Chemistry Nuclear') return 4;
//     if (title == 'Chemistry Normal') return 4;
//     final cat = (categoryName ?? '').trim();
//     if (cat == 'طبي') return 1;
//     if (cat == 'رياضيات') return 2;
//     if (cat == 'كيمياء') return 3;
//     return 0;
//   }

//   Future<void> _persistAttempt({
//     required int courseId,
//     required DateTime startedAt,
//     required int durationMinutes,
//     required int attemptId,
//     required int examId, // NEW: نخزن exam_id لأن submit يحتاجه
//   }) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_kStartedAt(courseId), startedAt.toIso8601String());
//     await prefs.setInt(_kDuration(courseId), durationMinutes);
//     await prefs.setInt(_kAttemptId(courseId), attemptId);
//     // نخزن exam_id إلى جانب attempt_id
//     await prefs.setInt('exam_${courseId}_exam_id', examId); // NEW
//   }

//   Future<void> _clearPersistedAttempt(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_kStartedAt(courseId));
//     await prefs.remove(_kDuration(courseId));
//     await prefs.remove(_kAttemptId(courseId));
//     await prefs.remove('exam_${courseId}_exam_id');
//   }

//   Future<int?> _loadPersistedExamId(int courseId) async { // NEW
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt('exam_${courseId}_exam_id');
//   }

//   Future<void> restoreExamTimerIfAny(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     final s = prefs.getString(_kStartedAt(courseId));
//     final dur = prefs.getInt(_kDuration(courseId));
//     if (s == null || dur == null) return;

//     try {
//       final started = DateTime.parse(s);
//       final total = dur * 60;
//       final elapsed = DateTime.now().difference(started).inSeconds;
//       final remain = total - elapsed;
//       if (remain > 0) {
//         lastStartedAt.value = started;
//         remainingSeconds.value = remain;
//         examStarted.value = true;
//         _startTimer();
//       } else {
//         await _clearPersistedAttempt(courseId);
//         examStarted.value = false;
//         remainingSeconds.value = 0;
//       }
//     } catch (_) {}
//   }

//   Future<void> _restoreAnswers(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     final raw = prefs.getString(_kAnswers(courseId));
//     if (raw == null || raw.isEmpty) return;
//     try {
//       final decoded = jsonDecode(raw);
//       if (decoded is Map) {
//         final restored = <int, int>{};
//         decoded.forEach((k, v) {
//           final q = int.tryParse(k.toString());
//           final c = (v is int) ? v : int.tryParse(v.toString());
//           if (q != null && c != null) restored[q] = c;
//         });
//         selectedChoiceByQid.assignAll(restored);
//       }
//     } catch (_) {}
//   }

//   Future<void> _persistAnswers() async {
//     final id = activeCourseId.value;
//     if (id == null) return;
//     final prefs = await SharedPreferences.getInstance();
//     final toStore = <String, int>{};
//     selectedChoiceByQid.forEach((q, c) => toStore[q.toString()] = c);
//     await prefs.setString(_kAnswers(id), jsonEncode(toStore));
//   }

//   Future<void> clearSavedAnswers(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_kAnswers(courseId));
//   }

//   Future<void> fetchExamByCourseId(int courseId) async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     examLoading.value = true;
//     examError.value = '';
//     submitResult.value = null;       // NEW
//     examCompleted.value = false;     // NEW
//     currentExam.value = null;
//     currentAttempt.value = null;
//     selectedChoiceByQid.clear();
//     _stopTimer();

//     try {
//       activeCourseId.value = courseId;

//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000:8000/api/courses/$courseId/exam/student';

//       final res = await _dio.get(
//         url,
//         options: dio.Options(headers: headers, validateStatus: (_) => true),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح بالوصول إلى الامتحان.';
//         examError.value = '403 — $msg';
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         final exam = Exam.fromApiRoot(res.data as Map<String, dynamic>);
//         if (exam == null) {
//           examError.value = 'لم يتم العثور على بيانات الامتحان.';
//         } else {
//           currentExam.value = exam;
//           remainingSeconds.value = exam.durationMinutes * 60;
//           await _restoreAnswers(courseId);
//           await restoreExamTimerIfAny(courseId);
//         }
//       } else {
//         examError.value = 'فشل جلب الامتحان (HTTP $status): ${res.data}';
//       }
//     } catch (e) {
//       examError.value = 'فشل جلب الامتحان: $e';
//     } finally {
//       examLoading.value = false;
//     }
//   }

//   Future<void> startExam(int courseId) async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     if (currentExam.value == null) {
//       await fetchExamByCourseId(courseId);
//       if (currentExam.value == null) return;
//     }

//     try {
//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000:8000/api/exams/$courseId/start';

//       final res = await _dio.post(
//         url,
//         options: dio.Options(headers: headers, validateStatus: (_) => true),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح ببدء الامتحان.';
//         Get.snackbar('403', msg, snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         final attempt = ExamAttempt.fromApiRoot(res.data as Map<String, dynamic>);
//         if (attempt == null) {
//           Get.snackbar('خطأ', 'ردّ البدء غير مفهوم', snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//           return;
//         }
//         currentAttempt.value = attempt;
//         lastStartedAt.value = attempt.startedAt;

//         final startedAt = attempt.startedAt ?? DateTime.now();
//         final duration = currentExam.value!.durationMinutes;

//         await _persistAttempt(
//           courseId: courseId,
//           startedAt: startedAt,
//           durationMinutes: duration,
//           attemptId: attempt.id,
//           examId: attempt.examId, // NEW: نخزن exam_id
//         );

//         final total = duration * 60;
//         final elapsed = DateTime.now().difference(startedAt).inSeconds;
//         remainingSeconds.value = (total - elapsed).clamp(0, total);
//         examStarted.value = remainingSeconds.value > 0;
//         _startTimer();

//         final ts = attempt.startedAt?.toIso8601String() ?? '';
//         Get.snackbar('تم بدء الامتحان', ts.isEmpty ? 'بدأ العدّ التنازلي' : 'started_at: $ts',
//             snackPosition: SnackPosition.BOTTOM);

//       } else {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'فشل بدء الامتحان.';
//         Get.snackbar('خطأ', 'HTTP $status — $msg',
//             snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//       }
//     } catch (e) {
//       Get.snackbar('خطأ', 'استثناء أثناء بدء الامتحان: $e',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//     }
//   }

//   void selectChoice(int questionId, int choiceId) {
//     selectedChoiceByQid[questionId] = choiceId;
//     selectedChoiceByQid.refresh();
//     _persistAnswers();
//   }

//   /// ===== إرسال الإجابات وتصحيحها — يستخدم exam_id =====
//   Future<void> submitExamAnswers() async {
//   // لازم المستخدم يكون مبلّش الامتحان
//   if (!await _ensureAuthOrGoLogin()) return;

//   final exam = currentExam.value;
//   if (exam == null) {
//     Get.snackbar('خطأ', 'لا توجد بيانات امتحان محمّلة.',
//         snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//     return;
//   }

//   final courseId = activeCourseId.value ?? exam.courseId;

//   // ✅ احصل على attempt_id الصحيح (من الذاكرة أو من التخزين)
//   final prefs = await SharedPreferences.getInstance();
//   final attemptId = currentAttempt.value?.id ?? prefs.getInt(_kAttemptId(courseId));
//   if (attemptId == null || attemptId <= 0) {
//     Get.snackbar('خطأ', 'لا توجد محاولة نشطة. ابدأ الامتحان أولًا.',
//         snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//     return;
//   }

//   // ابنِ الـ payload من اختيارات الطالب
//   final answers = <Map<String, dynamic>>[];
//   for (final q in exam.questions) {
//     final sel = selectedChoiceByQid[q.id];
//     if (sel != null) answers.add({'question_id': q.id, 'choice_id': sel});
//   }
//   if (answers.isEmpty) {
//     Get.snackbar('تنبيه', 'لم تختر أي إجابة.', snackPosition: SnackPosition.BOTTOM);
//     return;
//   }

//   submitLoading.value = true;
//   try {
//     final headers = await _authHeaders();

//     // ✅ استخدم attemptId هنا (مش examId)
//     final url = 'http://192.168.1.5:8000:8000/api/exam-attempts/$attemptId/submit';

//     final res = await _dio.post(
//       url,
//       data: {'answers': answers},
//       options: dio.Options(
//         headers: {...headers, 'Content-Type': 'application/json'},
//         validateStatus: (_) => true,
//       ),
//     );

//     final status = res.statusCode ?? 0;

//     if (status == 401) {
//       _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//       return;
//     }
//     if (status == 403) {
//       final msg = (res.data is Map && res.data['message'] != null)
//           ? res.data['message'].toString()
//           : 'غير مسموح بإرسال الإجابات.';
//       Get.snackbar('403', msg, snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: const Color(0xFFFFE6E6));
//       return;
//     }

//     if (status >= 200 && status < 300) {
//       // نجاح: خزّن النتيجة واعرضها
//       final result = ExamSubmitResult.fromRoot(res.data as Map<String, dynamic>);
//       submitResult.value = result;
//       examCompleted.value = true;
//       examStarted.value = false;
//       remainingSeconds.value = 0;
//       _timer?.cancel();

//       await _clearPersistedAttempt(courseId);
//       Get.snackbar('تم التصحيح', 'النتيجة: ${result.score}',
//           snackPosition: SnackPosition.BOTTOM);
//     } else {
//       final msg = (res.data is Map && res.data['message'] != null)
//           ? res.data['message'].toString()
//           : 'فشل إرسال الإجابات.';
//       Get.snackbar('خطأ', 'HTTP $status — $msg',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//     }
//   } catch (e) {
//     Get.snackbar('خطأ', 'استثناء أثناء إرسال الإجابات: $e',
//         snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//   } finally {
//     submitLoading.value = false;
//   }
// }

//   void _startTimer() {
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
//       if (remainingSeconds.value <= 0) {
//         remainingSeconds.value = 0;
//         _timer?.cancel();
//         examStarted.value = false;
//       } else {
//         remainingSeconds.value = remainingSeconds.value - 1;
//       }
//     });
//   }

//   void _stopTimer() {
//     _timer?.cancel();
//     _timer = null;
//   }

//   String formatRemaining() {
//     final s = remainingSeconds.value;
//     final m = s ~/ 60;
//     final r = s % 60;
//     final mm = m.toString().padLeft(2, '0');
//     final ss = r.toString().padLeft(2, '0');
//     return '$mm:$ss';
//   }
// }

// import 'dart:async';
// import 'dart:convert';
// import 'dart:ui';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/Model/course-model.dart';
// import 'package:project_2/Model/exam.dart';
// import 'package:project_2/View/Login_Student.dart';

// class DashboardController extends GetxController {
//   final dio.Dio _dio = dio.Dio();

//   // ===== الحالة العامة =====
//   var isLoading = false.obs;
//   var categories = <Category>[].obs;
//   var coursesBySearch = <Course>[].obs;
//   var coursesByCategory = <Course>[].obs;
//   var noResults = false.obs;

//   // ===== حالة الامتحان =====
//   var examLoading = false.obs;
//   var examError = ''.obs;
//   var currentExam = Rxn<Exam>();
//   var currentAttempt = Rxn<ExamAttempt>();

//   var examStarted = false.obs;
//   var examCompleted = false.obs;

//   var submitLoading = false.obs;
//   var submitResult = Rxn<ExamSubmitResult>();

//   var remainingSeconds = 0.obs;
//   Timer? _timer;

//   /// اختيارات الطالب: questionId -> choiceId
//   var selectedChoiceByQid = <int, int>{}.obs;

//   final lastStartedAt = Rxn<DateTime>();
//   final activeCourseId = RxnInt();

//   /// عرض مدمج بعد التصحيح/قبلُ (يحتوي اختيار الطالب + الصحيح إن وُجد)
//   var answerViewsByQid = <int, AnswerView>{}.obs;

//   // ===== مفاتيح التخزين =====
//   String _kStartedAt(int courseId) => 'exam_${courseId}_started_at';
//   String _kDuration(int courseId) => 'exam_${courseId}_duration';
//   String _kAttemptId(int courseId) => 'exam_${courseId}_attempt_id';
//   String _kAnswers(int courseId)   => 'exam_${courseId}_answers';
//   String _kExamId(int courseId)    => 'exam_${courseId}_exam_id';

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//   }

//   // =========================
//   //  Categories & Courses (كما هي)
//   // =========================
//   Future<void> fetchCategories() async {
//     isLoading.value = true;
//     coursesBySearch.clear();
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
//       final data = response.data['data'] as List<dynamic>;
//       categories.value = data.map((e) => Category.fromJson(e)).toList();
//       noResults.value = categories.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> fetchCoursesByCategoryId(int categoryId) async {
//     isLoading.value = true;
//     coursesByCategory.clear();
//     noResults.value = false;
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/courses/byCategory/$categoryId');
//       if (response.data['status'] == 'success' && response.data['data'] is List) {
//         coursesByCategory.value =
//             (response.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//       } else {
//         coursesByCategory.clear();
//         noResults.value = true;
//       }
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'تعذر جلب الكورسات: $e'));
//       coursesByCategory.clear();
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> searchCourses(String value) async {
//     value = value.trim();
//     if (value.isEmpty) {
//       coursesBySearch.clear();
//       noResults.value = false;
//       fetchCategories();
//       return;
//     }
//     isLoading.value = true;
//     coursesBySearch.clear();
//     noResults.value = false;

//     try {
//       final resTeacher = await _dio.post(
//         'http://192.168.1.5:8000:8000/api/courses/byTeacher',
//         data: {'teacher_name': value},
//         options: dio.Options(headers: {'Accept': 'application/json'}),
//       );
//       List<Course> results = [];
//       if (resTeacher.data['status'] == 'success' && resTeacher.data['data'] is List) {
//         results = (resTeacher.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//       }

//       if (results.isEmpty) {
//         final resCourse = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byName',
//           data: {'course_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCourse.data['status'] == 'success' && resCourse.data['data'] is List) {
//           results = (resCourse.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       if (results.isEmpty) {
//         final resCategory = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byCategory',
//           data: {'category_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCategory.data['status'] == 'success' && resCategory.data['data'] is List) {
//           results = (resCategory.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       coursesBySearch.value = results;
//       noResults.value = results.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void clearCourseSearch() {
//     coursesBySearch.clear();
//     noResults.value = false;
//     fetchCategories();
//   }

//   Future<void> logout() async {
//     isLoading.value = true;
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       await prefs.remove('token');
//       await prefs.remove('token_type');
//       await prefs.remove('refresh_token');
//       Get.offAll(() => Login());
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e'));
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // =========================
//   //          Auth
//   // =========================
//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty) 'Authorization': 'Bearer $token',
//     };
//   }

//   Future<bool> _ensureAuthOrGoLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     if (token == null || token.isEmpty) {
//       _goLogin('الرجاء تسجيل الدخول للمتابعة.');
//       return false;
//     }
//     return true;
//   }

//   void _goLogin(String message) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token');
//     await prefs.remove('token_type');
//     Get.offAll(() => Login());
//     Future.microtask(() => Get.snackbar('تنبيه', message, snackPosition: SnackPosition.BOTTOM));
//   }

//   // =========================
//   //          Exam
//   // =========================
//   int resolveCourseIdForExam({
//     required String? categoryName,
//     required String courseName,
//     required int fallbackCourseId,
//   }) {
//     if (fallbackCourseId > 0) return fallbackCourseId;
//     final title = courseName.trim();
//     if (title == 'Chemistry Nuclear') return 2;
//     if (title == 'Chemistry Normal') return 3;
//     // if (title == 'Bone') return 5;
//     // if (title == 'Algebra') return 1;
//      final cat = (categoryName ?? '').trim();
//     if (cat == 'طبي') return 1;
//     if (cat == 'رياضيات') return 2;
//     if (cat == 'كيمياء') return 3;
//     return 0;
//   }

//   Future<void> _persistAttempt({
//     required int courseId,
//     required DateTime startedAt,
//     required int durationMinutes,
//     required int attemptId,
//     required int examId,
//   }) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_kStartedAt(courseId), startedAt.toIso8601String());
//     await prefs.setInt(_kDuration(courseId), durationMinutes);
//     await prefs.setInt(_kAttemptId(courseId), attemptId);
//     await prefs.setInt(_kExamId(courseId), examId);
//   }

//   Future<void> _clearPersistedAttempt(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_kStartedAt(courseId));
//     await prefs.remove(_kDuration(courseId));
//     await prefs.remove(_kAttemptId(courseId));
//     await prefs.remove(_kExamId(courseId));
//   }

//   Future<int?> _loadPersistedAttemptId(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt(_kAttemptId(courseId));
//   }

//   Future<void> restoreExamTimerIfAny(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     final s = prefs.getString(_kStartedAt(courseId));
//     final dur = prefs.getInt(_kDuration(courseId));
//     if (s == null || dur == null) return;

//     try {
//       final started = DateTime.parse(s);
//       final total = dur * 60;
//       final elapsed = DateTime.now().difference(started).inSeconds;
//       final remain = total - elapsed;
//       if (remain > 0) {
//         lastStartedAt.value = started;
//         remainingSeconds.value = remain;
//         examStarted.value = true;
//         _startTimer();
//       } else {
//         await _clearPersistedAttempt(courseId);
//         examStarted.value = false;
//         remainingSeconds.value = 0;
//       }
//     } catch (_) {}
//   }

//   Future<void> _restoreAnswers(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     final raw = prefs.getString(_kAnswers(courseId));
//     if (raw == null || raw.isEmpty) return;
//     try {
//       final decoded = jsonDecode(raw);
//       if (decoded is Map) {
//         final restored = <int, int>{};
//         decoded.forEach((k, v) {
//           final q = int.tryParse(k.toString());
//           final c = (v is int) ? v : int.tryParse(v.toString());
//           if (q != null && c != null) restored[q] = c;
//         });
//         selectedChoiceByQid.assignAll(restored);
//       }
//     } catch (_) {}
//   }

//   Future<void> _persistAnswers() async {
//     final id = activeCourseId.value;
//     if (id == null) return;
//     final prefs = await SharedPreferences.getInstance();
//     final toStore = <String, int>{};
//     selectedChoiceByQid.forEach((q, c) => toStore[q.toString()] = c);
//     await prefs.setString(_kAnswers(id), jsonEncode(toStore));
//   }

//   Future<void> clearSavedAnswers(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_kAnswers(courseId));
//   }

//   Future<void> fetchExamByCourseId(int courseId) async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     examLoading.value = true;
//     examError.value = '';
//     submitResult.value = null;
//     examCompleted.value = false;
//     currentExam.value = null;
//     currentAttempt.value = null;
//     selectedChoiceByQid.clear();
//     answerViewsByQid.clear();
//     _stopTimer();

//     try {
//       activeCourseId.value = courseId;

//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000:8000/api/courses/$courseId/exam/student';

//       final res = await _dio.get(
//         url,
//         options: dio.Options(headers: headers, validateStatus: (_) => true),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح بالوصول إلى الامتحان.';
//         examError.value = '403 — $msg';
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         final exam = Exam.fromApiRoot(res.data as Map<String, dynamic>);
//         if (exam == null) {
//           examError.value = 'لم يتم العثور على بيانات الامتحان.';
//         } else {
//           currentExam.value = exam;
//           remainingSeconds.value = exam.durationMinutes * 60;

//           await _restoreAnswers(courseId);
//           _rebuildAnswerViews();           // عرض اختيارات الطالب قبل التصحيح
//           await restoreExamTimerIfAny(courseId);
//         }
//       } else {
//         examError.value = 'فشل جلب الامتحان (HTTP $status): ${res.data}';
//       }
//     } catch (e) {
//       examError.value = 'فشل جلب الامتحان: $e';
//     } finally {
//       examLoading.value = false;
//     }
//   }

//   Future<void> startExam(int courseId) async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     if (currentExam.value == null) {
//       await fetchExamByCourseId(courseId);
//       if (currentExam.value == null) return;
//     }

//     try {
//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000:8000/api/exams/$courseId/start';

//       final res = await _dio.post(
//         url,
//         options: dio.Options(headers: headers, validateStatus: (_) => true),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح ببدء الامتحان.';
//         Get.snackbar('403', msg, snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         final attempt = ExamAttempt.fromApiRoot(res.data as Map<String, dynamic>);
//         if (attempt == null) {
//           Get.snackbar('خطأ', 'ردّ البدء غير مفهوم', snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//           return;
//         }
//         currentAttempt.value = attempt;
//         lastStartedAt.value = attempt.startedAt;

//         final startedAt = attempt.startedAt ?? DateTime.now();
//         final duration = currentExam.value!.durationMinutes;

//         await _persistAttempt(
//           courseId: courseId,
//           startedAt: startedAt,
//           durationMinutes: duration,
//           attemptId: attempt.id,
//           examId: attempt.examId,
//         );

//         final total = duration * 60;
//         final elapsed = DateTime.now().difference(startedAt).inSeconds;
//         remainingSeconds.value = (total - elapsed).clamp(0, total);
//         examStarted.value = remainingSeconds.value > 0;
//         _startTimer();

//         final ts = attempt.startedAt?.toIso8601String() ?? '';
//         Get.snackbar('تم بدء الامتحان', ts.isEmpty ? 'بدأ العدّ التنازلي' : 'started_at: $ts',
//             snackPosition: SnackPosition.BOTTOM);

//       } else {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'فشل بدء الامتحان.';
//         Get.snackbar('خطأ', 'HTTP $status — $msg',
//             snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//       }
//     } catch (e) {
//       Get.snackbar('خطأ', 'استثناء أثناء بدء الامتحان: $e',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//     }
//   }

//   void selectChoice(int questionId, int choiceId) {
//     selectedChoiceByQid[questionId] = choiceId;
//     selectedChoiceByQid.refresh();
//     _persistAnswers();
//     _rebuildAnswerViews();
//   }

//   /// ===== إرسال الإجابات وتصحيحها — يستخدم attempt_id =====
//   Future<void> submitExamAnswers() async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     final exam = currentExam.value;
//     if (exam == null) {
//       Get.snackbar('خطأ', 'لا توجد بيانات امتحان محمّلة.',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//       return;
//     }

//     final courseId = activeCourseId.value ?? exam.courseId;
//     final attemptId = currentAttempt.value?.id ?? await _loadPersistedAttemptId(courseId);
//     if (attemptId == null || attemptId <= 0) {
//       Get.snackbar('خطأ', 'لا توجد محاولة نشطة. ابدأ الامتحان أولًا.',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//       return;
//     }

//     final answers = <Map<String, dynamic>>[];
//     for (final q in exam.questions) {
//       final sel = selectedChoiceByQid[q.id];
//       if (sel != null) answers.add({'question_id': q.id, 'choice_id': sel});
//     }
//     if (answers.isEmpty) {
//       Get.snackbar('تنبيه', 'لم تختر أي إجابة.', snackPosition: SnackPosition.BOTTOM);
//       return;
//     }

//     submitLoading.value = true;
//     try {
//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000:8000/api/exam-attempts/$attemptId/submit';

//       final res = await _dio.post(
//         url,
//         data: {'answers': answers},
//         options: dio.Options(
//           headers: {...headers, 'Content-Type': 'application/json'},
//           validateStatus: (_) => true,
//         ),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح بإرسال الإجابات.';
//         Get.snackbar('403', msg, snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         final result = ExamSubmitResult.fromRoot(res.data as Map<String, dynamic>);
//         submitResult.value = result;

//         examCompleted.value = true;
//         examStarted.value = false;
//         remainingSeconds.value = 0;
//         _timer?.cancel();

//         await _clearPersistedAttempt(courseId);
//         _rebuildAnswerViews(); // يبني لكل الأسئلة اختيار الطالب + الصحيح

//         Get.snackbar('تم التصحيح', 'النتيجة: ${result.score}',
//             snackPosition: SnackPosition.BOTTOM);

//       } else {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'فشل إرسال الإجابات.';
//         Get.snackbar('خطأ', 'HTTP $status — $msg',
//             snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//       }
//     } catch (e) {
//       Get.snackbar('خطأ', 'استثناء أثناء إرسال الإجابات: $e',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//     } finally {
//       submitLoading.value = false;
//     }
//   }

//   void _startTimer() {
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
//       if (remainingSeconds.value <= 0) {
//         remainingSeconds.value = 0;
//         _timer?.cancel();
//         examStarted.value = false;
//       } else {
//         remainingSeconds.value = remainingSeconds.value - 1;
//       }
//     });
//   }

//   void _stopTimer() {
//     _timer?.cancel();
//     _timer = null;
//   }

//   String formatRemaining() {
//     final s = remainingSeconds.value;
//     final m = s ~/ 60;
//     final r = s % 60;
//     final mm = m.toString().padLeft(2, '0');
//     final ss = r.toString().padLeft(2, '0');
//     return '$mm:$ss';
//   }

//   /// يبني عرضًا موحّدًا لكل الأسئلة (اختيار الطالب + الصحيح إن وُجد)
//   void _rebuildAnswerViews() {
//   answerViewsByQid.clear();
//   final exam = currentExam.value;
//   if (exam == null) return;

//   // تفاصيل التصحيح (إن وُجدت)
//   final details = submitResult.value?.details ?? [];

//   // ابحث عن التفاصيل بحسب id ثم بالنص كاحتياط
//   AnswerDetail? _findDetailFor(ExamQuestion q) {
//     for (final d in details) {
//       if (d.questionId == q.id) return d;
//     }
//     for (final d in details) {
//       if ((d.questionText.trim()) == (q.questionText.trim())) return d;
//     }
//     return null;
//   }

//   // جلب نص اختيار الطالب من خيارات السؤال
//   String? _studentTextFromChoice(ExamQuestion q, int? selectedId) {
//     if (selectedId == null) return null;
//     for (final c in q.choices) {
//       if (c.id == selectedId) return c.choiceText;
//     }
//     return null;
//   }

//   // تطبيع النص للمقارنة (إزالة المسافات المتعددة + trim)
//   String _norm(String s) => s.replaceAll(RegExp(r'\s+'), '').trim();

//   for (final q in exam.questions) {
//     final selectedId = selectedChoiceByQid[q.id];
//     final d = _findDetailFor(q);

//     // نص إجابة الطالب
//     final studentText = d?.studentChoice ?? _studentTextFromChoice(q, selectedId);
//     // نص الإجابة الصحيحة (قد تكون null إذا الباك ما رجّعها)
//     final correctText = d?.correctChoice;

//     // حسبة صح/خطأ:
//     bool? isCorrect = d?.isCorrect; // لو الباك سلّمه بنثق فيه
//     if (isCorrect == null) {
//       if (studentText != null && correctText != null) {
//         isCorrect = _norm(studentText) == _norm(correctText);
//       }
//     }

//     answerViewsByQid[q.id] = AnswerView(
//       questionId: q.id,
//       questionText: q.questionText,
//       studentChoiceText: studentText,
//       correctChoiceText: correctText,
//      // isCorrect: isCorrect,
//     );
//   }

//   answerViewsByQid.refresh();
// }

// }

// import 'dart:async';
// import 'dart:convert';
// import 'dart:ui';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/Model/course-model.dart';
// import 'package:project_2/Model/exam.dart';
// import 'package:project_2/View/Login_Student.dart';

// /// هذا الكنترولر مسؤول عن:
// /// - جلب الفئات والكورسات والبحث عنها
// /// - إدارة جلسة الامتحان (بدء/استعادة/مؤقّت/إرسال إجابات)
// /// - التخزين المحلي لبعض بيانات الامتحان لمتابعة الامتحان بعد الإغلاق
// class DashboardController extends GetxController {
//   // كائن Dio لإجراء طلبات HTTP
//   final dio.Dio _dio = dio.Dio();

//   // ===== الحالة العامة للدورات والفئات =====
//   var isLoading = false.obs;                  // حالة تحميل عامة للاستخدام في الواجهة
//   var categories = <Category>[].obs;          // قائمة الفئات
//   var   coursesBySearch = <Course>[].obs;       // نتائج البحث عن الدورات
//   var coursesByCategory = <Course>[].obs;     // دورات بحسب فئة محددة
//   var noResults = false.obs;                  // لا توجد نتائج

//   // ===== حالة الامتحان =====
//   var examLoading = false.obs;                // تحميل بيانات الامتحان
//   var examError = ''.obs;                     // رسالة خطأ الامتحان (إن وجدت)
//   var currentExam = Rxn<Exam>();              // الامتحان الحالي المحمّل
//   var currentAttempt = Rxn<ExamAttempt>();    // محاولة الامتحان الحالية (attempt)

//   var examStarted = false.obs;                // هل بدأ الامتحان؟
//   var examCompleted = false.obs;              // هل اكتمل/تم تصحيحه؟

//   var submitLoading = false.obs;              // تحميل أثناء إرسال الإجابات
//   var submitResult = Rxn<ExamSubmitResult>(); // نتيجة التصحيح (score + details)

//   var remainingSeconds = 0.obs;               // الوقت المتبقي بالثواني
//   Timer? _timer;                              // مؤقّت العدّ التنازلي

//   /// خريطة لاختيارات الطالب: questionId -> choiceId
//   var selectedChoiceByQid = <int, int>{}.obs;

//   final lastStartedAt = Rxn<DateTime>();      // آخر توقيت بدأ فيه الامتحان (من السيرفر)
//   final activeCourseId = RxnInt();            // الكورس النشط للامتحان الحالي

//   /// تمثيل عرض موحّد بعد/قبل التصحيح (يحوي اختيار الطالب + الصحيح إن وجد)
//   var answerViewsByQid = <int, AnswerView>{}.obs;

//   // ===== مفاتيح التخزين المحلي (SharedPreferences) =====
//   String _kStartedAt(int courseId) => 'exam_${courseId}_started_at';
//   String _kDuration(int courseId)  => 'exam_${courseId}_duration';
//   String _kAttemptId(int courseId) => 'exam_${courseId}_attempt_id';
//   String _kAnswers(int courseId)   => 'exam_${courseId}_answers';
//   String _kExamId(int courseId)    => 'exam_${courseId}_exam_id';

//   @override
//   void onInit() {
//     super.onInit();
//     // عند إنشاء الكنترولر: اجلب الفئات
//     fetchCategories();
//   }

//   // =========================
//   //  Categories & Courses
//   // =========================

//   /// جلب الفئات من الـ API
//   Future<void> fetchCategories() async {
//     isLoading.value = true;
//     coursesBySearch.clear(); // تنظيف أية نتائج بحث سابقة
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/categories');
//       final data = response.data['data'] as List<dynamic>;
//       categories.value = data.map((e) => Category.fromJson(e)).toList();
//       noResults.value = categories.isEmpty;
//     } catch (e) {
//       // إظهار رسالة خطأ بطريقة غير متزامنة لتفادي مشاكل إعادة البناء
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// جلب الدورات بحسب معرّف الفئة
//   Future<void> fetchCoursesByCategoryId(int categoryId) async {
//     isLoading.value = true;
//     coursesByCategory.clear();
//     noResults.value = false;
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000:8000/api/courses/byCategory/$categoryId');
//       if (response.data['status'] == 'success' && response.data['data'] is List) {
//         coursesByCategory.value =
//             (response.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//       } else {
//         coursesByCategory.clear();
//         noResults.value = true;
//       }
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'تعذر جلب الكورسات: $e'));
//       coursesByCategory.clear();
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// البحث عن دورات حسب: اسم المدرس -> إن لم يوجد: اسم الدورة -> إن لم يوجد: اسم الفئة
//   Future<void> searchCourses(String value) async {
//     value = value.trim();
//     if (value.isEmpty) {
//       // إن كان الحقل فارغًا: نظّف وابحث عن الفئات مجددًا
//       coursesBySearch.clear();
//       noResults.value = false;
//       fetchCategories();
//       return;
//     }
//     isLoading.value = true;
//     coursesBySearch.clear();
//     noResults.value = false;

//     try {
//       // البحث أولًا باسم المدرس
//       final resTeacher = await _dio.post(
//         'http://192.168.1.5:8000:8000/api/courses/byTeacher',
//         data: {'teacher_name': value},
//         options: dio.Options(headers: {'Accept': 'application/json'}),
//       );
//       List<Course> results = [];
//       if (resTeacher.data['status'] == 'success' && resTeacher.data['data'] is List) {
//         results = (resTeacher.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//       }

//       // إن لم نجد نتيجة: ابحث باسم الدورة
//       if (results.isEmpty) {
//         final resCourse = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byName',
//           data: {'course_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCourse.data['status'] == 'success' && resCourse.data['data'] is List) {
//           results = (resCourse.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       // إن لم نجد نتيجة: ابحث باسم الفئة
//       if (results.isEmpty) {
//         final resCategory = await _dio.post(
//           'http://192.168.1.5:8000:8000/api/courses/byCategory',
//           data: {'category_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCategory.data['status'] == 'success' && resCategory.data['data'] is List) {
//           results = (resCategory.data['data'] as List).map((e) => Course.fromJson(e)).toList();
//         }
//       }

//       // تخزين النتائج وتحديد noResults
//       coursesBySearch.value = results;
//       noResults.value = results.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// مسح نتائج البحث والعودة للفئات
//   void clearCourseSearch() {
//     coursesBySearch.clear();
//     noResults.value = false;
//     fetchCategories();
//   }

//   /// تسجيل الخروج + تنظيف التوكنات + الذهاب لشاشة تسجيل الدخول
//   Future<void> logout() async {
//     isLoading.value = true;
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       await prefs.remove('token');
//       await prefs.remove('token_type');
//       await prefs.remove('refresh_token');
//       Get.offAll(() => Login());
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e'));
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // =========================
//   //          Auth
//   // =========================

//   /// بناء ترويسات المصادقة (Bearer token) إن وُجد
//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty) 'Authorization': 'Bearer $token',
//     };
//   }

//   /// التحقق من وجود توكن صالح، وإلا الذهاب لتسجيل الدخول
//   Future<bool> _ensureAuthOrGoLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     if (token == null || token.isEmpty) {
//       _goLogin('الرجاء تسجيل الدخول للمتابعة.');
//       return false;
//     }
//     return true;
//   }

//   /// تنظيف بيانات الاعتماد والانتقال لصفحة الدخول + إظهار تنبيه
//   void _goLogin(String message) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token');
//     await prefs.remove('token_type');
//     Get.offAll(() => Login());
//     Future.microtask(() => Get.snackbar('تنبيه', message, snackPosition: SnackPosition.BOTTOM));
//   }

//   // =========================
//   //          Exam
//   // =========================

//   /// محاولة لتحديد courseId من معلومات الدورة/الفئة عند غيابه (fallback)
//   int resolveCourseIdForExam({
//     required String? categoryName,
//     required String courseName,
//     required int fallbackCourseId,
//   }) {
//     if (fallbackCourseId > 0) return fallbackCourseId;
//     final title = courseName.trim();
//     if (title == 'Chemistry Nuclear') return 2;
//     if (title == 'Chemistry Normal') return 3;
//     if (title == 'Bone') return 5;
//     if (title == 'Algebra') return 1;
//     // أمثلة مُعطّلة لربط الفئة بالمعرّف
//     // final cat = (categoryName ?? '').trim();
//     // if (cat == 'طبي') return 1;
//     // if (cat == 'رياضيات') return 2;
//     // if (cat == 'كيمياء') return 3;
//     return 0;
//   }

//   /// تخزين بيانات المحاولة (start/duration/attemptId/examId) في SharedPreferences
//   Future<void> _persistAttempt({
//     required int courseId,
//     required DateTime startedAt,
//     required int durationMinutes,
//     required int attemptId,
//     required int examId,
//   }) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_kStartedAt(courseId), startedAt.toIso8601String());
//     await prefs.setInt(_kDuration(courseId), durationMinutes);
//     await prefs.setInt(_kAttemptId(courseId), attemptId);
//     await prefs.setInt(_kExamId(courseId), examId);
//   }

//   /// إزالة بيانات المحاولة المخزّنة
//   Future<void> _clearPersistedAttempt(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_kStartedAt(courseId));
//     await prefs.remove(_kDuration(courseId));
//     await prefs.remove(_kAttemptId(courseId));
//     await prefs.remove(_kExamId(courseId));
//   }

//   /// تحميل attempt_id المخزّن (إن وُجد)
//   Future<int?> _loadPersistedAttemptId(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt(_kAttemptId(courseId));
//   }

//   /// استعادة المؤقّت إن كان الامتحان قد بدأ سابقًا ولم ينتهِ وقته
//   Future<void> restoreExamTimerIfAny(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     final s = prefs.getString(_kStartedAt(courseId));
//     final dur = prefs.getInt(_kDuration(courseId));
//     if (s == null || dur == null) return;

//     try {
//       final started = DateTime.parse(s);
//       final total = dur * 60; // مدة الامتحان بالثواني
//       final elapsed = DateTime.now().difference(started).inSeconds; // المنقضي
//       final remain = total - elapsed; // المتبقي

//       if (remain > 0) {
//         lastStartedAt.value = started;
//         remainingSeconds.value = remain;
//         examStarted.value = true;
//         _startTimer(); // إعادة تشغيل المؤقّت
//       } else {
//         // انتهى الوقت؛ نظّف التخزين
//         await _clearPersistedAttempt(courseId);
//         examStarted.value = false;
//         remainingSeconds.value = 0;
//       }
//     } catch (_) {
//       // تجاهل أي خطأ في التحويل/التواريخ
//     }
//   }

//   /// استعادة إجابات الطالب المخزّنة (questionId -> choiceId)
//   Future<void> _restoreAnswers(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     final raw = prefs.getString(_kAnswers(courseId));
//     if (raw == null || raw.isEmpty) return;
//     try {
//       final decoded = jsonDecode(raw);
//       if (decoded is Map) {
//         final restored = <int, int>{};
//         decoded.forEach((k, v) {
//           final q = int.tryParse(k.toString());
//           final c = (v is int) ? v : int.tryParse(v.toString());
//           if (q != null && c != null) restored[q] = c;
//         });
//         selectedChoiceByQid.assignAll(restored);
//       }
//     } catch (_) {
//       // تجاهل أخطاء التحويل
//     }
//   }

//   /// حفظ الإجابات الحالية في التخزين المحلي
//   Future<void> _persistAnswers() async {
//     final id = activeCourseId.value;
//     if (id == null) return;
//     final prefs = await SharedPreferences.getInstance();
//     final toStore = <String, int>{};
//     selectedChoiceByQid.forEach((q, c) => toStore[q.toString()] = c);
//     await prefs.setString(_kAnswers(id), jsonEncode(toStore));
//   }

//   /// حذف الإجابات المحفوظة محليًا
//   Future<void> clearSavedAnswers(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_kAnswers(courseId));
//   }

//   /// جلب بيانات الامتحان لدورة محددة
//   Future<void> fetchExamByCourseId(int courseId) async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     // إعادة ضبط حالة الامتحان
//     examLoading.value = true;
//     examError.value = '';
//     submitResult.value = null;
//     examCompleted.value = false;
//     currentExam.value = null;
//     currentAttempt.value = null;
//     selectedChoiceByQid.clear();
//     answerViewsByQid.clear();
//     _stopTimer();

//     try {
//       activeCourseId.value = courseId;

//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000:8000/api/courses/$courseId/exam/student';

//       final res = await _dio.get(
//         url,
//         options: dio.Options(headers: headers, validateStatus: (_) => true),
//       );

//       final status = res.statusCode ?? 0;

//       // غير مصرح/انتهت الجلسة
//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       // ممنوع الوصول
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح بالوصول إلى الامتحان.';
//         examError.value = '403 — $msg';
//         return;
//       }

//       // نجاح
//       if (status >= 200 && status < 300) {
//         final exam = Exam.fromApiRoot(res.data as Map<String, dynamic>);
//         if (exam == null) {
//           examError.value = 'لم يتم العثور على بيانات الامتحان.';
//         } else {
//           currentExam.value = exam;
//           remainingSeconds.value = exam.durationMinutes * 60; // تهيئة الوقت

//           await _restoreAnswers(courseId); // استعادة إجابات محفوظة
//           _rebuildAnswerViews();           // عرض اختيارات لطالب
//           await restoreExamTimerIfAny(courseId); // استعادة المؤقّت إن أمكن
//         }
//       } else {
//         // فشل
//         examError.value = 'فشل جلب الامتحان (HTTP $status): ${res.data}';
//       }
//     } catch (e) {
//       examError.value = 'فشل جلب الامتحان: $e';
//     } finally {
//       examLoading.value = false;
//     }
//   }

//   /// بدء الامتحان (ينشئ attempt في السيرفر ويبدأ العدّ التنازلي)
//   Future<void> startExam(int courseId) async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     // إن لم تكن بيانات الامتحان موجودة بعد، اجلبها أولًا
//     if (currentExam.value == null) {
//       await fetchExamByCourseId(courseId);
//       if (currentExam.value == null) return;
//     }

//     try {
//       final headers = await _authHeaders();

//       // ********** ملاحظة: هنا يُستخدم exam.id (وليس courseId) لمسار البدء **********
//       final int examId = currentExam.value!.id;
//       final url = 'http://192.168.1.5:8000:8000/api/exams/$examId/start';
//       // ***************************************************************************

//       final res = await _dio.post(
//         url,
//         options: dio.Options(headers: headers, validateStatus: (_) => true),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح ببدء الامتحان.';
//         Get.snackbar('403', msg, snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         // بناء attempt من الرد
//         final attempt = ExamAttempt.fromApiRoot(res.data as Map<String, dynamic>);
//         if (attempt == null) {
//           Get.snackbar('خطأ', 'ردّ البدء غير مفهوم', snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//           return;
//         }
//         currentAttempt.value = attempt;
//         lastStartedAt.value = attempt.startedAt;

//         // حساب المؤقّت اعتمادًا على startedAt ومدة الامتحان
//         final startedAt = attempt.startedAt ?? DateTime.now();
//         final duration = currentExam.value!.durationMinutes;

//         // حفظ بيانات المحاولة محليًا (لمتابعة الامتحان لاحقًا)
//         await _persistAttempt(
//           courseId: courseId,
//           startedAt: startedAt,
//           durationMinutes: duration,
//           attemptId: attempt.id,
//           examId: attempt.examId,
//         );

//         final total = duration * 60;
//         final elapsed = DateTime.now().difference(startedAt).inSeconds;
//         remainingSeconds.value = (total - elapsed).clamp(0, total);
//         examStarted.value = remainingSeconds.value > 0;
//         _startTimer(); // تشغّيل المؤقّت

//         final ts = attempt.startedAt?.toIso8601String() ?? '';
//         Get.snackbar('تم بدء الامتحان', ts.isEmpty ? 'بدأ العدّ التنازلي' : 'started_at: $ts',
//             snackPosition: SnackPosition.BOTTOM);

//       } else {
//         // فشل بدء الامتحان
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'فشل بدء الامتحان.';
//         Get.snackbar('خطأ', 'HTTP $status — $msg',
//             snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//       }
//     } catch (e) {
//       Get.snackbar('خطأ', 'استثناء أثناء بدء الامتحان: $e',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//     }
//   }

//   /// تخزين اختيار الطالب لسؤال ما ثم إعادة بناء العرض وحفظه محليًا
//   void selectChoice(int questionId, int choiceId) {
//     selectedChoiceByQid[questionId] = choiceId; // محدّث الخريطة
//     selectedChoiceByQid.refresh();              // إعلام الـ UI بالتغيير
//     _persistAnswers();                          // حفظ الإجابات محليًا
//     _rebuildAnswerViews();                      // تحديث العرض
//   }

//   /// إرسال الإجابات للتصحيح عبر attempt_id
//   Future<void> submitExamAnswers() async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     final exam = currentExam.value;
//     if (exam == null) {
//       Get.snackbar('خطأ', 'لا توجد بيانات امتحان محمّلة.',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//       return;
//     }

//     // المحاولة الحالية (من الذاكرة أو من التخزين المحلي)
//     final courseId = activeCourseId.value ?? exam.courseId;
//     final attemptId = currentAttempt.value?.id ?? await _loadPersistedAttemptId(courseId);
//     if (attemptId == null || attemptId <= 0) {
//       Get.snackbar('خطأ', 'لا توجد محاولة نشطة. ابدأ الامتحان أولًا.',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//       return;
//     }

//     // بناء مصفوفة الإجابات المطلوبة من الـ API
//     final answers = <Map<String, dynamic>>[];
//     for (final q in exam.questions) {
//       final sel = selectedChoiceByQid[q.id];
//       if (sel != null) answers.add({'question_id': q.id, 'choice_id': sel});
//     }
//     if (answers.isEmpty) {
//       Get.snackbar('تنبيه', 'لم تختر أي إجابة.', snackPosition: SnackPosition.BOTTOM);
//       return;
//     }

//     submitLoading.value = true;
//     try {
//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000:8000/api/exam-attempts/$attemptId/submit';

//       final res = await _dio.post(
//         url,
//         data: {'answers': answers},
//         options: dio.Options(
//           headers: {...headers, 'Content-Type': 'application/json'},
//           validateStatus: (_) => true,
//         ),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح بإرسال الإجابات.';
//         Get.snackbar('403', msg, snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         // نجاح التصحيح
//         final result = ExamSubmitResult.fromRoot(res.data as Map<String, dynamic>);
//         submitResult.value = result;

//         // إيقاف الامتحان والمؤقّت وتنظيف المحاولة المخزّنة
//         examCompleted.value = true;
//         examStarted.value = false;
//         remainingSeconds.value = 0;
//         _timer?.cancel();

//         await _clearPersistedAttempt(courseId);
//         _rebuildAnswerViews(); // الآن تتوفّر correctChoice/التفاصيل

//         Get.snackbar('تم التصحيح', 'النتيجة: ${result.score}',
//             snackPosition: SnackPosition.BOTTOM);

//       } else {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'فشل إرسال الإجابات.';
//         Get.snackbar('خطأ', 'HTTP $status — $msg',
//             snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//       }
//     } catch (e) {
//       Get.snackbar('خطأ', 'استثناء أثناء إرسال الإجابات: $e',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFFFFE6E6));
//     } finally {
//       submitLoading.value = false;
//     }
//   }

//   /// تشغيل مؤقّت العدّ التنازلي ثانية بثانية
//   void _startTimer() {
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
//       if (remainingSeconds.value <= 0) {
//         // انتهى الوقت
//         remainingSeconds.value = 0;
//         _timer?.cancel();
//         examStarted.value = false;
//       } else {
//         // ناقص ثانية
//         remainingSeconds.value = remainingSeconds.value - 1;
//       }
//     });
//   }

//   /// إيقاف المؤقّت (إن وُجد)
//   void _stopTimer() {
//     _timer?.cancel();
//     _timer = null;
//   }

//   /// تنسيق الوقت المتبقي على شكل mm:ss
//   String formatRemaining() {
//     final s = remainingSeconds.value;
//     final m = s ~/ 60;
//     final r = s % 60;
//     final mm = m.toString().padLeft(2, '0');
//     final ss = r.toString().padLeft(2, '0');
//     return '$mm:$ss';
//   }

//   /// إعادة بناء عرض الإجابات لكل سؤال:
//   /// - نص اختيار الطالب
//   /// - نص الإجابة الصحيحة (إن توفّرت من السيرفر بعد التصحيح)
//   void _rebuildAnswerViews() {
//     answerViewsByQid.clear();
//     final exam = currentExam.value;
//     if (exam == null) return;

//     // تفاصيل التصحيح (إن وُجدت) من submitResult
//     final details = submitResult.value?.details ?? [];

//     // البحث عن التفاصيل الخاصة بالسؤال إما بالـ id أو بالنص كخيار احتياطي
//     AnswerDetail? _findDetailFor(ExamQuestion q) {
//       for (final d in details) {
//         if (d.questionId == q.id) return d;
//       }
//       for (final d in details) {
//         if ((d.questionText.trim()) == (q.questionText.trim())) return d;
//       }
//       return null;
//     }

//     // استخراج نص اختيار الطالب من قائمة اختيارات السؤال عبر selectedId
//     String? _studentTextFromChoice(ExamQuestion q, int? selectedId) {
//       if (selectedId == null) return null;
//       for (final c in q.choices) {
//         if (c.id == selectedId) return c.choiceText;
//       }
//       return null;
//     }

//     // دالة لتطبيع النص للمقارنة (إزالة المسافات المتعددة + trim)
//     String _norm(String s) => s.replaceAll(RegExp(r'\s+'), '').trim();

//     // بناء AnswerView لكل سؤال
//     for (final q in exam.questions) {
//       final selectedId = selectedChoiceByQid[q.id];
//       final d = _findDetailFor(q);

//       // نص إجابة الطالب (من details أو من الاختيارات)
//       final studentText = d?.studentChoice ?? _studentTextFromChoice(q, selectedId);
//       // نص الإجابة الصحيحة من details (قد تكون null)
//       final correctText = d?.correctChoice;

//       // حسبة صح/خطأ (إن لم يوفّرها السيرفر) — *منطق موجود ولكن النتيجة لا تُخزّن حاليًا*
//       bool? isCorrect = d?.isCorrect;
//       if (isCorrect == null) {
//         if (studentText != null && correctText != null) {
//           isCorrect = _norm(studentText) == _norm(correctText);
//         }
//       }

//       // إنشاء العرض (لاحظ: isCorrect مُعلّقة في الكود الأصلي)
//       answerViewsByQid[q.id] = AnswerView(
//         questionId: q.id,
//         questionText: q.questionText,
//         studentChoiceText: studentText,
//         correctChoiceText: correctText,
//         // isCorrect: isCorrect, // الكود الأصلي معلّق هذا الحقل: أبقيناه كما هو
//       );
//     }

//     // إعلام الواجهة بالتحديث
//     answerViewsByQid.refresh();
//   }
// }

// import 'dart:async';
// import 'dart:convert';
// import 'dart:ui';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/Model/course-model.dart';
// import 'package:project_2/Model/exam.dart';
// import 'package:project_2/View/Login_Student.dart';
// import 'package:project_2/View/Exam_Screen.dart';

// /// =======================
// /// موديل مبسّط للمدرّس
// /// =======================
// class TeacherInfo {
//   final String firstName;
//   final String lastName;
//   final String name;
//   final String specialization;
//   final String phone;
//   final String country;
//   final String city;
//   final String gender;
//   final String previousExperiences;
//   final String status;
//   final String email;

//   TeacherInfo({
//     required this.firstName,
//     required this.lastName,
//     required this.name,
//     required this.specialization,
//     required this.phone,
//     required this.country,
//     required this.city,
//     required this.gender,
//     required this.previousExperiences,
//     required this.status,
//     required this.email,
//   });

//   factory TeacherInfo.fromJson(Map<String, dynamic> j) {
//     return TeacherInfo(
//       firstName: j['first_name']?.toString() ?? '',
//       lastName: j['last_name']?.toString() ?? '',
//       name: j['name']?.toString() ??
//           '${j['first_name'] ?? ''} ${j['last_name'] ?? ''}'.trim(),
//       specialization: j['specialization']?.toString() ?? '',
//       phone: j['phone']?.toString() ?? '',
//       country: j['country']?.toString() ?? '',
//       city: j['city']?.toString() ?? '',
//       gender: j['gender']?.toString() ?? '',
//       previousExperiences: j['Previous_experiences']?.toString() ?? '',
//       status: j['status']?.toString() ?? '',
//       email: j['email']?.toString() ?? '',
//     );
//   }
// }

// /// هذا الكنترولر مسؤول عن:
// /// - جلب الفئات والكورسات والبحث عنها
// /// - إدارة جلسة الامتحان (بدء/استعادة/مؤقّت/إرسال إجابات)
// /// - التخزين المحلي لبعض بيانات الامتحان لمتابعة الامتحان بعد الإغلاق
// class DashboardController extends GetxController {
//   // كائن Dio لإجراء طلبات HTTP
//   final dio.Dio _dio = dio.Dio();

//   // ===== الحالة العامة للدورات والفئات =====
//   var isLoading = false.obs; // حالة تحميل عامة للاستخدام في الواجهة
//   var categories = <Category>[].obs; // قائمة الفئات
//   var coursesBySearch = <Course>[].obs; // نتائج البحث عن الدورات
//   var coursesByCategory = <Course>[].obs; // دورات بحسب فئة محددة
//   var noResults = false.obs; // لا توجد نتائج

//   // ===== حالة المدرّسين (API /teachers) =====
//   var teachersLoading = false.obs; // تحميل قائمة المدرّسين
//   var teachers = <TeacherInfo>[].obs; // قائمة المدرّسين
//   var teachersError = ''.obs; // خطأ محتمل

//   // ===== حالة الامتحان =====
//   var examLoading = false.obs; // تحميل بيانات الامتحان
//   var examError = ''.obs; // رسالة خطأ الامتحان (إن وجدت)
//   var currentExam = Rxn<Exam>(); // الامتحان الحالي المحمّل
//   var currentAttempt = Rxn<ExamAttempt>(); // محاولة الامتحان الحالية (attempt)

//   var examStarted = false.obs; // هل بدأ الامتحان؟
//   var examCompleted = false.obs; // هل اكتمل/تم تصحيحه؟

//   var submitLoading = false.obs; // تحميل أثناء إرسال الإجابات
//   var submitResult = Rxn<ExamSubmitResult>(); // نتيجة التصحيح (score + details)

//   var remainingSeconds = 0.obs; // الوقت المتبقي بالثواني
//   Timer? _timer; // مؤقّت العدّ التنازلي

//   /// خريطة لاختيارات الطالب: questionId -> choiceId
//   var selectedChoiceByQid = <int, int>{}.obs;

//   final lastStartedAt =
//       Rxn<DateTime>(); // آخر توقيت بدأ فيه الامتحان (من السيرفر)
//   final activeCourseId = RxnInt(); // الكورس النشط للامتحان الحالي

//   /// تمثيل عرض موحّد بعد/قبل التصحيح (يحوي اختيار الطالب + الصحيح إن وجد)
//   var answerViewsByQid = <int, AnswerView>{}.obs;

//   // ===== مفاتيح التخزين المحلي (SharedPreferences) =====
//   String _kStartedAt(int courseId) => 'exam_${courseId}_started_at';
//   String _kDuration(int courseId) => 'exam_${courseId}_duration';
//   String _kAttemptId(int courseId) => 'exam_${courseId}_attempt_id';
//   String _kAnswers(int courseId) => 'exam_${courseId}_answers';
//   String _kExamId(int courseId) => 'exam_${courseId}_exam_id';

//   // ===== كاش خفيف لتحديد الـ courseId من الاسم/الفئة =====
//   final Map<String, int> _courseIdCache = {};

//   @override
//   void onInit() {
//     super.onInit();
//     // عند إنشاء الكنترولر: اجلب الفئات
//     fetchCategories();
//   }

//   // =========================
//   //  Teachers (/api/teachers)
//   // =========================

//   /// جلب جميع المدرّسين من الـ API
//   Future<void> fetchTeachers() async {
//     teachersLoading.value = true;
//     teachersError.value = '';
//     teachers.clear();
//     try {
//       // يمكن تمرير الهيدر Accept + Authorization إن كان الخادم يتطلب ذلك
//       final headers = await _authHeaders();
//       final res = await _dio.get(
//         'http://192.168.1.5:8000/api/teachers',
//         options: dio.Options(headers: headers, validateStatus: (_) => true),
//       );
//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('الرجاء تسجيل الدخول لعرض قائمة المدرّسين.');
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         if (res.data is Map &&
//             res.data['status'] == 'success' &&
//             res.data['data'] is List) {
//           final list = (res.data['data'] as List)
//               .map((e) => TeacherInfo.fromJson(e as Map<String, dynamic>))
//               .toList();
//           teachers.assignAll(list);
//         } else {
//           teachersError.value = 'ردّ الخادم غير متوقّع';
//         }
//       } else {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'فشل جلب المدرّسين';
//         teachersError.value = 'HTTP $status — $msg';
//       }
//     } catch (e) {
//       teachersError.value = 'تعذّر جلب المدرّسين: $e';
//     } finally {
//       teachersLoading.value = false;
//     }
//   }

//   // =========================
//   //  Categories & Courses
//   // =========================

//   /// جلب الفئات من الـ API
//   Future<void> fetchCategories() async {
//     isLoading.value = true;
//     coursesBySearch.clear(); // تنظيف أية نتائج بحث سابقة
//     try {
//       final response = await _dio.get('http://192.168.1.5:8000/api/categories');
//       final data = response.data['data'] as List<dynamic>;
//       categories.value = data.map((e) => Category.fromJson(e)).toList();
//       noResults.value = categories.isEmpty;
//     } catch (e) {
//       Future.microtask(
//           () => Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// جلب الدورات بحسب معرّف الفئة
//   Future<void> fetchCoursesByCategoryId(int categoryId) async {
//     isLoading.value = true;
//     coursesByCategory.clear();
//     noResults.value = false;
//     try {
//       final response = await _dio
//           .get('http://192.168.1.5:8000/api/courses/byCategory/$categoryId');
//           print(response.data);
//       if (response.data['status'] == 'success' &&
//           response.data['data'] is List) {
//         coursesByCategory.value = (response.data['data'] as List)
//             .map((e) => Course.fromJson(e))
//             .toList();
//       } else {
//         coursesByCategory.clear();
//         noResults.value = true;
//         print(response.data);
//       }
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'تعذر جلب الكورسات: $e'));
//       coursesByCategory.clear();
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// البحث عن دورات حسب: اسم المدرس -> إن لم يوجد: اسم الدورة -> إن لم يوجد: اسم الفئة
//   Future<void> searchCourses(String value) async {
//     value = value.trim();
//     if (value.isEmpty) {
//       coursesBySearch.clear();
//       noResults.value = false;
//       fetchCategories();
//       return;
//     }
//     isLoading.value = true;
//     coursesBySearch.clear();
//     noResults.value = false;

//     try {
//       List<Course> results = [];

//       // البحث أولًا باسم الدورة
//       final resCourse = await _dio.post(
//         'http://192.168.1.5:8000/api/courses/byName',
//         data: {'course_name': value},
//         options: dio.Options(headers: {'Accept': 'application/json'}),
//       );
//       if (resCourse.data['status'] == 'success' &&
//           resCourse.data['data'] is List) {
//         results = (resCourse.data['data'] as List)
//             .map((e) => Course.fromJson(e))
//             .toList();
//       }

//       // إن لم نجد نتيجة: ابحث باسم الفئة
//       if (results.isEmpty) {
//         final resCategory = await _dio.post(
//           'http://192.168.1.5:8000/api/courses/byCategory',
//           data: {'category_name': value},
//           options: dio.Options(headers: {'Accept': 'application/json'}),
//         );
//         if (resCategory.data['status'] == 'success' &&
//             resCategory.data['data'] is List) {
//           results = (resCategory.data['data'] as List)
//               .map((e) => Course.fromJson(e))
//               .toList();
//         }
//       }

//       coursesBySearch.value = results;
//       noResults.value = results.isEmpty;
//     } catch (e) {
//       Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e'));
//       noResults.value = true;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// مسح نتائج البحث والعودة للفئات
//   void clearCourseSearch() {
//     coursesBySearch.clear();
//     noResults.value = false;
//     fetchCategories();
//   }

//   /// تسجيل الخروج + تنظيف التوكنات + الذهاب لشاشة تسجيل الدخول
//   Future<void> logout() async {
//     isLoading.value = true;
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       await prefs.remove('token');
//       await prefs.remove('token_type');
//       await prefs.remove('refresh_token');
//       Get.offAll(() => Login());
//     } catch (e) {
//       Future.microtask(
//           () => Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e'));
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // =========================
//   //          Auth
//   // =========================

//   /// بناء ترويسات المصادقة (Bearer token) إن وُجد
//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty) 'Authorization': 'Bearer $token',
//     };
//   }

//   /// التحقق من وجود توكن صالح، وإلا الذهاب لتسجيل الدخول
//   Future<bool> _ensureAuthOrGoLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     if (token == null || token.isEmpty) {
//       _goLogin('الرجاء تسجيل الدخول للمتابعة.');
//       return false;
//     }
//     return true;
//   }

//   /// تنظيف بيانات الاعتماد والانتقال لصفحة الدخول + إظهار تنبيه
//   void _goLogin(String message) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token');
//     await prefs.remove('token_type');
//     Get.offAll(() => Login());
//     Future.microtask(() =>
//         Get.snackbar('تنبيه', message, snackPosition: SnackPosition.BOTTOM));
//   }

//   // =========================
//   //          Exam
//   // =========================

//   /// 🔁 تحديد courseId تلقائيًا من الباك (مع كاش):
//   /// - إن أُعطي courseId صالح >0 يرجعه فورًا.
//   /// - وإلا يبحث بالاسم عبر /api/courses/byName.
//   /// - وإن توفّر categoryName يحاول /byCategory ويطابق بالاسم.
//   Future<int?> _resolveCourseIdFromBackend({
//     int? courseId,
//     required String courseName,
//     String? categoryName,
//   }) async {
//     // 1) لو عندك courseId جاهز:
//     if (courseId != null && courseId > 0) return courseId;

//     // 2) كاش: "name|category"
//     final key =
//         '${courseName.trim().toLowerCase()}|${(categoryName ?? '').trim().toLowerCase()}';
//     if (_courseIdCache.containsKey(key)) return _courseIdCache[key];

//     try {
//       // أولوية: البحث بالاسم
//       final byName = await _dio.post(
//         'http://192.168.1.5:8000/api/courses/byName',
//         data: {'course_name': courseName},
//         options: dio.Options(
//             headers: {'Accept': 'application/json'},
//             validateStatus: (_) => true),
//       );
//       if (byName.statusCode != null &&
//           byName.statusCode! >= 200 &&
//           byName.statusCode! < 300) {
//         if (byName.data['status'] == 'success' && byName.data['data'] is List) {
//           final list = (byName.data['data'] as List);
//           if (list.isNotEmpty) {
//             final first = list.first as Map<String, dynamic>;
//             final id = (first['id'] ?? first['course_id']) as int?;
//             if (id != null && id > 0) {
//               _courseIdCache[key] = id;
//               return id;
//             }
//           }
//         }
//       }

//       // بديل: ابحث حسب الفئة ثم طابق الاسم
//       if ((categoryName ?? '').trim().isNotEmpty) {
//         final byCategory = await _dio.post(
//           'http://192.168.1.5:8000/api/courses/byCategory',
//           data: {'category_name': categoryName},
//           options: dio.Options(
//               headers: {'Accept': 'application/json'},
//               validateStatus: (_) => true),
//         );
//         if (byCategory.statusCode != null &&
//             byCategory.statusCode! >= 200 &&
//             byCategory.statusCode! < 300) {
//           if (byCategory.data['status'] == 'success' &&
//               byCategory.data['data'] is List) {
//             final list =
//                 (byCategory.data['data'] as List).cast<Map<String, dynamic>>();
//             final wanted = list.firstWhere(
//               (m) =>
//                   (m['course_name']?.toString().trim().toLowerCase() ?? '') ==
//                   courseName.trim().toLowerCase(),
//               orElse: () => {},
//             );
//             if (wanted.isNotEmpty) {
//               final id = (wanted['id'] ?? wanted['course_id']) as int?;
//               if (id != null && id > 0) {
//                 _courseIdCache[key] = id;
//                 return id;
//               }
//             }
//           }
//         }
//       }
//     } catch (e) {
//       Future.microtask(() => Get.snackbar(
//             'خطأ',
//             'تعذّر تحديد معرف الكورس تلقائيًا: $e',
//             snackPosition: SnackPosition.BOTTOM,
//           ));
//     }

//     // فشل التحديد
//     return null;
//   }

//   /// 🌟 API موحّد يُستدعى من الواجهة عند الضغط على Exam:
//   /// يحدد الـ courseId من الباك، يحفظه كـ activeCourseId،
//   /// يجلب الامتحان، ثم يفتح شاشة ExamScreen بالـID الصحيح.
//   Future<void> openExamForCourse({
//     int? courseId,
//     required String courseName,
//     String? categoryName,
//     required String courseTitleForUi,
//   }) async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     // حاول تحديد الـID
//     final resolvedId = await _resolveCourseIdFromBackend(
//       courseId: courseId,
//       courseName: courseName,
//       categoryName: categoryName,
//     );

//     if (resolvedId == null || resolvedId <= 0) {
//       Get.snackbar(
//         'خطأ',
//         'تعذّر تحديد معرف الكورس لهذا الامتحان.',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: const Color(0xFFFFE6E6),
//       );
//       return;
//     }

//     activeCourseId.value = resolvedId;

//     // حمّل بيانات الامتحان (اختياري قبل الدخول)، مفيد لعرض رسالة فورية إن فيه منع/403
//     await fetchExamByCourseId(resolvedId);

//     // انتقل لشاشة الامتحان ومعك الـID الصحيح
//     Get.to(() => ExamScreen(
//           courseId: resolvedId,
//           courseTitle: courseTitleForUi,
//         ));
//   }

//   /// تخزين بيانات المحاولة (start/duration/attemptId/examId) في SharedPreferences
//   Future<void> _persistAttempt({
//     required int courseId,
//     required DateTime startedAt,
//     required int durationMinutes,
//     required int attemptId,
//     required int examId,
//   }) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_kStartedAt(courseId), startedAt.toIso8601String());
//     await prefs.setInt(_kDuration(courseId), durationMinutes);
//     await prefs.setInt(_kAttemptId(courseId), attemptId);
//     await prefs.setInt(_kExamId(courseId), examId);
//   }

//   /// إزالة بيانات المحاولة المخزّنة
//   Future<void> _clearPersistedAttempt(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_kStartedAt(courseId));
//     await prefs.remove(_kDuration(courseId));
//     await prefs.remove(_kAttemptId(courseId));
//     await prefs.remove(_kExamId(courseId));
//   }

//   /// تحميل attempt_id المخزّن (إن وُجد)
//   Future<int?> _loadPersistedAttemptId(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt(_kAttemptId(courseId));
//   }

//   /// استعادة المؤقّت إن كان الامتحان قد بدأ سابقًا ولم ينتهِ وقته
//   Future<void> restoreExamTimerIfAny(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     final s = prefs.getString(_kStartedAt(courseId));
//     final dur = prefs.getInt(_kDuration(courseId));
//     if (s == null || dur == null) return;

//     try {
//       final started = DateTime.parse(s);
//       final total = dur * 60; // مدة الامتحان بالثواني
//       final elapsed = DateTime.now().difference(started).inSeconds; // المنقضي
//       final remain = total - elapsed; // المتبقي

//       if (remain > 0) {
//         lastStartedAt.value = started;
//         remainingSeconds.value = remain;
//         examStarted.value = true;
//         _startTimer(); // إعادة تشغيل المؤقّت
//       } else {
//         await _clearPersistedAttempt(courseId);
//         examStarted.value = false;
//         remainingSeconds.value = 0;
//       }
//     } catch (_) {}
//   }

//   /// استعادة إجابات الطالب المخزّنة (questionId -> choiceId)
//   Future<void> _restoreAnswers(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     final raw = prefs.getString(_kAnswers(courseId));
//     if (raw == null || raw.isEmpty) return;
//     try {
//       final decoded = jsonDecode(raw);
//       if (decoded is Map) {
//         final restored = <int, int>{};
//         decoded.forEach((k, v) {
//           final q = int.tryParse(k.toString());
//           final c = (v is int) ? v : int.tryParse(v.toString());
//           if (q != null && c != null) restored[q] = c;
//         });
//         selectedChoiceByQid.assignAll(restored);
//       }
//     } catch (_) {}
//   }

//   /// حفظ الإجابات الحالية في التخزين المحلي
//   Future<void> _persistAnswers() async {
//     final id = activeCourseId.value;
//     if (id == null) return;
//     final prefs = await SharedPreferences.getInstance();
//     final toStore = <String, int>{};
//     selectedChoiceByQid.forEach((q, c) => toStore[q.toString()] = c);
//     await prefs.setString(_kAnswers(id), jsonEncode(toStore));
//   }

//   /// حذف الإجابات المحفوظة محليًا
//   Future<void> clearSavedAnswers(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_kAnswers(courseId));
//   }

//   /// جلب بيانات الامتحان لدورة محددة
//   Future<void> fetchExamByCourseId(int courseId) async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     examLoading.value = true;
//     examError.value = '';
//     submitResult.value = null;
//     examCompleted.value = false;
//     currentExam.value = null;
//     currentAttempt.value = null;
//     selectedChoiceByQid.clear();
//     answerViewsByQid.clear();
//     _stopTimer();

//     try {
//       activeCourseId.value = courseId;

//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000/api/courses/$courseId/exam/student';

//       final res = await _dio.get(
//         url,
//         options: dio.Options(headers: headers, validateStatus: (_) => true),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح بالوصول إلى الامتحان.';
//         examError.value = '403 — $msg';
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         final exam = Exam.fromApiRoot(res.data as Map<String, dynamic>);
//         if (exam == null) {
//           examError.value = 'لم يتم العثور على بيانات الامتحان.';
//         } else {
//           currentExam.value = exam;
//           remainingSeconds.value = exam.durationMinutes * 60;

//           await _restoreAnswers(courseId);
//           _rebuildAnswerViews();
//           await restoreExamTimerIfAny(courseId);
//         }
//       } else {
//         examError.value = 'فشل جلب الامتحان (HTTP $status): ${res.data}';
//       }
//     } catch (e) {
//       examError.value = 'فشل جلب الامتحان: $e';
//     } finally {
//       examLoading.value = false;
//     }
//   }

//   /// بدء الامتحان (ينشئ attempt في السيرفر ويبدأ العدّ التنازلي)
//   Future<void> startExam(int courseId) async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     // إن لم تكن بيانات الامتحان موجودة بعد، اجلبها أولًا
//     if (currentExam.value == null) {
//       await fetchExamByCourseId(courseId);
//       if (currentExam.value == null) return;
//     }

//     try {
//       final headers = await _authHeaders();

//       // نستخدم exam.id (وليس courseId) لمسار البدء
//       final int examId = currentExam.value!.id;
//       final url = 'http://192.168.1.5:8000/api/exams/$examId/start';

//       final res = await _dio.post(
//         url,
//         options: dio.Options(headers: headers, validateStatus: (_) => true),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح ببدء الامتحان.';
//         Get.snackbar('403', msg,
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: const Color(0xFFFFE6E6));
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         final attempt =
//             ExamAttempt.fromApiRoot(res.data as Map<String, dynamic>);
//         if (attempt == null) {
//           Get.snackbar('خطأ', 'ردّ البدء غير مفهوم',
//               snackPosition: SnackPosition.BOTTOM,
//               backgroundColor: const Color(0xFFFFE6E6));
//           return;
//         }
//         currentAttempt.value = attempt;
//         lastStartedAt.value = attempt.startedAt;

//         final startedAt = attempt.startedAt ?? DateTime.now();
//         final duration = currentExam.value!.durationMinutes;

//         await _persistAttempt(
//           courseId: courseId,
//           startedAt: startedAt,
//           durationMinutes: duration,
//           attemptId: attempt.id,
//           examId: attempt.examId,
//         );

//         final total = duration * 60;
//         final elapsed = DateTime.now().difference(startedAt).inSeconds;
//         remainingSeconds.value = (total - elapsed).clamp(0, total);
//         examStarted.value = remainingSeconds.value > 0;
//         _startTimer();

//         final ts = attempt.startedAt?.toIso8601String() ?? '';
//         Get.snackbar('تم بدء الامتحان',
//             ts.isEmpty ? 'بدأ العدّ التنازلي' : 'started_at: $ts',
//             snackPosition: SnackPosition.BOTTOM);
//       } else {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'فشل بدء الامتحان.';
//         Get.snackbar('خطأ', 'HTTP $status — $msg',
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: const Color(0xFFFFE6E6));
//       }
//     } catch (e) {
//       Get.snackbar('خطأ', 'استثناء أثناء بدء الامتحان: $e',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: const Color(0xFFFFE6E6));
//     }
//   }

//   /// تخزين اختيار الطالب لسؤال ما ثم إعادة بناء العرض وحفظه محليًا
//   void selectChoice(int questionId, int choiceId) {
//     selectedChoiceByQid[questionId] = choiceId;
//     selectedChoiceByQid.refresh();
//     _persistAnswers();
//     _rebuildAnswerViews();
//   }

//   /// إرسال الإجابات للتصحيح عبر attempt_id
//   Future<void> submitExamAnswers() async {
//     if (!await _ensureAuthOrGoLogin()) return;

//     final exam = currentExam.value;
//     if (exam == null) {
//       Get.snackbar('خطأ', 'لا توجد بيانات امتحان محمّلة.',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: const Color(0xFFFFE6E6));
//       return;
//     }

//     final courseId = activeCourseId.value ?? exam.courseId;
//     final attemptId =
//         currentAttempt.value?.id ?? await _loadPersistedAttemptId(courseId);
//     if (attemptId == null || attemptId <= 0) {
//       Get.snackbar('خطأ', 'لا توجد محاولة نشطة. ابدأ الامتحان أولًا.',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: const Color(0xFFFFE6E6));
//       return;
//     }

//     final answers = <Map<String, dynamic>>[];
//     for (final q in exam.questions) {
//       final sel = selectedChoiceByQid[q.id];
//       if (sel != null) answers.add({'question_id': q.id, 'choice_id': sel});
//     }
//     if (answers.isEmpty) {
//       Get.snackbar('تنبيه', 'لم تختر أي إجابة.',
//           snackPosition: SnackPosition.BOTTOM);
//       return;
//     }

//     submitLoading.value = true;
//     try {
//       final headers = await _authHeaders();
//       final url = 'http://192.168.1.5:8000/api/exam-attempts/$attemptId/submit';

//       final res = await _dio.post(
//         url,
//         data: {'answers': answers},
//         options: dio.Options(
//           headers: {...headers, 'Content-Type': 'application/json'},
//           validateStatus: (_) => true,
//         ),
//       );

//       final status = res.statusCode ?? 0;

//       if (status == 401) {
//         _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
//         return;
//       }
//       if (status == 403) {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'غير مسموح بإرسال الإجابات.';
//         Get.snackbar('403', msg,
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: const Color(0xFFFFE6E6));
//         return;
//       }

//       if (status >= 200 && status < 300) {
//         final result =
//             ExamSubmitResult.fromRoot(res.data as Map<String, dynamic>);
//         submitResult.value = result;

//         examCompleted.value = true;
//         examStarted.value = false;
//         remainingSeconds.value = 0;
//         _timer?.cancel();

//         await _clearPersistedAttempt(courseId);
//         _rebuildAnswerViews();

//         Get.snackbar('تم التصحيح', 'النتيجة: ${result.score}',
//             snackPosition: SnackPosition.BOTTOM);
//       } else {
//         final msg = (res.data is Map && res.data['message'] != null)
//             ? res.data['message'].toString()
//             : 'فشل إرسال الإجابات.';
//         Get.snackbar('خطأ', 'HTTP $status — $msg',
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: const Color(0xFFFFE6E6));
//       }
//     } catch (e) {
//       Get.snackbar('خطأ', 'استثناء أثناء إرسال الإجابات: $e',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: const Color(0xFFFFE6E6));
//     } finally {
//       submitLoading.value = false;
//     }
//   }

//   /// تشغيل مؤقّت العدّ التنازلي ثانية بثانية
//   void _startTimer() {
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
//       if (remainingSeconds.value <= 0) {
//         remainingSeconds.value = 0;
//         _timer?.cancel();
//         examStarted.value = false;
//       } else {
//         remainingSeconds.value = remainingSeconds.value - 1;
//       }
//     });
//   }

//   /// إيقاف المؤقّت (إن وُجد)
//   void _stopTimer() {
//     _timer?.cancel();
//     _timer = null;
//   }

//   /// تنسيق الوقت المتبقي على شكل mm:ss
//   String formatRemaining() {
//     final s = remainingSeconds.value;
//     final m = s ~/ 60;
//     final r = s % 60;
//     final mm = m.toString().padLeft(2, '0');
//     final ss = r.toString().padLeft(2, '0');
//     return '$mm:$ss';
//   }

//   /// إعادة بناء عرض الإجابات لكل سؤال:
//   /// - نص اختيار الطالب
//   /// - نص الإجابة الصحيحة (إن توفّرت من السيرفر بعد التصحيح)
//   void _rebuildAnswerViews() {
//     answerViewsByQid.clear();
//     final exam = currentExam.value;
//     if (exam == null) return;

//     final details = submitResult.value?.details ?? [];

//     AnswerDetail? _findDetailFor(ExamQuestion q) {
//       for (final d in details) {
//         if (d.questionId == q.id) return d;
//       }
//       for (final d in details) {
//         if ((d.questionText.trim()) == (q.questionText.trim())) return d;
//       }
//       return null;
//     }

//     String? _studentTextFromChoice(ExamQuestion q, int? selectedId) {
//       if (selectedId == null) return null;
//       for (final c in q.choices) {
//         if (c.id == selectedId) return c.choiceText;
//       }
//       return null;
//     }

//     String _norm(String s) => s.replaceAll(RegExp(r'\s+'), '').trim();

//     for (final q in exam.questions) {
//       final selectedId = selectedChoiceByQid[q.id];
//       final d = _findDetailFor(q);

//       final studentText =
//           d?.studentChoice ?? _studentTextFromChoice(q, selectedId);
//       final correctText = d?.correctChoice;

//       bool? isCorrect = d?.isCorrect;
//       if (isCorrect == null) {
//         if (studentText != null && correctText != null) {
//           isCorrect = _norm(studentText) == _norm(correctText);
//         }
//       }

//       answerViewsByQid[q.id] = AnswerView(
//         questionId: q.id,
//         questionText: q.questionText,
//         studentChoiceText: studentText,
//         correctChoiceText: correctText,
//         // isCorrect: isCorrect, // (إن حبيت تفعّلها لاحقًا)
//       );
//     }

//     answerViewsByQid.refresh();
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:project_2/Model/category_model.dart';
import 'package:project_2/Model/course-model.dart';
import 'package:project_2/Model/exam.dart';
import 'package:project_2/View/Login_Student.dart';
import 'package:project_2/View/Exam_Screen.dart';

/// =======================
/// موديل مبسّط للمدرّس
/// =======================
class TeacherInfo {
  final String firstName;
  final String lastName;
  final String name;
  final String specialization;
  final String phone;
  final String country;
  final String city;
  final String gender;
  final String previousExperiences;
  final String status;
  final String email;

  TeacherInfo({
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.specialization,
    required this.phone,
    required this.country,
    required this.city,
    required this.gender,
    required this.previousExperiences,
    required this.status,
    required this.email,
  });

  factory TeacherInfo.fromJson(Map<String, dynamic> j) {
    return TeacherInfo(
      firstName: j['first_name']?.toString() ?? '',
      lastName: j['last_name']?.toString() ?? '',
      name: j['name']?.toString() ??
          '${j['first_name'] ?? ''} ${j['last_name'] ?? ''}'.trim(),
      specialization: j['specialization']?.toString() ?? '',
      phone: j['phone']?.toString() ?? '',
      country: j['country']?.toString() ?? '',
      city: j['city']?.toString() ?? '',
      gender: j['gender']?.toString() ?? '',
      previousExperiences: j['Previous_experiences']?.toString() ?? '',
      status: j['status']?.toString() ?? '',
      email: j['email']?.toString() ?? '',
    );
  }
}

/// هذا الكنترولر مسؤول عن:
/// - جلب الفئات والكورسات والبحث عنها
/// - إدارة جلسة الامتحان (بدء/استعادة/مؤقّت/إرسال إجابات)
/// - التخزين المحلي لبعض بيانات الامتحان لمتابعة الامتحان بعد الإغلاق
class DashboardController extends GetxController {
  // كائن Dio لإجراء طلبات HTTP
  final dio.Dio _dio = dio.Dio();

  // ===== الحالة العامة للدورات والفئات =====
  var isLoading = false.obs; // حالة تحميل عامة للاستخدام في الواجهة
  var categories = <Category>[].obs; // قائمة الفئات
  var coursesBySearch = <Course>[].obs; // نتائج البحث عن الدورات
  var coursesByCategory = <Course>[].obs; // دورات بحسب فئة محددة
  var noResults = false.obs; // لا توجد نتائج

  // ===== حالة المدرّسين (API /teachers) =====
  var teachersLoading = false.obs; // تحميل قائمة المدرّسين
  var teachers = <TeacherInfo>[].obs; // قائمة المدرّسين
  var teachersError = ''.obs; // خطأ محتمل

  // ===== حالة الامتحان =====
  var examLoading = false.obs; // تحميل بيانات الامتحان
  var examError = ''.obs; // رسالة خطأ الامتحان (إن وجدت)
  var currentExam = Rxn<Exam>(); // الامتحان الحالي المحمّل
  var currentAttempt = Rxn<ExamAttempt>(); // محاولة الامتحان الحالية (attempt)

  var examStarted = false.obs; // هل بدأ الامتحان؟
  var examCompleted = false.obs; // هل اكتمل/تم تصحيحه؟

  var submitLoading = false.obs; // تحميل أثناء إرسال الإجابات
  var submitResult = Rxn<ExamSubmitResult>(); // نتيجة التصحيح (score + details)

  var remainingSeconds = 0.obs; // الوقت المتبقي بالثواني
  Timer? _timer; // مؤقّت العدّ التنازلي

  /// خريطة لاختيارات الطالب: questionId -> choiceId
  var selectedChoiceByQid = <int, int>{}.obs;

  final lastStartedAt =
      Rxn<DateTime>(); // آخر توقيت بدأ فيه الامتحان (من السيرفر)
  final activeCourseId = RxnInt(); // الكورس النشط للامتحان الحالي

  /// تمثيل عرض موحّد بعد/قبل التصحيح (يحوي اختيار الطالب + الصحيح إن وجد)
  var answerViewsByQid = <int, AnswerView>{}.obs;

  // ===== مفاتيح التخزين المحلي (SharedPreferences) =====
  String _kStartedAt(int courseId) => 'exam_${courseId}_started_at';
  String _kDuration(int courseId) => 'exam_${courseId}_duration';
  String _kAttemptId(int courseId) => 'exam_${courseId}_attempt_id';
  String _kAnswers(int courseId) => 'exam_${courseId}_answers';
  String _kExamId(int courseId) => 'exam_${courseId}_exam_id';

  // ===== كاش خفيف لتحديد الـ courseId من الاسم/الفئة =====
  final Map<String, int> _courseIdCache = {};

  @override
  void onInit() {
    super.onInit();
    // عند إنشاء الكنترولر: اجلب الفئات
    fetchCategories();
  }

  // =========================
  //  Teachers (/api/teachers)
  // =========================

  /// جلب جميع المدرّسين من الـ API
  Future<void> fetchTeachers() async {
    teachersLoading.value = true;
    teachersError.value = '';
    teachers.clear();
    try {
      // يمكن تمرير الهيدر Accept + Authorization إن كان الخادم يتطلب ذلك
      final headers = await _authHeaders();
      final res = await _dio.get(
        'http://192.168.1.5:8000/api/teachers',
        options: dio.Options(headers: headers, validateStatus: (_) => true),
      );
      final status = res.statusCode ?? 0;

      if (status == 401) {
        _goLogin('الرجاء تسجيل الدخول لعرض قائمة المدرّسين.');
        return;
      }

      if (status >= 200 && status < 300) {
        if (res.data is Map &&
            res.data['status'] == 'success' &&
            res.data['data'] is List) {
          final list = (res.data['data'] as List)
              .map((e) => TeacherInfo.fromJson(e as Map<String, dynamic>))
              .toList();
          teachers.assignAll(list);
        } else {
          teachersError.value = 'ردّ الخادم غير متوقّع';
        }
      } else {
        final msg = (res.data is Map && res.data['message'] != null)
            ? res.data['message'].toString()
            : 'فشل جلب المدرّسين';
        teachersError.value = 'HTTP $status — $msg';
      }
    } catch (e) {
      teachersError.value = 'تعذّر جلب المدرّسين: $e';
    } finally {
      teachersLoading.value = false;
    }
  }

  // =========================
  //  Categories & Courses
  // =========================

  /// جلب الفئات من الـ API
  Future<void> fetchCategories() async {
    isLoading.value = true;
    coursesBySearch.clear(); // تنظيف أية نتائج بحث سابقة
    try {
      final response = await _dio.get('http://192.168.1.5:8000/api/categories');
      final data = response.data['data'] as List<dynamic>;
      categories.value = data.map((e) => Category.fromJson(e)).toList();
      noResults.value = categories.isEmpty;
    } catch (e) {
      Future.microtask(
          () => Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e'));
      noResults.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  /// جلب الدورات بحسب معرّف الفئة (يستدعى من الواجهة)
  Future<void> fetchCoursesByCategoryId(int categoryId) async {
    isLoading.value = true;
    coursesByCategory.clear();
    noResults.value = false;
    try {
      final response = await _dio
          .get('http://192.168.1.5:8000/api/courses/byCategory/$categoryId');
      print(response.data);
      if (response.data['status'] == 'success' &&
          response.data['data'] is List) {
        coursesByCategory.value = (response.data['data'] as List)
            .map((e) => Course.fromJson(e))
            .toList();
      } else {
        coursesByCategory.clear();
        noResults.value = true;
        print(response.data);
      }
    } catch (e) {
      Future.microtask(() => Get.snackbar('خطأ', 'تعذر جلب الكورسات: $e'));
      coursesByCategory.clear();
      noResults.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  /// البحث عن دورات حسب: اسم الدورة -> إن لم يوجد: اسم الفئة
  Future<void> searchCourses(String value) async {
    value = value.trim();
    if (value.isEmpty) {
      coursesBySearch.clear();
      noResults.value = false;
      fetchCategories();
      return;
    }
    isLoading.value = true;
    coursesBySearch.clear();
    noResults.value = false;

    try {
      List<Course> results = [];

      // البحث أولًا باسم الدورة
      final resCourse = await _dio.post(
        'http://192.168.1.5:8000/api/courses/byName',
        data: {'course_name': value},
        options: dio.Options(headers: {'Accept': 'application/json'}),
      );
      if (resCourse.data['status'] == 'success' &&
          resCourse.data['data'] is List) {
        results = (resCourse.data['data'] as List)
            .map((e) => Course.fromJson(e))
            .toList();
      }

      // إن لم نجد نتيجة: ابحث باسم الفئة
      if (results.isEmpty) {
        final resCategory = await _dio.post(
          'http://192.168.1.5:8000/api/courses/byCategory',
          data: {'category_name': value},
          options: dio.Options(headers: {'Accept': 'application/json'}),
        );
        if (resCategory.data['status'] == 'success' &&
            resCategory.data['data'] is List) {
          results = (resCategory.data['data'] as List)
              .map((e) => Course.fromJson(e))
              .toList();
        }
      }

      coursesBySearch.value = results;
      noResults.value = results.isEmpty;
    } catch (e) {
      Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e'));
      noResults.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  /// مسح نتائج البحث والعودة للفئات
  void clearCourseSearch() {
    coursesBySearch.clear();
    noResults.value = false;
    fetchCategories();
  }

  /// تسجيل الخروج + تنظيف التوكنات + الذهاب لشاشة تسجيل الدخول
  Future<void> logout() async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove('token');
      await prefs.remove('token_type');
      await prefs.remove('refresh_token');
      Get.offAll(() => Login());
    } catch (e) {
      Future.microtask(
          () => Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e'));
    } finally {
      isLoading.value = false;
    }
  }

  // =========================
  //          Auth
  // =========================

  /// بناء ترويسات المصادقة (Bearer token) إن وُجد
  Future<Map<String, String>> _authHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    return {
      'Accept': 'application/json',
      if (token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }

  /// التحقق من وجود توكن صالح، وإلا الذهاب لتسجيل الدخول
  Future<bool> _ensureAuthOrGoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null || token.isEmpty) {
      _goLogin('الرجاء تسجيل الدخول للمتابعة.');
      return false;
    }
    return true;
  }

  /// تنظيف بيانات الاعتماد والانتقال لصفحة الدخول + إظهار تنبيه
  void _goLogin(String message) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('token_type');
    Get.offAll(() => Login());
    Future.microtask(() =>
        Get.snackbar('تنبيه', message, snackPosition: SnackPosition.BOTTOM));
  }

  // =========================
  //          Exam
  // =========================

  Future<int?> _resolveCourseIdFromBackend({
    int? courseId,
    required String courseName,
    String? categoryName,
  }) async {
    if (courseId != null && courseId > 0) return courseId;

    final key =
        '${courseName.trim().toLowerCase()}|${(categoryName ?? '').trim().toLowerCase()}';
    if (_courseIdCache.containsKey(key)) return _courseIdCache[key];

    try {
      final byName = await _dio.post(
        'http://192.168.1.5:8000/api/courses/byName',
        data: {'course_name': courseName},
        options: dio.Options(
            headers: {'Accept': 'application/json'},
            validateStatus: (_) => true),
      );
      if (byName.statusCode != null &&
          byName.statusCode! >= 200 &&
          byName.statusCode! < 300) {
        if (byName.data['status'] == 'success' && byName.data['data'] is List) {
          final list = (byName.data['data'] as List);
          if (list.isNotEmpty) {
            final first = list.first as Map<String, dynamic>;
            final id = (first['id'] ?? first['course_id']) as int?;
            if (id != null && id > 0) {
              _courseIdCache[key] = id;
              return id;
            }
          }
        }
      }

      if ((categoryName ?? '').trim().isNotEmpty) {
        final byCategory = await _dio.post(
          'http://192.168.1.5:8000/api/courses/byCategory',
          data: {'category_name': categoryName},
          options: dio.Options(
              headers: {'Accept': 'application/json'},
              validateStatus: (_) => true),
        );
        if (byCategory.statusCode != null &&
            byCategory.statusCode! >= 200 &&
            byCategory.statusCode! < 300) {
          if (byCategory.data['status'] == 'success' &&
              byCategory.data['data'] is List) {
            final list =
                (byCategory.data['data'] as List).cast<Map<String, dynamic>>();
            final wanted = list.firstWhere(
              (m) =>
                  (m['course_name']?.toString().trim().toLowerCase() ?? '') ==
                  courseName.trim().toLowerCase(),
              orElse: () => {},
            );
            if (wanted.isNotEmpty) {
              final id = (wanted['id'] ?? wanted['course_id']) as int?;
              if (id != null && id > 0) {
                _courseIdCache[key] = id;
                return id;
              }
            }
          }
        }
      }
    } catch (e) {
      Future.microtask(() => Get.snackbar(
            'خطأ',
            'تعذّر تحديد معرف الكورس تلقائيًا: $e',
            snackPosition: SnackPosition.BOTTOM,
          ));
    }

    return null;
  }

  Future<void> openExamForCourse({
    int? courseId,
    required String courseName,
    String? categoryName,
    required String courseTitleForUi,
  }) async {
    if (!await _ensureAuthOrGoLogin()) return;

    final resolvedId = await _resolveCourseIdFromBackend(
      courseId: courseId,
      courseName: courseName,
      categoryName: categoryName,
    );

    if (resolvedId == null || resolvedId <= 0) {
      Get.snackbar(
        'خطأ',
        'تعذّر تحديد معرف الكورس لهذا الامتحان.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFFFE6E6),
      );
      return;
    }

    activeCourseId.value = resolvedId;

    await fetchExamByCourseId(resolvedId);

    Get.to(() => ExamScreen(
          courseId: resolvedId,
          courseTitle: courseTitleForUi,
        ));
  }

  Future<void> _persistAttempt({
    required int courseId,
    required DateTime startedAt,
    required int durationMinutes,
    required int attemptId,
    required int examId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kStartedAt(courseId), startedAt.toIso8601String());
    await prefs.setInt(_kDuration(courseId), durationMinutes);
    await prefs.setInt(_kAttemptId(courseId), attemptId);
    await prefs.setInt(_kExamId(courseId), examId);
  }

  Future<void> _clearPersistedAttempt(int courseId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kStartedAt(courseId));
    await prefs.remove(_kDuration(courseId));
    await prefs.remove(_kAttemptId(courseId));
    await prefs.remove(_kExamId(courseId));
  }

  Future<int?> _loadPersistedAttemptId(int courseId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_kAttemptId(courseId));
  }

  Future<void> restoreExamTimerIfAny(int courseId) async {
    final prefs = await SharedPreferences.getInstance();
    final s = prefs.getString(_kStartedAt(courseId));
    final dur = prefs.getInt(_kDuration(courseId));
    if (s == null || dur == null) return;

    try {
      final started = DateTime.parse(s);
      final total = dur * 60;
      final elapsed = DateTime.now().difference(started).inSeconds;
      final remain = total - elapsed;

      if (remain > 0) {
        lastStartedAt.value = started;
        remainingSeconds.value = remain;
        examStarted.value = true;
        _startTimer();
      } else {
        await _clearPersistedAttempt(courseId);
        examStarted.value = false;
        remainingSeconds.value = 0;
      }
    } catch (_) {}
  }

  Future<void> _restoreAnswers(int courseId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kAnswers(courseId));
    if (raw == null || raw.isEmpty) return;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is Map) {
        final restored = <int, int>{};
        decoded.forEach((k, v) {
          final q = int.tryParse(k.toString());
          final c = (v is int) ? v : int.tryParse(v.toString());
          if (q != null && c != null) restored[q] = c;
        });
        selectedChoiceByQid.assignAll(restored);
      }
    } catch (_) {}
  }

  Future<void> _persistAnswers() async {
    final id = activeCourseId.value;
    if (id == null) return;
    final prefs = await SharedPreferences.getInstance();
    final toStore = <String, int>{};
    selectedChoiceByQid.forEach((q, c) => toStore[q.toString()] = c);
    await prefs.setString(_kAnswers(id), jsonEncode(toStore));
  }

  Future<void> clearSavedAnswers(int courseId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kAnswers(courseId));
  }

  Future<void> fetchExamByCourseId(int courseId) async {
    if (!await _ensureAuthOrGoLogin()) return;

    examLoading.value = true;
    examError.value = '';
    submitResult.value = null;
    examCompleted.value = false;
    currentExam.value = null;
    currentAttempt.value = null;
    selectedChoiceByQid.clear();
    answerViewsByQid.clear();
    _stopTimer();

    try {
      activeCourseId.value = courseId;

      final headers = await _authHeaders();
      final url = 'http://192.168.1.5:8000/api/courses/$courseId/exam/student';

      final res = await _dio.get(
        url,
        options: dio.Options(headers: headers, validateStatus: (_) => true),
      );

      final status = res.statusCode ?? 0;

      if (status == 401) {
        _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
        return;
      }
      if (status == 403) {
        final msg = (res.data is Map && res.data['message'] != null)
            ? res.data['message'].toString()
            : 'غير مسموح بالوصول إلى الامتحان.';
        examError.value = '403 — $msg';
        return;
      }

      if (status >= 200 && status < 300) {
        final exam = Exam.fromApiRoot(res.data as Map<String, dynamic>);
        if (exam == null) {
          examError.value = 'لم يتم العثور على بيانات الامتحان.';
        } else {
          currentExam.value = exam;
          remainingSeconds.value = exam.durationMinutes * 60;

          await _restoreAnswers(courseId);
          _rebuildAnswerViews();
          await restoreExamTimerIfAny(courseId);
        }
      } else {
        examError.value = 'فشل جلب الامتحان (HTTP $status): ${res.data}';
      }
    } catch (e) {
      examError.value = 'فشل جلب الامتحان: $e';
    } finally {
      examLoading.value = false;
    }
  }

  Future<void> startExam(int courseId) async {
    if (!await _ensureAuthOrGoLogin()) return;

    if (currentExam.value == null) {
      await fetchExamByCourseId(courseId);
      if (currentExam.value == null) return;
    }

    try {
      final headers = await _authHeaders();

      final int examId = currentExam.value!.id;
      final url = 'http://192.168.1.5:8000/api/exams/$examId/start';

      final res = await _dio.post(
        url,
        options: dio.Options(headers: headers, validateStatus: (_) => true),
      );

      final status = res.statusCode ?? 0;

      if (status == 401) {
        _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
        return;
      }
      if (status == 403) {
        final msg = (res.data is Map && res.data['message'] != null)
            ? res.data['message'].toString()
            : 'غير مسموح ببدء الامتحان.';
        Get.snackbar('403', msg,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xFFFFE6E6));
        return;
      }

      if (status >= 200 && status < 300) {
        final attempt =
            ExamAttempt.fromApiRoot(res.data as Map<String, dynamic>);
        if (attempt == null) {
          Get.snackbar('خطأ', 'ردّ البدء غير مفهوم',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: const Color(0xFFFFE6E6));
          return;
        }
        currentAttempt.value = attempt;
        lastStartedAt.value = attempt.startedAt;

        final startedAt = attempt.startedAt ?? DateTime.now();
        final duration = currentExam.value!.durationMinutes;

        await _persistAttempt(
          courseId: courseId,
          startedAt: startedAt,
          durationMinutes: duration,
          attemptId: attempt.id,
          examId: attempt.examId,
        );

        final total = duration * 60;
        final elapsed = DateTime.now().difference(startedAt).inSeconds;
        remainingSeconds.value = (total - elapsed).clamp(0, total);
        examStarted.value = remainingSeconds.value > 0;
        _startTimer();

        final ts = attempt.startedAt?.toIso8601String() ?? '';
        Get.snackbar('تم بدء الامتحان',
            ts.isEmpty ? 'بدأ العدّ التنازلي' : 'started_at: $ts',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        final msg = (res.data is Map && res.data['message'] != null)
            ? res.data['message'].toString()
            : 'فشل بدء الامتحان.';
        Get.snackbar('خطأ', 'HTTP $status — $msg',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xFFFFE6E6));
      }
    } catch (e) {
      Get.snackbar('خطأ', 'استثناء أثناء بدء الامتحان: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFFFFE6E6));
    }
  }

  void selectChoice(int questionId, int choiceId) {
    selectedChoiceByQid[questionId] = choiceId;
    selectedChoiceByQid.refresh();
    _persistAnswers();
    _rebuildAnswerViews();
  }

  Future<void> submitExamAnswers() async {
    if (!await _ensureAuthOrGoLogin()) return;

    final exam = currentExam.value;
    if (exam == null) {
      Get.snackbar('خطأ', 'لا توجد بيانات امتحان محمّلة.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFFFFE6E6));
      return;
    }

    final courseId = activeCourseId.value ?? exam.courseId;
    final attemptId =
        currentAttempt.value?.id ?? await _loadPersistedAttemptId(courseId);
    if (attemptId == null || attemptId <= 0) {
      Get.snackbar('خطأ', 'لا توجد محاولة نشطة. ابدأ الامتحان أولًا.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFFFFE6E6));
      return;
    }

    final answers = <Map<String, dynamic>>[];
    for (final q in exam.questions) {
      final sel = selectedChoiceByQid[q.id];
      if (sel != null) answers.add({'question_id': q.id, 'choice_id': sel});
    }
    if (answers.isEmpty) {
      Get.snackbar('تنبيه', 'لم تختر أي إجابة.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    submitLoading.value = true;
    try {
      final headers = await _authHeaders();
      final url = 'http://192.168.1.5:8000/api/exam-attempts/$attemptId/submit';

      final res = await _dio.post(
        url,
        data: {'answers': answers},
        options: dio.Options(
          headers: {...headers, 'Content-Type': 'application/json'},
          validateStatus: (_) => true,
        ),
      );

      final status = res.statusCode ?? 0;

      if (status == 401) {
        _goLogin('انتهت صلاحية الجلسة. الرجاء تسجيل الدخول.');
        return;
      }
      if (status == 403) {
        final msg = (res.data is Map && res.data['message'] != null)
            ? res.data['message'].toString()
            : 'غير مسموح بإرسال الإجابات.';
        Get.snackbar('403', msg,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xFFFFE6E6));
        return;
      }

      if (status >= 200 && status < 300) {
        final result =
            ExamSubmitResult.fromRoot(res.data as Map<String, dynamic>);
        submitResult.value = result;

        examCompleted.value = true;
        examStarted.value = false;
        remainingSeconds.value = 0;
        _timer?.cancel();

        await _clearPersistedAttempt(courseId);
        _rebuildAnswerViews();

        Get.snackbar('تم التصحيح', 'النتيجة: ${result.score}',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        final msg = (res.data is Map && res.data['message'] != null)
            ? res.data['message'].toString()
            : 'فشل إرسال الإجابات.';
        Get.snackbar('خطأ', 'HTTP $status — $msg',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xFFFFE6E6));
      }
    } catch (e) {
      Get.snackbar('خطأ', 'استثناء أثناء إرسال الإجابات: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFFFFE6E6));
    } finally {
      submitLoading.value = false;
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      if (remainingSeconds.value <= 0) {
        remainingSeconds.value = 0;
        _timer?.cancel();
        examStarted.value = false;
      } else {
        remainingSeconds.value = remainingSeconds.value - 1;
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  String formatRemaining() {
    final s = remainingSeconds.value;
    final m = s ~/ 60;
    final r = s % 60;
    final mm = m.toString().padLeft(2, '0');
    final ss = r.toString().padLeft(2, '0');
    return '$mm:$ss';
  }

  void _rebuildAnswerViews() {
    answerViewsByQid.clear();
    final exam = currentExam.value;
    if (exam == null) return;

    final details = submitResult.value?.details ?? [];

    AnswerDetail? _findDetailFor(ExamQuestion q) {
      for (final d in details) {
        if (d.questionId == q.id) return d;
      }
      for (final d in details) {
        if ((d.questionText.trim()) == (q.questionText.trim())) return d;
      }
      return null;
    }

    String? _studentTextFromChoice(ExamQuestion q, int? selectedId) {
      if (selectedId == null) return null;
      for (final c in q.choices) {
        if (c.id == selectedId) return c.choiceText;
      }
      return null;
    }

    String _norm(String s) => s.replaceAll(RegExp(r'\s+'), '').trim();

    for (final q in exam.questions) {
      final selectedId = selectedChoiceByQid[q.id];
      final d = _findDetailFor(q);

      final studentText =
          d?.studentChoice ?? _studentTextFromChoice(q, selectedId);
      final correctText = d?.correctChoice;

      bool? isCorrect = d?.isCorrect;
      if (isCorrect == null) {
        if (studentText != null && correctText != null) {
          isCorrect = _norm(studentText) == _norm(correctText);
        }
      }

      answerViewsByQid[q.id] = AnswerView(
        questionId: q.id,
        questionText: q.questionText,
        studentChoiceText: studentText,
        correctChoiceText: correctText,
        // isCorrect: isCorrect,
      );
    }

    answerViewsByQid.refresh();
  }
}
