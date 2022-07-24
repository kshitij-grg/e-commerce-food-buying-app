class LoginResponse {
  bool? error;
  String? name;
  String? email;
  String? phnNum;
  String? password;
  String? apiKey;
  String? message;

  LoginResponse(
      {required this.error,
      required this.name,
      required this.email,
      required this.phnNum,
      required this.password,
      required this.apiKey,
      required this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    error = json["error"];
    name = json["name"];
    email = json["email"];
    phnNum = json["phnNum"];
    password = json["password"];
    apiKey = json["apiKey"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["error"] = error;
    data["name"] = name;
    data["email"] = email;
    data["phnNum"] = phnNum;
    data["password"] = password;
    data["apiKey"] = apiKey;
    data["message"] = message;
    return data;
  }
}
