class AuthResponse {
  final String token;
  final String refreshToken;
  final String tokenType;

  AuthResponse({
    required this.token,
    required this.refreshToken,
    required this.tokenType,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return AuthResponse(
      token: data['token'] as String,
      refreshToken: data['refresh_token'] as String,
      tokenType: data['token_type'] as String,
    );
  }
}
