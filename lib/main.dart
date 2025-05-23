// // // main.dart
// // import 'package:flutter/material.dart';
// //
// // import 'package:project_2/View/Login_Student.dart';
// // import 'package:project_2/View/Logout_Confirming.dart';
// // import 'package:project_2/View/Sign_Up_Student.dart';
// // import 'package:project_2/View/dashboard_student.dart';
// //
// //
// // void main(){
// //
// //
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //
// //       // توجيه المستخدم بناءً على حالة تسجيل الدخول
// //
// //       home: Student_Dashboard(),
// //       debugShowCheckedModeBanner: false,
// //
// //     );
// //   }
// // }
//
// // lib/main.dart
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'View/Login_Student.dart';
// import 'View/Sign_Up_Student.dart';
// import 'View/dashboard_student.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   Future<bool> _hasToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     return token != null && token.isNotEmpty;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Your App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: FutureBuilder<bool>(
//         future: _hasToken(),
//         builder: (context, snapshot) {
//           // still checking
//           if (snapshot.connectionState != ConnectionState.done) {
//             return const Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             );
//           }
//           // if we got a value and it's true, user is logged in
//           final loggedIn = snapshot.data ?? false;
//           return loggedIn
//               ? const Student_Dashboard()
//               : const Login();
//         },
//       ),
//     );
//   }
// }
//

// lib/main.dart
// lib/main.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'View/Login_Student.dart';
import 'View/dashboard_student.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Your App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _opacity;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      //context
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    // Fade-in
    _opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeIn),
    );
    // Scale-up
    _scale = Tween(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut),
    );
    _ctrl.forward();

    Timer(const Duration(seconds: 8), () async {
      final prefs = await SharedPreferences.getInstance();
      final hasToken = (prefs.getString('token') ?? '').isNotEmpty;
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => hasToken
              ? const Student_Dashboard()
              : const Login(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _opacity,
          child: ScaleTransition(
            scale: _scale,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'images/splash.jpg',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
