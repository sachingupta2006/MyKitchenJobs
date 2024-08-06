import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Model/HomeModels/StaffModels/get_staff_details_model.dart';
import 'package:my_kitchen_jobs/main.dart';

class GetStaffDetailsController extends GetxController {
  // Observable for loading state
  final _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  // Observable for chef details data
  final _chefsDetails = Rx<ChefsDetailsModel?>(null);
  Rx<ChefsDetailsModel?> get chefsData => _chefsDetails;

  // Method to fetch data from the API
  Future<void> getChefApi(String chefId) async {
    _setLoading(true); // Set loading state to true

    try {
      // Make an HTTP GET request to the API with chefId as a query parameter
      http.Response res = await http.get(
        Uri.parse('${homeC.baseUrl}/chefs/details?id=$chefId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        // Parse the response body as JSON
        var responseData = json.decode(res.body);

        // Create a ChefsDetailsModel instance from the parsed JSON data
        _chefsDetails.value = ChefsDetailsModel.fromJson(responseData);
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
