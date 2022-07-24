class Food {
  late List<Foods> foods;
  late bool error;
  late String message;

  Food({required this.foods, required this.error, required this.message});

  Food.fromJson(Map<String, dynamic> json) {
    this.foods = (json["foods"] == null
        ? null
        : (json["foods"] as List).map((e) => Foods.fromJson(e)).toList())!;
    this.error = json["error"];
    this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.foods != null)
      data["foods"] = this.foods.map((e) => e.toJson()).toList();
    data["error"] = this.error;
    data["message"] = this.message;
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

  Foods(
      {required this.id,
      required this.name,
      required this.description,
      required this.unit,
      required this.price,
      required this.image,
      required this.categoryId});

  Foods.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.description = json["description"];
    this.unit = json["unit"];
    this.price = json["price"];
    this.image = json["image"];
    this.categoryId = json["category_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["description"] = this.description;
    data["unit"] = this.unit;
    data["price"] = this.price;
    data["image"] = this.image;
    data["category_id"] = this.categoryId;
    return data;
  }
}
