import 'package:e_store/features/home/view/home_view.dart';
import 'package:e_store/res/constants/app_colors.dart';
import 'package:e_store/res/widgets/appbar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

class PaymentResultScreen extends StatelessWidget {
  final bool isSuccess;

  const PaymentResultScreen({super.key, required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Result'),
        leading: AppbarIcons(
          function: () {
            Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: const HomeScreenView(),
                ),
                (route) => false);
          },
          icons: IconlyBold.arrowLeft,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSuccess ? Icons.check_circle_outline : Icons.error_outline,
              color: isSuccess ? Colors.green : Colors.red,
              size: 100.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              isSuccess ? 'Payment Successful' : 'Payment Failed',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: isSuccess ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
               style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightIconsColor,
                    ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const HomeScreenView(),
                  ),
                  (route) => false,
                );
              },
              child: const Text('Back to Home',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
