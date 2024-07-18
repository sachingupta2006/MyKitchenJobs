class SignupModel {
  bool? error;
  String? title;
  Errors? errors;

  SignupModel({this.error, this.title, this.errors});

  SignupModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    title = json['title'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['title'] = title;
    if (errors != null) {
      data['errors'] = errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<ErrorDetail>? errorDetails;

  Errors({this.errorDetails});

  Errors.fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errorDetails = <ErrorDetail>[];
      json['errors'].forEach((v) {
        errorDetails!.add(ErrorDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (errorDetails != null) {
      data['errors'] = errorDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ErrorDetail {
  String? value;
  String? msg;
  String? param;
  String? location;

  ErrorDetail({this.value, this.msg, this.param, this.location});

  ErrorDetail.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['msg'] = msg;
    data['param'] = param;
    data['location'] = location;
    return data;
  }
}
