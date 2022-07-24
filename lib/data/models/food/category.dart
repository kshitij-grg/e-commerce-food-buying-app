class Category {
  late List<Categories> categories;
  late bool error;
  late String message;

  Category(
      {required this.categories, required this.error, required this.message});

  Category.fromJson(Map<String, dynamic> json) {
    this.categories = (json["categories"] == null
        ? null
        : (json["categories"] as List)
            .map((e) => Categories.fromJson(e))
            .toList())!;
    this.error = json["error"];
    this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null)
      data["categories"] = this.categories.map((e) => e.toJson()).toList();
    data["error"] = this.error;
    data["message"] = this.message;
    return data;
  }
}

class Categories {
  late int id;
  late String name;
  late String icon;

  Categories({required this.id, required this.name, required this.icon});

  Categories.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["icon"] = this.icon;
    return data;
  }
}
