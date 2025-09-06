// // lib/app/controllers/wallet_controller.dart

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Model/charge_Wallet.dart';
// import 'package:project_2/View/wallet_view.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../Model/balance_model.dart';

// class ChargeWalletController extends GetxController {
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
//         Get.snackbar(
//           'Error',
//           'No token found. Please log in.',
//           backgroundColor: Colors.red

//         );
//         _isLoading.value = false;
//         return;
//       }

//       final resp = await _dio.get(
//         'http://192.168.1.16:8000/api/wallet/student/balance',
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': '$tokenType $token',
//           },
//         ),
//       );

//       if (resp.statusCode == 200) {
//         final model = BalanceModel.fromJson(resp.data as Map<String, dynamic>);
//         _balance.value = model.balance;
//       } else {
//         final msg = (resp.data['message'] as String?) ?? 'Unknown error';
//         Get.snackbar(
//           'Error ${resp.statusCode}',
//           msg,
//           backgroundColor: Colors.red

//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] as String? ?? 'Connection error';
//       Get.snackbar(
//         'Error',
//         msg,
//           backgroundColor: Colors.red

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

//   Future<void> chargeBalance(String amountText) async {
//     final q = amountText.trim();
//     if (q.isEmpty) {
//       // إذا الحقل فارغ، لا نُغير isLoading (يبقى false) ونُظهر Snackbar
//       Get.snackbar(
//         'Validation',
//         'Please enter an amount.',
//         backgroundColor: Colors.red,
//       );
//       return;
//     }

//     final double? amount = double.tryParse(q);
//     if (amount == null || amount <= 0) {
//       Get.snackbar(
//         'Validation',
//         'Enter a valid positive number.',
//         backgroundColor: Colors.red,
//       );
//       return;
//     }

//     // الآن نجعل isLoading = true لكي تظهر الحلقة الدوّارة
//     _isLoading.value = true;

//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? 'Bearer';

//       if (token.isEmpty) {
//         Get.snackbar('Error', 'No token found. Please log in.', backgroundColor: Colors.red);
//         _isLoading.value = false;
//         return;
//       }

//       final resp = await _dio.post(
//         'http://192.168.1.16:8000/api/wallet/student/charge',
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': '$tokenType $token',
//             'Content-Type': 'application/json',
//           },
//         ),
//         data: {'amount': q},
//       );

//       if (resp.statusCode == 200 || resp.statusCode == 201) {
//         final data = resp.data;
//         if (data is Map && data.containsKey('balance')) {
//           // حدّث الـ balance
//           _balance.value = data['balance'].toString();

//           // أرجع للخلف (WalletView) بعد الشحن
//           Get.back();

//           // أظهر رسالة نجاح
//           Get.snackbar(
//             'Success',
//             data['message'] ?? 'Charge successful.',
//             backgroundColor: Colors.green,
//           );
//         } else {
//           Get.snackbar(
//             'Warning',
//             'Charge succeeded but no new balance returned.',
//             backgroundColor: Colors.orange,
//           );
//         }
//       } else {
//         final msg = (resp.data is Map && resp.data['message'] != null)
//             ? resp.data['message']
//             : 'Charge failed.';
//         Get.snackbar('Error ${resp.statusCode}', msg.toString(), backgroundColor: Colors.red);
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'Connection error';
//       Get.snackbar('Error', msg, backgroundColor: Colors.red);
//     } catch (e) {
//       Get.snackbar('Error', 'Unexpected error: $e', backgroundColor: Colors.red);
//     } finally {
//       // في كلّ الأحوال، نوقف حلقة الدوّارة
//       _isLoading.value = false;
//     }
//   }

// }
// lib/app/controllers/charge_wallet_controller.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/View/Login_Student.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/balance_model.dart';

class ChargeWalletController extends GetxController {
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

  Future<void> fetchBalance() async {
    _isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';
      final tokenType = prefs.getString('token_type') ?? 'Bearer';

      if (token.isEmpty) {
        _isLoading.value = false;
        Get.snackbar(
          'Error',
          'Please Login First',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        // ننقل المستخدم لواجهة Login ونمسح جميع الشاشات السابقة
        Get.offAll(() => const Login());
        return;
      }

      final resp = await _dio.get(
        'http://192.168.1.5:8000/api/wallet/student/balance',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': '$tokenType $token',
          },
        ),
      );

      if (resp.statusCode == 200) {
        final model = BalanceModel.fromJson(resp.data as Map<String, dynamic>);
        _balance.value = model.balance;
      } else {
        final msg = (resp.data['message'] as String?) ?? 'Unknown error';
        Get.snackbar(
          'Error ${resp.statusCode}',
          msg,
          backgroundColor: Colors.red,
        );
      }
    } on DioException catch (e) {
      final msg = e.response?.data['message'] as String? ?? 'Connection error';
      Get.snackbar(
        'Error',
        msg,
        backgroundColor: Colors.red,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Unexpected error: $e',
        backgroundColor: Colors.red,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> chargeBalance(String amountText) async {
    final q = amountText.trim();
    if (q.isEmpty) {
      Get.snackbar(
        'Validation',
        'Please enter an amount.',
        backgroundColor: Colors.red,
      );
      return;
    }

    final double? amount = double.tryParse(q);
    if (amount == null || amount <= 0) {
      Get.snackbar(
        'Validation',
        'Enter a valid positive number.',
        backgroundColor: Colors.red,
      );
      return;
    }

    _isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';
      final tokenType = prefs.getString('token_type') ?? 'Bearer';

      if (token.isEmpty) {
        Get.snackbar(
          'Error',
          'No token found. Please log in.',
          backgroundColor: Colors.red,
        );
        _isLoading.value = false;
        return;
      }

      final resp = await _dio.post(
        'http://192.168.1.5:8000/api/wallet/student/charge',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': '$tokenType $token',
            'Content-Type': 'application/json',
          },
        ),
        data: {'amount': q},
      );

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        final data = resp.data;
        if (data is Map && data.containsKey('balance')) {
          _balance.value = data['balance'].toString();

          // عرض رسالة نجاح
          Get.snackbar(
            'Success',
            data['message'] ?? 'Charge successful.',
            backgroundColor: Colors.green,
          );

          // إرجاع المستخدم إلى شاشة المحفظة
          Get.back();
        } else {
          Get.snackbar(
            'Warning',
            'Charge succeeded but no new balance returned.',
            backgroundColor: Colors.orange,
          );
        }
      } else {
        final msg = (resp.data is Map && resp.data['message'] != null)
            ? resp.data['message']
            : 'Charge failed.';
        Get.snackbar(
          'Error ${resp.statusCode}',
          msg.toString(),
          backgroundColor: Colors.red,
        );
      }
    } on DioException catch (e) {
      final msg = e.response?.data['message'] ?? 'Connection error';
      Get.snackbar(
        'Error',
        msg,
        backgroundColor: Colors.red,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Unexpected error: $e',
        backgroundColor: Colors.red,
      );
    } finally {
      _isLoading.value = false;
    }
  }
}
