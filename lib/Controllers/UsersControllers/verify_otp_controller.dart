import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:my_kitchen_jobs/main.dart';
import 'package:my_kitchen_jobs/Modal/UsersModal/verify_otp_model.dart'; // Ensure this import is correct

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

      final requestBody = json.encode({"otp": otp});

      http.Response res = await http.post(
        Uri.parse('${homeC.baseUrl}/users/verify_otp'),
        headers: {
          'Content-Type': 'application/json',
          'token': token,
        },
        body: requestBody,
      );

      if (res.statusCode == 200) {
        final response = json.decode(res.body);

        // Use VerifyOtpModel to parse the response
        VerifyOtpModel verifyOtpModel = VerifyOtpModel.fromJson(response);

        if (verifyOtpModel.token != null) {
          String newToken = verifyOtpModel.token!;

          await homeC.saveToken(newToken);
          // Store the new token

          Get.snackbar('Success', 'OTP verified and login successful');
        } else {
          Get.snackbar('Error', 'Token not found in response');
        }
      } else {
        Get.snackbar('Error', 'Failed to verify OTP');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error: $e');
    } finally {
      loading();
    }
  }
}
