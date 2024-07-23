import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  String baseUrl = 'https://api.mykitchenjobs.com';

  // Private variable to store the token
  String? _token;

  // Getter method for the token
  String? get token => _token;

  // Setter method for the token
  set setToken(String? value) {
    _token = value;
    saveToken(value);
  }

  // Method to load the token from SharedPreferences
  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
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

  // Override the onInit method to load the token when the controller is initialized
  @override
  void onInit() {
    super.onInit();
    loadToken();
  }
}
