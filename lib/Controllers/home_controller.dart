import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  String baseUrl = 'https://api.mykitchenjobs.com';

  logout() {}

  String token = '';

  setToken(String? value) {
    token = value ?? '';
    saveToken(value);
  }

  // Method to save the token to SharedPreferences
  Future<void> saveToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token != null) {
      await prefs.setString('token', token);
    } else {
      await prefs.remove('token');
    }
  }

  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    loadToken();
  }
}
