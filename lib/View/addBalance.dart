// // lib/app/views/add_balance_view.dart
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../Controller/charge_Wallet.dart';
//
//
//
// class AddBalanceView extends StatelessWidget {
//   const AddBalanceView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final ChargeWalletController controller = Get.put(ChargeWalletController());
//     final TextEditingController _amountController = TextEditingController();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Balance'),
//         backgroundColor: Colors.blue.shade300,
//       ),
//       body: Obx(() {
//         if (controller.isLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               const Text(
//                 'Enter amount to charge:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: _amountController,
//                 keyboardType: TextInputType.numberWithOptions(
//                   decimal: true,
//                 ),
//                 decoration: InputDecoration(
//                   labelText: 'Amount (e.g. 10.50)',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   prefixIcon: const Icon(Icons.attach_money),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     controller.chargeBalance(_amountController.text);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue.shade300,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     'Charge',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

// lib/app/views/add_balance_view.dart

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../Controller/charge_Wallet.dart';
// import '../Controller/wallet_controller.dart';



// class AddBalanceView extends StatelessWidget {
//   const AddBalanceView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // نحضّر الـ ChargeWalletController (للشحن) والـ WalletController (للتحديث بعد الشحن)
//     final ChargeWalletController chargeController = Get.put(ChargeWalletController());
//     final WalletController walletController = Get.find<WalletController>();

//     final TextEditingController _amountController = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Balance'),
//         backgroundColor: Colors.blue.shade300,
//       ),
//       body: Obx(() {
//         if (chargeController.isLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               const Text(
//                 'Enter amount to charge:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: _amountController,
//                 keyboardType: const TextInputType.numberWithOptions(decimal: true),
//                 decoration: InputDecoration(
//                   labelText: 'Amount (e.g. 10.50)',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   prefixIcon: const Icon(Icons.attach_money),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     // نُنفِّذ الشحن
//                     await chargeController.chargeBalance(_amountController.text);

//                     // بعد انتهاء الشحن بنجاح (أو حتى في حال رسالة خطأ)، نرجع إلى WalletView:
//                     if (Get.previousRoute != null) {
//                       Get.back();
//                     }

//                     // ثم نجدث رصيد المحفظة في الـ WalletController
//                     await walletController.fetchBalance();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue.shade300,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     'Charge',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
// lib/app/views/add_balance_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/Controller/charge_Wallet.dart';
import 'package:project_2/Controller/wallet_controller.dart';
import 'package:project_2/View/wallet_view.dart';


class AddBalanceView extends StatelessWidget {
  const AddBalanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // نستدعي Controller الخاص بالشحن (ChargeWalletController)
    final ChargeWalletController chargeController = Get.put(ChargeWalletController());
    // نجد الـ WalletController الذي أنشأناه من قبل في WalletView
    final WalletController walletController = Get.find<WalletController>();

    final TextEditingController _amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Balance',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: Obx(() {
        if (chargeController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Enter amount to charge:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Amount (e.g. 10.50)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.attach_money),
                ),
              ),
              const SizedBox(height: 24),
              // زرّ الشحن مع Spinner داخل الزر أثناء isLoading
              Obx(() {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: chargeController.isLoading
                        ? null
                        : () async {
                            // تنفيذ عملية الشحن
                            await chargeController.chargeBalance(_amountController.text);

                            // بعد انتهاء الشحن بنجاح (أو حتى خطأ)، العودة إلى شاشة المحفظة
                            Get.off(WalletView());

                            // تحديث رصيد المحفظة في WalletController
                            await walletController.fetchBalance();
                          },
                          
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: chargeController.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Charge',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                  ),
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}
