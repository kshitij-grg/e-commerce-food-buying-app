class AddressFetchResponse {
  late List<Addresses> addresses;
  late bool error;
  late String message;

  AddressFetchResponse(
      {required this.addresses, required this.error, required this.message});

  AddressFetchResponse.fromJson(Map<String, dynamic> json) {
    addresses = json["addresses"] == null
        ? []
        : (json["addresses"] as List)
            .map((e) => Addresses.fromJson(e))
            .toList();
    error = json["error"];
    message = json["message"];
  }
}

class Addresses {
  late int addressId;
  late String street;
  late String houseNo;

  Addresses(
      {required this.addressId, required this.street, required this.houseNo});

  Addresses.fromJson(Map<String, dynamic> json) {
    addressId = json["address_id"];
    street = json["street"];
    houseNo = json["house_no"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["address_id"] = addressId;
    data["street"] = street;
    data["house_no"] = houseNo;
    return data;
  }
}
