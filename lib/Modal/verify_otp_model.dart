class VerifyOtpModel {
  String?title;
  bool? error;

  VerifyOtpModel({this.title, this.error});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['title'] = title;
    data['error'] = error;
    return data;
  }
}
