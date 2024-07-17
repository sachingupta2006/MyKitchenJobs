class CommonModel {
  bool? error;
  String? title;

  CommonModel({this.error, this.title});

  CommonModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['error'] = error;
    data['title'] = title;
    return data;
  }
}

