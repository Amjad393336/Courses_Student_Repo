// // lib/app/controllers/wallet_controller.dart

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../Model/balance_model.dart';

// class WalletController extends GetxController {
//   final Dio _dio = Dio();
//   final _isLoading = false.obs;
//   final _balance = ''.obs;

//   bool get isLoading => _isLoading.value;
//   String get balance => _balance.value;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchBalance();
//   }

//   Future<void> fetchBalance() async {
//     _isLoading.value = true;

//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? 'Bearer';

//       if (token.isEmpty) {
//         _isLoading.value = false;
//         Get.snackbar(
//           'Error',
//           'No token found. Please log in.',
//           backgroundColor: Colors.red
//         );
//         return;
//       }

//       final response = await _dio.get(
//         'http://192.168.1.16:8000/api/wallet/student/balance',
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': '$tokenType $token',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         final model = BalanceModel.fromJson(response.data as Map<String, dynamic>);
//         _balance.value = model.balance;
//       } else {
//         final msg = response.data['message'] as String? ?? 'Unknown error';
//         Get.snackbar(
//           'Error ${response.statusCode}',
//           msg,
//           backgroundColor: Colors.red

//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] as String? ?? 'Connection error';
//       Get.snackbar(
//         'Error',
//         msg,
//         backgroundColor: Colors.red

//       );
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Unexpected error: $e',
//           backgroundColor: Colors.red

//       );
//     } finally {
//       _isLoading.value = false;
//     }
//   }
// }
// lib/app/controllers/wallet_controller.dart

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../Model/balance_model.dart';
// import '../View/Login_Student.dart'; // تأكد أنّ المسار صحيح إلى صفحتك Login

// class WalletController extends GetxController {
//   final Dio _dio = Dio();
//   final _isLoading = false.obs;
//   final _balance = ''.obs;

//   bool get isLoading => _isLoading.value;
//   String get balance => _balance.value;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchBalance();
//   }

//   Future<void> fetchBalance() async {
//     _isLoading.value = true;

//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final refreshToken = prefs.getString('refresh_token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? 'Bearer';

//       // في حال لم نعثر على token (أو حتى refresh_token فارغ)، نعيد المستخدم إلى Login مباشرةً
//       if (token.isEmpty&&refreshToken.isEmpty) {
//         _isLoading.value = false;
//         Get.snackbar(
//           'Error',
//           'Please Login First',
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//         // ننقل المستخدم لواجهة Login ونمسح جميع الشاشات السابقة
//         Get.offAll(() => const Login());
//         return;
//       }

//       final response = await _dio.get(
//         'http://192.168.1.16:8000/api/wallet/student/balance',
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': '$tokenType $token',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         final model = BalanceModel.fromJson(response.data as Map<String, dynamic>);
//         _balance.value = model.balance;
//       } else {
//         final msg = (response.data['message'] as String?) ?? 'خطأ غير معروف';
//         Get.snackbar(
//           'Error ${response.statusCode}',
//           msg,
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] as String? ?? 'خطأ في الاتصال';
//       Get.snackbar(
//         'خطأ',
//         msg,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } catch (e) {
//       Get.snackbar(
//         'خطأ',
//         'حدث خطأ غير متوقع: $e',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       _isLoading.value = false;
//     }
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/balance_model.dart';
import '../View/Login_Student.dart'; // تأكد أن المسار صحيح لصفحة Login

class WalletController extends GetxController {
  final Dio _dio = Dio();
  final _isLoading = false.obs;
  final _balance = ''.obs;

  bool get isLoading => _isLoading.value;
  String get balance => _balance.value;

  @override
  void onInit() {
    super.onInit();
    fetchBalance();
  }

  /// دالة مساعدة: تعرض رسالة، تنظّف التوكينات، ثم تنتقل لواجهة تسجيل الدخول بشكل مؤكّد
  Future<void> _goToLogin(String message) async {
    // اغلاق أي سنackbar مفتوحة أولًا (لتجنب منع التنقل)
    Get.closeAllSnackbars();

    // تنظيف التوكينات قبل الانتقال
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('token_type');
    await prefs.remove('refresh_token');

    // عرض رسالة قصيرة تحت
    Future.microtask(() {
      Get.snackbar(
        'Error',
        message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    });

    // أعطِ إطارًا واحدًا/لحظة للنظام لإنهاء أي Build/SnackBar ثم انتقل
    await Future.delayed(const Duration(milliseconds: 120));

    // الانتقال المؤكّد لواجهة تسجيل الدخول ومسح المكدّس
    if (Get.isOverlaysOpen) {
      // إغلاق أي حوارات/BottomSheets قد تعيق التنقل
      Get.back(closeOverlays: true);
      await Future.delayed(const Duration(milliseconds: 50));
    }
    Get.offAll(() => const Login());
  }

  Future<void> fetchBalance() async {
    _isLoading.value = true;

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';
      final refreshToken = prefs.getString('refresh_token') ?? '';
      final tokenType = prefs.getString('token_type') ?? 'Bearer';

      // إذا لم نعثر على توكن ولا على توكن التحديث، نعيد المستخدم إلى صفحة تسجيل الدخول
      if (token.isEmpty && refreshToken.isEmpty) {
        _isLoading.value = false;
        await _goToLogin('You Must Login First');
        return;
      }

      final response = await _dio.get(
        'http://192.168.1.5:8000/api/wallet/student/balance',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': '$tokenType $token',
          },
          validateStatus: (_) => true, // حتى نقرأ رسائل السيرفر في غير 200
        ),
      );

      // التعامل مع 401 مباشرة
      if (response.statusCode == 401) {
        _isLoading.value = false;
        await _goToLogin('Session expired, please login.');
        return;
      }

      if (response.statusCode == 200) {
        final model =
            BalanceModel.fromJson(response.data as Map<String, dynamic>);
        _balance.value = model.balance;
      } else {
        // هنا نتفحص الرسالة العائدة من الـ API
        final serverMsg = (response.data is Map
                ? response.data['message']
                : null) as String? ??
            'خطأ غير معروف';

        // إذا كانت الرسالة تفيد بأن المستخدم ليس طالباً
        if (serverMsg == 'هذا المستخدم ليس طالبًا.') {
          _isLoading.value = false;
          await _goToLogin('You Must Login First');
          return;
        } else {
          // بصيغ أخرى من الأخطاء نعرض Snackbar فقط
          Get.snackbar(
            'Error ${response.statusCode}',
            serverMsg,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } on DioException catch (e) {
      final msg = (e.response?.data is Map ? e.response?.data['message'] : null)
              as String? ??
          'Connection Error';
      // في حال 401 من داخل DioException
      if (e.response?.statusCode == 401) {
        _isLoading.value = false;
        await _goToLogin('Session expired, please login.');
        return;
      }
      Get.snackbar(
        'Error',
        msg,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'UnExpected Error $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _isLoading.value = false;
    }
  }
}
