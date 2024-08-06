import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Model/HomeModels/StaffModels/get_staff_data_model.dart';
import 'package:my_kitchen_jobs/main.dart';

class GetStaffController extends GetxController {
  // Observable for loading state
  final _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  // Observable for chefs data
  final _chefs = Rx<ChefsModel?>(null);
  Rx<ChefsModel?> get chefsData => _chefs;

  @override
  void onInit() {
    super.onInit();
    getApi(); // Fetch data when controller is initialized
  }

  // Method to fetch data from the API
  Future<void> getApi() async {
    _setLoading(true); // Set loading state to true

    try {
      // Make an HTTP GET request to the API
      http.Response res = await http.get(
        Uri.parse('${homeC.baseUrl}/chefs'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        // Parse the response body as JSON
        var responseData = json.decode(res.body);

        // Create a ChefsModel instance from the parsed JSON data
        _chefs.value = ChefsModel.fromJson(responseData);
      } else {
        // Display an error message using Get.snackbar
        Get.snackbar("Error", "Error ${res.statusCode}: ${res.reasonPhrase}");
      }
    } catch (e) {
      // Handle exceptions and display an error message
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      _setLoading(false); // Set loading state to false
    }
  }

  // Method to toggle the loading state
  void _setLoading(bool value) {
    _isLoading.value = value;
  }
}
