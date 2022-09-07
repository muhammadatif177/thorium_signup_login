class AppUser {
  DateTime? creatAt;
  String? fcmToken;
  String? id;
  String? email;
  String? password;
  String? name;
  AppUser({
    this.fcmToken,
    this.creatAt,
    this.email,
    this.id,
    this.password,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['fcmToken'];
    data['creatAt'] = creatAt;
    data['email'] = email;
    data['name'] = name;
    return data;
  }

  AppUser.fromJson(json, id) {
    this.id = id;
    creatAt = json['creatAt'].toDate();
    email = json['email'];
    fcmToken = json['fcmToken'];
    name = json['name'];
  }
}
