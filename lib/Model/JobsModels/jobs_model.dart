class JobsModel {
  String? title;
  bool ?error;

  JobsModel({this.title, this.error});

  JobsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    error = json['error'];
  }

  get errors => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['error'] = error;
    return data;
  }
}
