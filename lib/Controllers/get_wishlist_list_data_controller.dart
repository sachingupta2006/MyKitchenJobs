import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Model/get_wishlist_data_model.dart';
import 'package:my_kitchen_jobs/main.dart';

class GetWishlistDataController extends GetxController {
  // Observable for loading state
  final _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  // Observable for wishlist data
  final _wishlistData = Rx<GetWishlistModel?>(null);
  Rx<GetWishlistModel?> get wishlistData => _wishlistData;

  // Method to fetch data from the API
  Future<void> getWishlistDataApi() async {
    _setLoading(true); // Set loading state to true

    try {
      // Access the token from HomeController
      String? token = homeC.token;

      if (token == null) {
        Get.snackbar('Error', 'Authentication token is missing');
        return;
      }

      // Make an HTTP GET request to the API
      final response = await http.get(
        Uri.parse('${homeC.baseUrl}/wishlists/list/'),
        headers: {
          'Content-Type': 'application/json',
          'token': token, // Include the token in the headers
        },
      );

      if (response.statusCode == 200) {
        // Parse the response body as JSON
        final responseData = json.decode(response.body);

        // Create a GetWishlistModel instance from the parsed JSON data
        _wishlistData.value = GetWishlistModel.fromJson(responseData);
      } else {
        // Display an error message using Get.snackbar
        Get.snackbar(
            "Error", "Error ${response.statusCode}: ${response.reasonPhrase}");
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

  void toggleFavorite(String chefId, bool bool) {}
}
