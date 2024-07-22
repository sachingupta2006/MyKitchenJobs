class ForgotPasswordModel {
  String? title;
  bool ?error;

  ForgotPasswordModel({this.title, this.error});

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
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