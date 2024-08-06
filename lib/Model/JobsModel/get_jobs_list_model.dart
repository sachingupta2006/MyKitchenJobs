class JobsListModel {
  String? title;
  bool ?error;
  List<JobsData>? jobsData;

  JobsListModel({this.title, this.error, this.jobsData});

  JobsListModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    error = json['error'];
    if (json['jobsData'] != null) {
      jobsData = <JobsData>[];
      json['jobsData'].forEach((v) {
        jobsData?.add( JobsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['error'] = error;
    if (jobsData != null) {
      data['jobsData'] = jobsData?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobsData {
  String? sId;
  UserId? userId;
  List<String>? position;
  String ?gender;
  Location? location;
  String ?address;
  int ?salary;
  int ?experience;
  String? jobProfileImg;
  List<String> ?cuisine;
  String? status;
  String ?createdAt;
  String ?updatedAt;
  int? iV;

  JobsData(
      {this.sId,
      this.userId,
      this.position,
      this.gender,
      this.location,
      this.address,
      this.salary,
      this.experience,
      this.jobProfileImg,
      this.cuisine,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV});

  JobsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId =
        json['user_id'] != null ? UserId.fromJson(json['user_id']) : null;
    position = json['position'].cast<String>();
    gender = json['gender'];
    location = json['location'] != null
        ?  Location.fromJson(json['location'])
        : null;
    address = json['address'];
    salary = json['salary'];
    experience = json['experience'];
    jobProfileImg = json['job_profile_img'];
    cuisine = json['cuisine'].cast<String>();
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    if (userId != null) {
      data['user_id'] = userId?.toJson();
    }
    data['position'] = position;
    data['gender'] = gender;
    if (location != null) {
      data['location'] = location?.toJson();
    }
    data['address'] = address;
    data['salary'] = salary;
    data['experience'] = experience;
    data['job_profile_img'] = jobProfileImg;
    data['cuisine'] = cuisine;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class  UserId {
  String ?sId;
  String ?name;

   UserId({sId, name});

   UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Location {
  String ?sId;
  String? name;
  String? state;
  String ?pincode;

  Location({this.sId, this.name, this.state, this.pincode});

  Location.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    state = json['state'];
    pincode = json['Pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['state'] = state;
    data['Pincode'] = pincode;
    return data;
  }
}
