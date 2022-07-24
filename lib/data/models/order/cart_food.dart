class CartFood {
  late List<Foods> foods;
  late bool error;
  late String message;

  CartFood({required this.foods, required this.error, required this.message});

  CartFood.fromJson(Map<String, dynamic> json) {
    foods = (json["foods"] == null
        ? null
        : (json["foods"] as List).map((e) => Foods.fromJson(e)).toList())!;
    error = json["error"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (foods != null) {
      data["foods"] = foods.map((e) => e.toJson()).toList();
    }
    data["error"] = error;
    data["message"] = message;
    return data;
  }
}

class Foods {
  late int id;
  late String name;
  late String description;
  late String unit;
  late int price;
  late String image;
  late int categoryId;
  late String cartQuantity;
  late int cartId;

  Foods(
      {required this.id,
      required this.name,
      required this.description,
      required this.unit,
      required this.price,
      required this.image,
      required this.categoryId,
      required this.cartQuantity,
      required this.cartId});

  Foods.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    unit = json["unit"];
    price = json["price"];
    image = json["image"];
    categoryId = json["category_id"];
    cartQuantity = json["cart_quantity"];
    cartId = json["cart_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["unit"] = unit;
    data["price"] = price;
    data["image"] = image;
    data["category_id"] = categoryId;
    data["cart_quantity"] = cartQuantity;
    data["cart_id"] = cartId;
    return data;
  }
}
