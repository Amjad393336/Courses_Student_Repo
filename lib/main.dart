// main.dart
import 'package:flutter/material.dart';

import 'package:project_2/View/Login_Student.dart';
import 'package:project_2/View/Logout_Confirming.dart';
import 'package:project_2/View/Sign_Up_Student.dart';
import 'package:project_2/View/dashboard_student.dart';


void main(){
  // WidgetsFlutterBinding.ensureInitialized(); // تأكد من تهيئة Flutter
  // final authService = AuthService(); // إنشاء instance من خدمة المصادقة
  
  // التحقق من وجود token عند بدء التشغيل
  //final isLoggedIn = await authService.hasValidToken(); 
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
      // توجيه المستخدم بناءً على حالة تسجيل الدخول
    
      home: Student_Dashboard(),
      debugShowCheckedModeBanner: false,
  
    );
  }
}
