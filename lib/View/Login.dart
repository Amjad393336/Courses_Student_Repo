import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/Controller/Login_Controller.dart';
import 'package:project_2/View/Sign_Up.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ربط الكنترولر باستخدام Get.put حتى يتم استخدامه في أي مكان
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // لتفادي مشاكل الارتفاع مع لوحة المفاتيح
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('images/Login.jpg'),

              const SizedBox(height: 7),
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
                 Obx(() {
                return controller.emailError.value.isEmpty
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          controller.emailError.value,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
              }),
              const SizedBox(height: 15),

              // كلمة المرور
              TextFormField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              Obx(() {
                return controller.passwordError.value.isEmpty
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          controller.passwordError.value,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
              }),

             

              

              const SizedBox(height: 15),
             ElevatedButton(
  onPressed: controller.login,
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // خلفية بيضاء
    foregroundColor: Colors.black, // لون النص أسود للتباين
    side: const BorderSide(color: Colors.black87, width: 1.5), // إطار واضح
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16), // حواف ناعمة
    ),
    padding: const EdgeInsets.symmetric(vertical: 16),
    elevation: 3,
    shadowColor: Colors.grey.withOpacity(0.4), // ظل خفيف
  ),
  child: const Text(
    "Login",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.blue),
  ),
  
),
SizedBox(height: 38,),
Row(children: [
  Padding(
    padding: const EdgeInsets.only(left: 25.0),
    child: Text("Don't Have An Account ??" ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
  ),
  SizedBox(width: 7,),
  GestureDetector(
    onTap: (){
      Get.to(SignUpScreen());
    },
    child: Text("Sign_Up",style: TextStyle(color: Colors.blue),))
],)
            ],
          ),
        ),
      ),
    );
  }
}
