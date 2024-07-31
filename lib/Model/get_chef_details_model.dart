class ChefsDetailsModel {
  String? title;
  bool? error;
  ChefData? chefData;

  ChefsDetailsModel({this.title, this.error, this.chefData});

  ChefsDetailsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    error = json['error'];
    chefData =
        json['chefData'] != null ? ChefData.fromJson(json['chefData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['error'] = error;
    if (chefData != null) {
      data['chefData'] = chefData?.toJson();
    }
    return data;
  }
}

class ChefData {
  String? sId;
  String? email;
  String? name;
  List<String>? position;
  String? dob;
  String? gender;
  Location? location;
  String? address;
  String? visitRate;
  String? experience;

  String? about;

  String? profileImg;
  bool? isFeatured;

  int? iV;
  int? wishlistCount;

  ChefData(
      {this.sId,
      this.email,
      this.name,
      this.position,
      this.dob,
      this.gender,
      this.location,
      this.address,
      this.visitRate,
      this.experience,
      this.about,
      this.profileImg,
      this.isFeatured,
      this.iV,
      this.wishlistCount});

  ChefData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    name = json['name'];
    position = json['position'].cast<String>();
    dob = json['dob'];
    gender = json['gender'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    address = json['address'];
    visitRate = json['visit_rate'];
    experience = json['experience'];

    profileImg = json['profile_img'];
    isFeatured = json['is_featured'];
    about = json['about'];
    iV = json['__v'];
    wishlistCount = json['wishlist_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['name'] = name;
    data['position'] = position;
    data['dob'] = dob;
    data['gender'] = gender;
    if (location != null) {
      data['location'] = location?.toJson();
    }
    data['address'] = address;
    data['visit_rate'] = visitRate;
    data['experience'] = experience;
    data['about'] = about;
    data['__v'] = iV;
    data['wishlist_count'] = wishlistCount;
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
