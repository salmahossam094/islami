

// ignore_for_file: file_names

class RadioResponse {
  RadioResponse({
      this.radios,});

  RadioResponse.fromJson(dynamic json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios?.add(Radios.fromJson(v));
      });
    }
  }
  List<Radios>? radios;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (radios != null) {
      map['radios'] = radios?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// name : " إذاعة إبراهيم الأخضر"
/// url : "https://backup.qurango.net/radio/ibrahim_alakdar"

class Radios {
  Radios({
      this.id, 
      this.name, 
      this.url,});

  Radios.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }
  num? id;
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}