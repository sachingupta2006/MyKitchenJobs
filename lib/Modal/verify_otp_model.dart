class VerifyOtpModel {
  String?title;
  bool? error;

  VerifyOtpModel({this.title, this.error});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['error'] = this.error;
    return data;
  }
}
