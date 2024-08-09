import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_kitchen_jobs/Model/ProfileModels/LoginModels/login_model.dart';

import 'package:my_kitchen_jobs/main.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  LoginModel? _loginRes;
  LoginModel? get loginRes => _loginRes;

  loginApi(String email, String password) async {
    try {
      isLoading.value = true;
      final requestBody = json.encode({"email": email, "password": password});

      http.Response res = await http.post(
        Uri.parse('${homeC.baseUrl}/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );
      if (res.statusCode == 200) {
        var responseData = json.decode(res.body);
        _loginRes = LoginModel.fromJson(responseData);

        if (_loginRes?.token != null) {
          await homeC.setToken(_loginRes?.token.toString());
        }
      } else {
        Get.snackbar('Error', 'Failed to login');
      }
      Get.snackbar('Login', '${_loginRes?.title}');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
