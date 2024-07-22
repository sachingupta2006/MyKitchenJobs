import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:my_kitchen_jobs/main.dart';

class VerifyOtpController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void loading() {
    _isLoading = !_isLoading;
    update();
  }

  Future<void> verifyApi(String otp, String token) async {
    try {
      loading();
      final requestBody = json.encode({
        "otp": otp,
      });

      http.Response res = await http.post(
        Uri.parse('${homeC.baseUrl}/users/verify_otp'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: requestBody,
      );

      if (res.statusCode == 200) {
        var responseData = json.decode(res.body);
        // Handle successful verification
        Get.snackbar('Success', 'OTP verified and login successful');
      } else {
        // Handle errors, for example:
        Get.snackbar('Error', 'Failed to verify OTP');
      }
    } catch (e) {
      // Handle exceptions, for example:
      Get.snackbar('Error', e.toString());
    } finally {
      loading();
    }
  }
}
