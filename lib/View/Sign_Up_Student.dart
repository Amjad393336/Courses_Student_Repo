import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:project_2/View/dashboard_student.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final Dio _dio = Dio();
  bool _isLoading = false;

  // Controllers for all fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  Future<void> _registerUser() async {
    // Check if all fields are filled
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _countryController.text.isEmpty ||
        _cityController.text.isEmpty ||
        _genderController.text.isEmpty ||
        _roleController.text.isEmpty ||
        _dobController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content:Text('Please Fill All fields'),
        duration: Duration(seconds: 10),
        backgroundColor: Colors.red,
        )
        // 'Error!',
        // 'Please fill all fields',
        // backgroundColor: Colors.red,
        // colorText: Colors.white,
        // duration: const Duration(seconds: 3),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await _dio.post(
        'http://192.168.1.16:8000/api/student/register',
        data: {
          "first_name": _firstNameController.text,
          "last_name": _lastNameController.text,
          "email": _emailController.text,
          "password": _passwordController.text,
          "phone": _phoneController.text,
          "country": _countryController.text,
          "city": _cityController.text,
          "gender": _genderController.text,
          "role": _roleController.text,
          "date_of_birth": _dobController.text,
        },
        options: Options(
          headers: {
            "Accept": "application/json",
          },
          validateStatus: (status) => status! < 500,
        ),
      );

      if (response.statusCode == 201||response.statusCode==201) {
       ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful'),
            backgroundColor: Colors.green,
          ),
          );
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Student_Dashboard()));
      } else {
        String errorMessage = response.data['message'] ?? 'Unknown error occurred';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
        );
      }
    } on DioException catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'Connection Error';
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'images/signup.jpg',
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),

                  // First Name
                  TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      labelText: "First Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Last Name
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      labelText: "Last Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Email
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Phone
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Phone",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Country
                  TextFormField(
                    controller: _countryController,
                    decoration: const InputDecoration(
                      labelText: "Country",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.flag),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // City
                  TextFormField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      labelText: "City",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_city),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Gender
                  TextFormField(
                    controller: _genderController,
                    decoration: const InputDecoration(
                      labelText: "Gender",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_pin),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Role
                  TextFormField(
                    controller: _roleController,
                    decoration: const InputDecoration(
                      labelText: "Role",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.work),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Date of Birth
                  TextFormField(
                    
                    controller: _dobController,
                    decoration: const InputDecoration(
                      labelText: "Date of Birth",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.date_range)
                    )),
                  
                  const SizedBox(height: 25),

                  // Sign Up Button
                  ElevatedButton(
                    onPressed: _isLoading ? null : _registerUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 5,
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.7),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
