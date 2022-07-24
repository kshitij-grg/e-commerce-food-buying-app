class UserResponse {
  late List<Users> users;
  late bool error;
  late String message;

  UserResponse(
      {required this.users, required this.error, required this.message});

  UserResponse.fromJson(Map<String, dynamic> json) {
    users = json["users"] == null
        ? []
        : (json["users"] as List).map((e) => Users.fromJson(e)).toList();
    error = json["error"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data["users"] = users.map((e) => e.toJson()).toList();
    }
    data["error"] = error;
    data["message"] = message;
    return data;
  }
}

class Users {
  late int userId;
  late String name;
  late String email;
  late String phnNum;

  Users(
      {required this.userId,
      required this.name,
      required this.email,
      required this.phnNum});

  Users.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    name = json["name"];
    email = json["email"];
    phnNum = json["phnNum"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["user_id"] = userId;
    data["name"] = name;
    data["email"] = email;
    data["phnNum"] = phnNum;
    return data;
  }
}
