class LoginModel {
  String? title;
  bool? error;
  String ?token;

  LoginModel({this.title, this.error, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    error = json['error'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['error'] = error;
    data['token'] = token;
    return data;
  }
}
