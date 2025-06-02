// lib/app/models/balance_model.dart

class BalanceModel {
  final String message;
  final String balance;

  BalanceModel({
    required this.message,
    required this.balance,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      message: json['message'] as String,
      balance: json['balance'] as String,
    );
  }
}
