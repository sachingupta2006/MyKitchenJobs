import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:my_kitchen_jobs/Modal/common_model.dart';
import 'package:my_kitchen_jobs/main.dart';

class LoginController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  loading() {
    _isLoading = !_isLoading;
    update();
  }

  CommonModel? _login;
  CommonModel? get loginData => _login;

  loginApi(String email, String password) async {
    try {
      loading();
      final requestBody = json.encode({"email": email, "password": password});

      http.Response res = await http.post(
        Uri.parse('${homeC.baseUrl}/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );
      if (res.statusCode == 200) {
        var responseData = json.decode(res.body);
        _login = CommonModel.fromJson(responseData);
      } else {
        // Handle errors, for example:
        Get.snackbar('Error', 'Failed to login');
      }
      Get.snackbar('qq', '${_login?.title}');
    } catch (e) {
      // Handle exceptions, for example:
      Get.snackbar('error', e.toString());
    } finally {
      loading();
    }
  }
}
