// lib/app/models/charge_response_model.dart

class ChargeWallete {
  final String message;
  final String balance;

  ChargeWallete({
    required this.message,
    required this.balance,
  });

  factory ChargeWallete.fromJson(Map<String, dynamic> json) {
    return ChargeWallete(
      message: json['message'] as String,
      balance: json['balance'] as String,
    );
  }
}
