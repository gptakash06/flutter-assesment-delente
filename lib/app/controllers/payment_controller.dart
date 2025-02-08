
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../utils/helpers/snackbar_helper.dart';

class PaymentController extends GetxController {
  late Razorpay _razorpay;
  var paymentStatus = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  /// **1. Razorpay Payment Function**
  void startRazorpayPayment({required int amount}) {
    isLoading.value = true;
    var options = {
      'key': 'rzp_test_R6kTbu0ZHx9zNg', // Use your Razorpay API Key
      'amount': amount * 100, // Amount in paise
      'name': 'Flutter Assessment',
      'description': 'Payment for Service',
      'prefill': {
        'contact': '8423918114',
        'email': 'user@example.com',
      },
      'theme': {'color': '#3399cc'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      Get.snackbar('Error', 'Payment failed. Try again.', snackPosition: SnackPosition.BOTTOM);
      isLoading.value = false;
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    paymentStatus.value = 'Payment Successful: ${response.paymentId}';
    SnackbarHelper.showSuccess('Payment completed successfully!');
    isLoading.value = false;
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    paymentStatus.value = 'Payment Failed: ${response.message}';
    SnackbarHelper.showError('Payment failed: ${response.message}');
    isLoading.value = false;
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    paymentStatus.value = 'External Wallet: ${response.walletName}';
    Get.snackbar('Wallet', 'Payment using: ${response.walletName}', snackPosition: SnackPosition.BOTTOM);
    isLoading.value = false;
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }


}
