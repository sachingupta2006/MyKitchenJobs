import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_kitchen_jobs/Controllers/JobsControllers/jobs_controller.dart';
import 'package:my_kitchen_jobs/Modal/JobsModal/jobs_update_model.dart';
import 'package:my_kitchen_jobs/main.dart';

class JobsUpdateControllers extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void loading() {
    _isLoading = !_isLoading;
    update();
  }

  JobsUpdateModel? _jobsUpdate;
  JobsUpdateModel? get jobsData => _jobsUpdate;

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

      // Access the jobId from JobsControllers
      JobsControllers jobsController = Get.find<JobsControllers>();
      String? jobId = jobsController.jobId;

      if (jobId == null) {
        Get.snackbar('Error', 'Job ID is missing');
        return;
      }

      final requestBody = json.encode({
        "position": [position],
        "gender": gender,
        "location": location,
        "cuisine": "maxican",
        "address": address,
        "salary": salary,
        "experience": experience,
        "id": jobId, // Use the dynamic jobId here
      });

      final response = await http.post(
        Uri.parse('${homeC.baseUrl}/jobs/update/'),
        headers: {
          'Content-Type': 'application/json',
          'token': token, // Include token in headers
        },
        body: requestBody,
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData['error'] == false) {
        _jobsUpdate = JobsUpdateModel.fromJson(responseData);
        Get.snackbar('Success', 'Job updated successfully');
      } else {
        _jobsUpdate = JobsUpdateModel.fromJson(responseData);
        if (_jobsUpdate?.error == true) {
          Get.snackbar('Error', _jobsUpdate?.title ?? 'Job update failed');
        } else {
          Get.snackbar('Error', 'Job update failed with unknown error');
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      loading();
    }
  }
}
