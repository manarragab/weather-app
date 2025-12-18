import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseData {
  String? name;
  String? email;
  String phone = "";
  String country = "";
  String uid = "";
  Timestamp createdAt = Timestamp.now();
  String? profileImage;

  // Default constructor
  FirebaseData({
    this.name,
    this.email,
    this.phone = "",
    this.country = "",
    this.uid = "",
    Timestamp? createdAt,
    this.profileImage,
  }) : createdAt = createdAt ?? Timestamp.now();

  FirebaseData.fromJson(Map<String, dynamic> json) {
  name = json["name"];
  email = json["email"];
  phone = json["phone"] ?? "";
  country = json["country"] ?? "";
  uid = json["uid"] ?? "";
  profileImage = json["profileImage"] != null && json["profileImage"].toString().isNotEmpty 
      ? json["profileImage"] 
      : null;
  
  if (json["createdAt"] is Timestamp) {
    createdAt = json["createdAt"];
  } else {
    createdAt = Timestamp.now();
  }
}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["email"] = email;
    data["phone"] = phone;
    data["country"] = country;
    data["uid"] = uid;
    data["profileImage"] = profileImage;
    data["createdAt"] = createdAt;
    return data;
  }
}
