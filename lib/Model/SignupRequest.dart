class SignupRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String country;
  final String city;
  final String gender;
  final String role;
  final String dateOfBirth;

  SignupRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.country,
    required this.city,
    required this.gender,
    required this.role,
    required this.dateOfBirth,
  });

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'phone': phone,
        'country': country,
        'city': city,
        'gender': gender,
        'role': role,
        'date_of_birth': dateOfBirth,
      };
}
