class Role {
  int id = 0;
  String label = "";
  String description = "";

  Role({this.id, this.label, this.description});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['description'] = this.description;

    return data;
  }
}

class ListRoles {
  List<Role> data;

  ListRoles({this.data});

  ListRoles.fromJson(dynamic json) {
    if (json != null) {
      data = <Role>[];
      json.forEach((v) {
        data.add(new Role.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
