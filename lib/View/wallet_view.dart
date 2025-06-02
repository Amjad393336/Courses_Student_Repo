// lib/app/views/wallet_view.dart

// lib/app/views/wallet_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/wallet_controller.dart';

import 'addBalance.dart';  // واجهة شحن الرصيد

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    // أي استدعاء لـ Get.put(WalletController()) يضع فقط الكلاس الصحيح
    final WalletController controller = Get.put(WalletController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wallet',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: Obx(() {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // إذا لم يوجد رصيد
        if (controller.balance.isEmpty) {
          return const Center(
            child: Text(
              'Your Balance is 0.0\$',
              style: TextStyle(fontSize: 18, color: Colors.orange),
            ),
          );
        }

        // عرض الرصيد
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: const Text(
                  'Your Balance is',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${controller.balance}\$',
                style: const TextStyle(fontSize: 24, color: Colors.green),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // الانتقال لصفحة شحن الرصيد
          Get.off(() => const AddBalanceView());
        },
        backgroundColor: Colors.blue.shade300,
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}

