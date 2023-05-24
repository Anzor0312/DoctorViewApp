
class DoctorsModel {
  List<Doctors>? doctors;
  List<Specialists>? specialists;

  DoctorsModel({this.doctors, this.specialists});

  DoctorsModel.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(Doctors.fromJson(v));
      });
    }
    if (json['specialists'] != null) {
      specialists = <Specialists>[];
      json['specialists'].forEach((v) {
        specialists!.add(Specialists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctors != null) {
      data['doctors'] = doctors!.map((v) => v.toJson()).toList();
    }
    if (specialists != null) {
      data['specialists'] = specialists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctors {
  String? name;
  String? special;
  String? current;

  Doctors({this.name, this.special, this.current});

  Doctors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    special = json['special'];
    current = json['current'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['special'] = special;
    data['current'] = current;
    return data;
  }
}

class Specialists {
  String? name;
  String? color;

  Specialists({this.name, this.color});

  Specialists.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['color'] = color;
    return data;
  }
}
