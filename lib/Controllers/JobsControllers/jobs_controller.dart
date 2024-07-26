import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_kitchen_jobs/Modal/JobsModal/jobs_model.dart';
import 'package:my_kitchen_jobs/main.dart';

class JobsControllers extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  JobsModel? _jobs;
  JobsModel? get jobsData => _jobs;

  // Store the jobId
  String? _jobId;
  String? get jobId => _jobId; // Getter for the jobId

  void loading() {
    _isLoading = !_isLoading;
    update();
  }

  Future<void> jobsApi(
    String position,
    String gender,
    String location,
    String experience,
    String salary,
    String address,
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
        "experience": experience,
        "salary": salary,
        "address": address,
      });

      final response = await http.post(
        Uri.parse('${homeC.baseUrl}/jobs/'),
        headers: {
          'Content-Type': 'application/json',
          'token': token, // Include token in headers
        },
        body: requestBody,
      );

      final responseData = json.decode(response.body);
      if (response.statusCode == 200 && responseData['error'] == false) {
        _jobs = JobsModel.fromJson(responseData);
        _jobId = responseData['savedJob']['_id']; // Store jobId here

        Get.snackbar('Success', 'Job added successfully');
      } else {
        _jobs = JobsModel.fromJson(responseData);
        if (_jobs?.error == true && _jobs?.errors?.errorDetails != null) {
          for (var error in _jobs!.errors!.errorDetails!) {
            Get.snackbar('Error', error.msg ?? 'Validation error');
          }
        } else {
          Get.snackbar('Error', _jobs?.title ?? 'Job addition failed');
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      loading();
    }
  }
}
