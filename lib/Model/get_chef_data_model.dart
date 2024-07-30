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
        data?.add( Data.fromJson(v));
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
  String? name;
  List<String>? position;
  Location? location;
  String? profileImg;

  Data({this.sId, this.name, this.position, this.location, this.profileImg});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    position = json['position'].cast<String>();
    location = json['location'] != null
        ?  Location.fromJson(json['location'])
        : null;
    profileImg = json['profile_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['position'] = position;
    if (location != null) {
      data['location'] = location?.toJson();
    }
    data['profile_img'] = profileImg;
    return data;
  }
}

class Location {
  String? name;
  String? state;

  Location({this.name, this.state});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['state'] = state;
    return data;
  }
}

class Metadata {
  int? total;

  Metadata({this.total});

  Metadata.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['total'] = total;
    return data;
  }
}
