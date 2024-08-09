import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  String baseUrl = 'https://api.mykitchenjobs.com';

  logout() {}

  var token = ''.obs;

  setToken(String? value) {
    token.value = value ?? '';
    saveToken(value);
  }

  // Method to save the token to SharedPreferences
  saveToken(String? recevedToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (recevedToken != 'null') {
      await prefs.setString('token', recevedToken!);
    } else {
      await prefs.remove('token');
    }
  }

  loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    loadToken();
  }
}
