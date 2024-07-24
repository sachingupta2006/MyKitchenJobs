class VerifyOtpModel {
  String? title;
  bool? error;
  String? token;
  String? type;

  VerifyOtpModel({this.title, this.error, this.token, this.type});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    error = json['error'];
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['error'] = error;
    data['token'] = token;
    data['type'] = type;
    return data;
  }
}
