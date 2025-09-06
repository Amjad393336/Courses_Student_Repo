// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'dashboard_student.dart';
// import 'Sign_Up_Student.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final Dio _dio = Dio();
  
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

  

  

//   Future<void> _loginUser() async {
//     if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please fill all fields'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final response = await _dio.post(
//         'http://192.168.1.16:8000/api/login',
//         data: {
//           'email': _emailController.text,
//           'password': _passwordController.text,
//         },
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Content-Type': 'application/json',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
     

//         Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (ctx) => const Student_Dashboard()),
//         (route) => false,
//       );
//       }
//     } on DioException catch (e) {
//       String errorMessage = e.response?.data['message'] ?? 'Login failed';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(errorMessage),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Image.asset('images/Login.jpg'),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                   labelText: "Email",
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.email),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: "Password",
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.lock),
//                 ),
//               ),
//               const SizedBox(height: 25),
//               ElevatedButton(
//                 onPressed: _isLoading ? null : _loginUser,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue.shade800,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: _isLoading
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : const Text(
//                         'Login',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//               ),
//               const SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Don't have an account? "),
//                   GestureDetector(
//                     onTap: () => Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => const SignUpScreen()),
//                     ),
//                     child: Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         color: Colors.blue.shade800,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



//login with dio
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dashboard_student.dart';
// import 'Sign_Up_Student.dart';

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final Dio _dio = Dio();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   Future<void> _loginUser() async {
//   if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Please fill all fields'),
//         backgroundColor: Colors.red,
//       ),
//     );
//     return;
//   }

//   setState(() => _isLoading = true);

//   try {
//     final response = await _dio.post(
//       'http://192.168.204.182:8000/api/login',
//       data: {
//         'email': _emailController.text,
//         'password': _passwordController.text,
//       },
//       options: Options(
//         headers: {
//           'Accept': 'application/json',
//           'Content-Type': 'application/json',
//         },
//       ),
//     );

//     if (response.statusCode == 200) {
//       final raw = response.data;

//       if (raw is Map<String, dynamic> && raw.containsKey('data')) {
//         final dataMap = raw['data'];
//         if (dataMap is Map<String, dynamic>) {
//           final String? token = dataMap['token'];
//           final String? refreshToken = dataMap['refresh_token'];
//           final String? tokenType = dataMap['token_type']; // مثل "Bearer"

//           if (token != null && tokenType != null) {
//             final prefs = await SharedPreferences.getInstance();
//             await prefs.setString('token', token);
//             await prefs.setString('token_type', tokenType);

//             if (refreshToken != null) {
//               await prefs.setString('refresh_token', refreshToken);
//             }

//             if (mounted) {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (_) => const Student_Dashboard()),
//               );
//             }
//             return;
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Invalid server response: missing token or type'),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           }
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Unexpected response format'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Login failed: HTTP ${response.statusCode}'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   } on DioException catch (e) {
//     final String errorMessage = e.response?.data['message'] ?? 'Login failed';
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(errorMessage),
//         backgroundColor: Colors.red,
//       ),
//     );
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Error: $e'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   } finally {
//     if (mounted) setState(() => _isLoading = false);
//   }
// }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(25),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Image.asset('images/log_in.jpg'),
//             const SizedBox(height: 20),
//             TextFormField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.email),
//               ),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             const SizedBox(height: 15),
//             TextFormField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             const SizedBox(height: 25),
//             ElevatedButton(
//               onPressed: _isLoading ? null : _loginUser,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue.shade300,
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: _isLoading
//                   ? const CircularProgressIndicator(color: Colors.white)
//                   : const Text(
//                       'Login',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//             ),
//             const SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Don't have an account? "),
//                 GestureDetector(
//                   onTap: () => Navigator.of(context).push(
//                     MaterialPageRoute(builder: (_) => const SignUpScreen()),
//                   ),
//                   child: Text(
//                     'Sign Up',
//                     style: TextStyle(
//                       color: Colors.blue.shade800,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/Controller/LoginController.dart';

// شاشة تسجيل الدخول
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ربط واجهة تسجيل الدخول مع LoginController عبر GetX
    final ctrl = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25), // هوامش حول المحتوى
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // صورة في أعلى الشاشة
            Image.asset('images/log_in.jpg'),
            const SizedBox(height: 20),

            // حقل إدخال البريد الإلكتروني
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email), // أيقونة البريد
              ),
              keyboardType: TextInputType
                  .emailAddress, // يظهر لوحة مفاتيح خاصة بالبريد
              // كل ما المستخدم يغيّر النص يتم تحديث قيمة ctrl.email
              onChanged: (v) => ctrl.email.value = v,
            ),
            const SizedBox(height: 15),

            // حقل إدخال كلمة المرور
            TextField(
<<<<<<< HEAD
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock), // أيقونة القفل
              ),
              obscureText:
                  false, // إذا جعلناها true نخفي النص (لإظهار **** بدل كلمة المرور)
              // تحديث قيمة ctrl.password كل ما يكتب المستخدم
=======

              decoration: const InputDecoration(

                  labelText: 'Password', border: OutlineInputBorder(), prefixIcon: Icon(Icons.lock)),
              obscureText: false,
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
              onChanged: (v) => ctrl.password.value = v,
            ),
            const SizedBox(height: 25),

            // زر تسجيل الدخول
            // ملفوف بـ Obx لأنه يعتمد على ctrl.isLoading
            Obx(() => ElevatedButton(
                  // إذا isLoading = true الزر يتعطل
                  onPressed: ctrl.isLoading.value ? null : ctrl.loginUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  // إذا isLoading = true يظهر مؤشر تحميل بدلاً من النص
                  child: ctrl.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                )),
            const SizedBox(height: 30),

            // رابط للانتقال إلى شاشة التسجيل (Sign Up)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: ctrl.goToSignUp, // استدعاء دالة الانتقال للتسجيل
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.blue.shade800,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

