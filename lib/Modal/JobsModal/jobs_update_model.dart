class JobsUpdateModel {
  String? title;
  bool? error;

  JobsUpdateModel({this.title, this.error});

  JobsUpdateModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['error'] = error;
    return data;
  }
}
