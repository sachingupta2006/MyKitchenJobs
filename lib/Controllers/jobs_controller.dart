import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_kitchen_jobs/Modal/jobs_model.dart';
import 'package:my_kitchen_jobs/main.dart';

class JobsControllers extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _token;
  String? get token => _token;

  void loading() {
    _isLoading = !_isLoading;
    update();
  }

  JobsModel? _jobs;
  JobsModel? get jobsData => _jobs;

  void setToken(String newToken) {
    _token = newToken;

    update();
  }

  Future<void> jobsApi(
    String position,
    String gender,
    String location,
    String address,
    String salary,
    String experience,
  ) async {
    try {
      loading();
      final requestBody = json.encode({
        "position": position,
        "gender": gender,
        "location": location,
        "address": address,
        "salary": salary,
        "experience": experience,
      });

      final response = await http.post(
        Uri.parse('${homeC.baseUrl}/jobs/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: requestBody,
      );

    

      final responseData = json.decode(response.body);
      if (response.statusCode == 200 && responseData['error'] == false) {
        _jobs = JobsModel.fromJson(responseData);
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
