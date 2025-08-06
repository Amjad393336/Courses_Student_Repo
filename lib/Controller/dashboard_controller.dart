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
// // //       final response = await _dio.get('http://192.168.1.5:8000/api/categories');
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
// //       final response = await _dio.get('http://192.168.1.5:8000/api/categories');
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
// //         'http://192.168.1.5:8000/api/courses/byTeacher',
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
// //       final response = await _dio.get('http://192.168.1.5:8000/api/categories');
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
// //         'http://192.168.1.5:8000/api/courses/byTeacher',
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
// //         'http://192.168.1.5:8000/api/courses/byName',
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
// //       final response = await _dio.get('http://192.168.1.5:8000/api/categories');
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
// //           'http://192.168.1.5:8000/api/courses/byTeacher',
// //           data: {'teacher_name': value},
// //           options: Options(headers: {'Accept': 'application/json'}),
// //         );
// //       } else {
// //         res = await _dio.post(
// //           'http://192.168.1.5:8000/api/courses/byName',
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
//       final response = await _dio.get('http://192.168.1.5:8000/api/categories');
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
//         'http://192.168.1.5:8000/api/courses/byTeacher',
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
//           'http://192.168.1.5:8000/api/courses/byName',
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
//       final response = await _dio.get('http://192.168.1.5:8000/api/categories');
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
//         'http://192.168.1.5:8000/api/courses/byTeacher',
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
//           'http://192.168.1.5:8000/api/courses/byName',
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
//           'http://192.168.1.5:8000/api/courses/byCategory',
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
//       final response = await _dio.get('http://192.168.1.5:8000/api/categories');
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
//           'http://192.168.1.5:8000/api/courses/byCategory/$categoryId',
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
//         'http://192.168.1.5:8000/api/courses/byTeacher',
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
//           'http://192.168.1.5:8000/api/courses/byName',
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
//           'http://192.168.1.5:8000/api/courses/byCategory',
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
//       final response = await _dio.get('http://192.168.1.5:8000/api/categories');
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
//         'http://192.168.1.5:8000/api/courses/byTeacher',
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
//           'http://192.168.1.5:8000/api/courses/byName',
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
//           'http://192.168.1.5:8000/api/courses/byCategory',
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

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:project_2/Model/category_model.dart';

import 'package:project_2/View/Login_Student.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/course-model.dart';

class DashboardController extends GetxController {
  final dio.Dio _dio = dio.Dio();

  var isLoading = false.obs;
  var categories = <Category>[].obs;
  var coursesBySearch = <Course>[].obs;
  var coursesByCategory = <Course>[].obs;
  var noResults = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;
    coursesBySearch.clear();
    try {
      final response = await _dio.get('http://192.168.1.5:8000/api/categories');
      final data = response.data['data'] as List<dynamic>;
      categories.value = data.map((e) => Category.fromJson(e)).toList();
      noResults.value = categories.isEmpty;
    } catch (e) {
      Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تحميل الفئات: $e'));
      noResults.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  // جلب الكورسات حسب التصنيف بالآي دي:
  Future<void> fetchCoursesByCategoryId(int categoryId) async {
    isLoading.value = true;
    coursesByCategory.clear();
    noResults.value = false;
    try {
      final response = await _dio.get('http://192.168.1.5:8000/api/courses/byCategory/$categoryId');
      if (response.data['status'] == 'success' && response.data['data'] is List) {
        coursesByCategory.value = (response.data['data'] as List).map((e) => Course.fromJson(e)).toList();
      } else {
        coursesByCategory.clear();
        noResults.value = true;
      }
    } catch (e) {
      Future.microtask(() => Get.snackbar('خطأ', 'تعذر جلب الكورسات: $e'));
      coursesByCategory.clear();
      noResults.value = true;
    } finally {
      isLoading.value = false;
    }
  }
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
      dio.Response resTeacher = await _dio.post(
        'http://192.168.1.5:8000/api/courses/byTeacher',
        data: {'teacher_name': value},
        options: dio.Options(headers: {'Accept': 'application/json'}),
      );
      List<Course> results = [];
      if (resTeacher.data['status'] == 'success' && resTeacher.data['data'] is List) {
        results = (resTeacher.data['data'] as List)
            .map((e) => Course.fromJson(e)).toList();
      }

      if (results.isEmpty) {
        dio.Response resCourse = await _dio.post(
          'http://192.168.1.5:8000/api/courses/byName',
          data: {'course_name': value},
          options: dio.Options(headers: {'Accept': 'application/json'}),
        );
        if (resCourse.data['status'] == 'success' && resCourse.data['data'] is List) {
          results = (resCourse.data['data'] as List)
              .map((e) => Course.fromJson(e)).toList();
        }
      }

      if (results.isEmpty) {
        dio.Response resCategory = await _dio.post(
          'http://192.168.1.5:8000/api/courses/byCategory',
          data: {'category_name': value},
          options: dio.Options(headers: {'Accept': 'application/json'}),
        );
        if (resCategory.data['status'] == 'success' && resCategory.data['data'] is List) {
          results = (resCategory.data['data'] as List)
              .map((e) => Course.fromJson(e)).toList();
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

  void clearCourseSearch() {
    coursesBySearch.clear();
    noResults.value = false;
    fetchCategories();
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
      Future.microtask(() => Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج: $e'));
    } finally {
      isLoading.value = false;
    }
  }


}


