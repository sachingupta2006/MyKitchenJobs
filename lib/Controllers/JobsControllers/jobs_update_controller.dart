import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_kitchen_jobs/Modal/JobsModal/jobs_model.dart';
import 'package:my_kitchen_jobs/main.dart';

class JobsUpdateControllers extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void loading() {
    _isLoading = !_isLoading;
    update();
  }

  JobsModel? _jobsUpdate;
  JobsModel? get jobsData => _jobsUpdate;

  Future<void> jobsUpdateApi(
    String position,
    String gender,
    String location,
    String address,
    String salary,
    String experience,
  ) async {
    try {
      loading();

      // Access the token from HomeController
      String? token = homeC.token;

      if (token == null) {
        Get.snackbar('Error', 'Authentication token is missing');
        return;
      }

      final requestBody = json.encode({
        "position": [position],
        "gender": gender,
        "location": location,
        "address": address,
        "salary": salary,
        "experience": experience,
      });

      final response = await http.put(
        // Using PUT for update
        Uri.parse('${homeC.baseUrl}/jobs/update/'),
        headers: {
          'Content-Type': 'application/json',
          'token': token, // Include token in headers
        },
        body: requestBody,
      );

      final responseData = json.decode(response.body);
      if (response.statusCode == 200 && responseData['error'] == false) {
        _jobsUpdate = JobsModel.fromJson(responseData);
        Get.snackbar('Success', 'Job updated successfully');
      } else {
        _jobsUpdate = JobsModel.fromJson(responseData);
        if (_jobsUpdate?.error == true &&
            _jobsUpdate?.errors?.errorDetails != null) {
          for (var error in _jobsUpdate!.errors!.errorDetails!) {
            Get.snackbar('Error', error.msg ?? 'Validation error');
          }
        } else {
          Get.snackbar('Error', _jobsUpdate?.title ?? 'Job update failed');
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      loading();
    }
  }
}
