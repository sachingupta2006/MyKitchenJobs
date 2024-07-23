import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:my_kitchen_jobs/Modal/user_signup_model.dart';
import 'package:my_kitchen_jobs/main.dart';

class SignupControllers extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void loading() {
    _isLoading = !_isLoading;
    update();
  }

  SignupModel? _sign;
  SignupModel? get signupData => _sign;

  Future<void> signupApi(
    String name,
    String email,
    String phoneNo,
    String state,
    String password,
    String cpassword,
    String type,
  ) async {
    try {
      loading();
      final requestBody = json.encode({
        "name": name,
        "email": email,
        "phone_no": phoneNo,
        "location": state,
        "password": password,
        "cpassword": cpassword,
        "type": type,
      });

      final response = await http.post(
        Uri.parse('${homeC.baseUrl}/users/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      final responseData = json.decode(response.body);
      if (response.statusCode == 200 && responseData['error'] == false) {
        _sign = SignupModel.fromJson(responseData);
        Get.snackbar('Success', 'Signup successful');
      } else {
        _sign = SignupModel.fromJson(responseData);
        if (_sign?.error == true && _sign?.errors?.errorDetails != null) {
          for (var error in _sign!.errors!.errorDetails!) {
            Get.snackbar('Error', error.msg ?? 'Validation error');
          }
        } else {
          Get.snackbar('Error', _sign?.title ?? 'Signup failed');
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      loading();
    }
  }
}
