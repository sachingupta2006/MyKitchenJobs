import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:my_kitchen_jobs/Modal/user_forgot_model.dart';
import 'package:my_kitchen_jobs/main.dart';

class ForgotController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  loading() {
    _isLoading = !_isLoading;
    update();
  }

  ForgotPasswordModel? _forgot;
  ForgotPasswordModel? get forgotData => _forgot;

  forgotApi(
    String email,
  ) async {
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
      } else {
        // Handle errors, for example:
        Get.snackbar('Error', 'Failed to login');
      }
      Get.snackbar('', '${_forgot?.title}');
    } catch (e) {
      // Handle exceptions, for example:
      Get.snackbar('error', e.toString());
    } finally {
      loading();
    }
  }
}
