import 'dart:developer';
import 'package:e_store/features/cart/view_model/cart_view_model.dart';
import 'package:e_store/features/checkout/view/payment_status_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentViewModel {
  final Razorpay _razorpay = Razorpay();

  void intiateRazorPay() {
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log(response.toString());
  }

  double convertToPaisa(double amountInINR) {
    return (amountInINR * 100);
  }

  void openSession(
      {required num amount,
      required String orderId,
      required String userName,
      required BuildContext context}) {
    double amoutinpaisa = convertToPaisa(amount.toDouble());
    var options = {
      'currency': 'INR',
      'key': "rzp_test_7gpnIfVXLscseE",
      'amount': amoutinpaisa,
      'name': userName,
      'description': 'Description for order',
      'retry': {'enabled': true, 'max_count': 3},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
        (PaymentSuccessResponse response) {
      context.read<CartViewModel>().clearCart();
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: const PaymentResultScreen(isSuccess: true),
        ),
      );
    });

    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
        (PaymentFailureResponse response) {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: const PaymentResultScreen(isSuccess: false),
        ),
      );
    });

    try {
      intiateRazorPay();
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
