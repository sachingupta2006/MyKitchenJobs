class ChefsModel {
  String? title;
  bool? error;
  List<ChefsData>? chefsData;

  ChefsModel({this.title, this.error, this.chefsData});

  ChefsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    error = json['error'];
    if (json['chefsData'] != null) {
      chefsData = <ChefsData>[];
      json['chefsData'].forEach((v) {
        chefsData?.add(ChefsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['error'] = error;
    if (chefsData != null) {
      data['chefsData'] = chefsData?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChefsData {
  List<Data>? data;
  List<Metadata>? metadata;

  ChefsData({this.data, this.metadata});

  ChefsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    if (json['metadata'] != null) {
      metadata = <Metadata>[];
      json['metadata'].forEach((v) {
        metadata?.add( Metadata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    if (metadata != null) {
      data['metadata'] = metadata?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? email;
  String? name;
  String? phoneNo;
  List<String>? position;
  String? dob;
  String? gender;
  Location? location;
  String? address;
  String? visitRate;
  String? experience;
  String? maritalStatus;
  String? about;
  bool? relocate;
  String? cuisine;
  List<String>? dishImages;
  String? aadharFrontImg;
  String? aadharBackImg;
  String? panImg;
  String? profileImg;
  bool? isFeatured;
  String? password;
  String? razorpayAcNo;
  bool? isBlocked;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  int? wishlistCount;
  String? jobType;
  int? otp;

  Data(
      {this.sId,
      this.email,
      this.name,
      this.phoneNo,
      this.position,
      this.dob,
      this.gender,
      this.location,
      this.address,
      this.visitRate,
      this.experience,
      this.maritalStatus,
      this.about,
      this.relocate,
      this.cuisine,
      this.dishImages,
      this.aadharFrontImg,
      this.aadharBackImg,
      this.panImg,
      this.profileImg,
      this.isFeatured,
      this.password,
      this.razorpayAcNo,
      this.isBlocked,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.wishlistCount,
      this.jobType,
      this.otp});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    name = json['name'];
    phoneNo = json['phone_no'];
    position = json['position'].cast<String>();
    dob = json['dob'];
    gender = json['gender'];
    location = (json['location'] != null
        ? Location.fromJson(json['location'])
        : null)!;
    address = json['address'];
    visitRate = json['visit_rate'];
    experience = json['experience'];
    maritalStatus = json['marital_status'];
    about = json['about'];
    relocate = json['relocate'];
    cuisine = json['cuisine'];
    dishImages = json['dish_images'].cast<String>();
    aadharFrontImg = json['aadhar_front_img'];
    aadharBackImg = json['aadhar_back_img'];
    panImg = json['pan_img'];
    profileImg = json['profile_img'];
    isFeatured = json['is_featured'];
    password = json['password'];
    razorpayAcNo = json['razorpay_ac_no'];
    isBlocked = json['is_blocked'];
    isDeleted = json['is_deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

    wishlistCount = json['wishlist_count'];
    jobType = json['job_type'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['name'] = name;
    data['phone_no'] = phoneNo;
    data['position'] = position;
    data['dob'] = dob;
    data['gender'] = gender;
    if (location != null) {
      data['location'] = location?.toJson();
    }
    data['address'] = address;
    data['visit_rate'] = visitRate;
    data['experience'] = experience;
    data['marital_status'] = maritalStatus;
    data['about'] = about;
    data['relocate'] = relocate;
    data['cuisine'] = cuisine;
    data['dish_images'] = dishImages;
    data['aadhar_front_img'] = aadharFrontImg;
    data['aadhar_back_img'] = aadharBackImg;
    data['pan_img'] = panImg;
    data['profile_img'] = profileImg;
    data['is_featured'] = isFeatured;
    data['password'] = password;
    data['razorpay_ac_no'] = razorpayAcNo;
    data['is_blocked'] = isBlocked;
    data['is_deleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    data['wishlist_count'] = wishlistCount;
    data['job_type'] = jobType;
    data['otp'] = otp;
    return data;
  }
}

class Location {
  String? sId;
  String? name;
  String? state;
  String? pincode;

  Location({this.sId, this.name, this.state, this.pincode});

  Location.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    state = json['state'];
    pincode = json['Pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['state'] = state;
    data['Pincode'] = pincode;
    return data;
  }
}

class Metadata {
  int? total;

  Metadata({total});

  Metadata.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['total'] = total;
    return data;
  }
}
