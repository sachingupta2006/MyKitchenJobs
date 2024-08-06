import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_kitchen_jobs/Model/JobsModel/get_jobs_list_model.dart';

class JobsListController extends GetxController {
  var isLoading = false.obs;
  var jobsList = <JobsData>[].obs; // Use RxList for observable list
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchJobsapi(); // Fetch jobs when the controller is initialized
    super.onInit();
  }

  Future<void> fetchJobsapi() async {
    isLoading(true); // Set loading to true while fetching data

    try {
      final response =
          await http.get(Uri.parse('{{kitchenBaseUrl}}/jobs/listjob'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final jobsListModel = JobsListModel.fromJson(jsonData);

        if (jobsListModel.error != null && jobsListModel.error == true) {
          errorMessage('Error fetching jobs');
        } else {
          jobsList.value = jobsListModel.jobsData ?? [];
        }
      } else {
        errorMessage(
            'Failed to load jobs. Status code: ${response.statusCode}');
      }
    } catch (e) {
      errorMessage('An error occurred: $e');
    } finally {
      isLoading(false); // Set loading to false once data fetching is complete
    }
  }
}
