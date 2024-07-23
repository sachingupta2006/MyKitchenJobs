import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_kitchen_jobs/Modal/login_model.dart';
import 'package:my_kitchen_jobs/View/home_page.dart';
import 'package:my_kitchen_jobs/View/kitchen_category_screen.dart';

import 'package:my_kitchen_jobs/main.dart';

class LoginController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  loading() {
    _isLoading = !_isLoading;
    update();
  }

  LoginModel? _login;
  LoginModel? get loginData => _login;

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
        _login = LoginModel.fromJson(responseData);

        String? token = responseData['token'];
        if (token != null) {
          homeC.saveToken(token);
          Get.to(() => const HomePage());
        }
      } else {
        Get.snackbar('Error', 'Failed to login');
      }
      Get.snackbar('Login', '${_login?.title}');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      loading();
    }
  }
}
