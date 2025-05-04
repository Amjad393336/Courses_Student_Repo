

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/Controller/SignUpController.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  // ربط الكنترولر
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('images/signup.jpg'),
              const SizedBox(height: 20),

              // اسم كامل
              TextFormField(
                controller: controller.fullNameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                ),
              ),
              Obx(() {
                return controller.fullNameError.value.isEmpty
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          controller.fullNameError.value,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
              }),
              const SizedBox(height: 15),

              // التخصص
              TextFormField(
                controller: controller.majorController,
                decoration: const InputDecoration(
                  labelText: "Study Major",
                  border: OutlineInputBorder(),
                ),
              ),
              Obx(() {
                return controller.majorError.value.isEmpty
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          controller.majorError.value,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
              }),
              const SizedBox(height: 15),

              // البريد الإلكتروني
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

              // تأكيد كلمة المرور
              TextFormField(
                controller: controller.confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
              ),
              Obx(() {
                return controller.confirmPasswordError.value.isEmpty
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          controller.confirmPasswordError.value,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
              }),
              const SizedBox(height: 20),

              // زر التسجيل
              ElevatedButton(
                onPressed: controller.signUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black87, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 3,
                  shadowColor: Colors.grey.withOpacity(0.4),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
