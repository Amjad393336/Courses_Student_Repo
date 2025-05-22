import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:project_2/View/Login_Student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutConfirming extends StatefulWidget {
  const LogOutConfirming({Key? key}) : super(key: key);

  @override
  State<LogOutConfirming> createState() => _LogOutConfirmingState();
}

class _LogOutConfirmingState extends State<LogOutConfirming> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  bool _isLoading = false;
  final Dio _dio = Dio();

  Future<void> _logout() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    final tokenType = prefs.getString('token_type') ?? 'Bearer';

    try {
      final response = await _dio.post(
        'http://192.168.1.16:8000/api/logout',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': '$tokenType $token',
          },
        ),
        data: {
          'name': _nameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
          'password_confirmation': _confirmController.text,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const Login()),
        );
      } else {
        final msg = (response.data['message'] ?? 'Logout failed') as String;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg), backgroundColor: Colors.red),
        );
      }
    } on DioException catch (e) {
      final msg = e.response?.data['message'] ?? 'Logout error';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg), backgroundColor: Colors.red),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.black),
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        //borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Center(
              child: Image.asset(
                'images/log_out.jpg',
                height: 270,
                width: 230,
                fit: BoxFit.cover,
              ),
            ),
            //const SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 
                  //const SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: _inputDecoration('Name', Icons.person),
                    validator: (v) => v!.isEmpty ? 'Required field' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: _inputDecoration('Email', Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) => v!.isEmpty ? 'Required field' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: _inputDecoration('Password', Icons.lock),
                    obscureText: true,
                    validator: (v) => v!.isEmpty ? 'Required field' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _confirmController,
                    decoration: _inputDecoration('Confirm Password', Icons.lock_outline),
                    obscureText: true,
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Required field';
                      if (v != _passwordController.text) return 'Passwords do not match';
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _logout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Logout',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ,color: Colors.white),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
