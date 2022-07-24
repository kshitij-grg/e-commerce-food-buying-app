class AddressResponse {
  late bool error;
  late int addressId;
  late String message;

  AddressResponse(
      {required this.error, required this.addressId, required this.message});

  AddressResponse.fromJson(Map<String, dynamic> json) {
    error = json["error"];
    addressId = json["address_id"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["error"] = error;
    data["address_id"] = addressId;
    data["message"] = message;
    return data;
  }
}
