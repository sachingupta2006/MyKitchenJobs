import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:my_kitchen_jobs/Modal/user_forgot_model.dart';
import 'package:my_kitchen_jobs/main.dart';

class ForgotController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void loading() {
    _isLoading = !_isLoading;
    update();
  }

  ForgotPasswordModel? _forgot;
  ForgotPasswordModel? get forgotData => _forgot;

  String? _token;
  String? get token => _token;

  Future<void> forgotApi(String email) async {
    try {
      loading();
      final requestBody = json.encode({
        "email": email,
      });

      http.Response res = await http.post(
        Uri.parse('${homeC.baseUrl}/users/forgot_password'),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      if (res.statusCode == 200) {
        var responseData = json.decode(res.body);
        _forgot = ForgotPasswordModel.fromJson(responseData);

        // Assuming the token is part of the response data
        if (responseData['token'] != null) {
          _token = responseData['token'];
        }

        Get.snackbar('Success', _forgot?.title ?? 'Request successful');
      } else {
        // Handle errors, for example:
        Get.snackbar('Error', 'Failed to send request');
      }
    } catch (e) {
      // Handle exceptions, for example:
      Get.snackbar('Error', e.toString());
    } finally {
      loading();
    }
  }
}
