import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:my_kitchen_jobs/Modal/verify_otp_model.dart';
import 'package:my_kitchen_jobs/main.dart';

class VerifyOtpController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  loading() {
    _isLoading = !_isLoading;
    update();
  }

  VerifyOtpModel? _verifyOtp;
  VerifyOtpModel? get verifyOtp => _verifyOtp;

  verifyApi(
    String otp,
  ) async {
    try {
      loading();
      final requestBody = json.encode({
        "otp": otp,
      });

      http.Response res = await http.post(
        Uri.parse('${homeC.baseUrl}/users/verify_otp'),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );
      if (res.statusCode == 200) {
        var responseData = json.decode(res.body);
        _verifyOtp = VerifyOtpModel.fromJson(responseData);
      } else {
        // Handle errors, for example:
        Get.snackbar('Error', 'Failed to login');
      }
      Get.snackbar('', '${_verifyOtp?.title}');
    } catch (e) {
      // Handle exceptions, for example:
      Get.snackbar('error', e.toString());
    } finally {
      loading();
    }
  }
}
