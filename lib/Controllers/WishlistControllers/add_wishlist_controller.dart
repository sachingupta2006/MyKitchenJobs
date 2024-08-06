import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Model/WishlistModels/add_wishlist_model.dart';
import 'package:my_kitchen_jobs/View/Staff/ProfileScreen/LoginScreen/logiscreen.dart';
import 'package:my_kitchen_jobs/main.dart';

class AddWishlistController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  WishlistModel? _wishlistData;
  WishlistModel? get wishlistData => _wishlistData;

  void loading() {
    _isLoading = !_isLoading;
    update();
  }

  Future<void> wishlistApi(String chefId, bool isFavorite) async {
    try {
      loading();

      // Access the token from HomeController
      String? token = homeC.token;

      if (token == null) {
        Get.snackbar('', 'Plzz Login First');
        Get.to(() => const ProfileScreen());
        return;
      }

      final requestBody = json.encode({
        "chefId": chefId,
      });

      final response = await http.post(
        Uri.parse('${homeC.baseUrl}/wishlists/add/'),
        headers: {
          'Content-Type': 'application/json',
          'token': token, // Include token in headers
        },
        body: requestBody,
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData['error'] == false) {
        _wishlistData = WishlistModel.fromJson(responseData);

        // Show success message based on the action performed
        Get.snackbar(
          'Success',
          isFavorite
              ? 'Wishlist added: ${_wishlistData?.title ?? 'Success'}'
              : 'Wishlist removed: ${_wishlistData?.title ?? 'Success'}',
        );
      } else {
        _wishlistData = WishlistModel.fromJson(responseData);

        // Show error message with title from response if available
        Get.snackbar(
          'Error',
          _wishlistData?.title ?? 'Operation failed',
        );
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      loading();
    }
  }
}
