class OrderDetailsResponse {
  late List<OrderHistory> orderHistory;
  late bool error;
  late String message;

  OrderDetailsResponse(
      {required this.orderHistory, required this.error, required this.message});

  OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    orderHistory = (json["order_history"] == null
        ? []
        : (json["order_history"] as List)
            .map((e) => OrderHistory.fromJson(e))
            .toList());
    error = json["error"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orderHistory != null) {
      data["order_history"] = orderHistory.map((e) => e.toJson()).toList();
    }
    data["error"] = error;
    data["message"] = message;
    return data;
  }
}

class OrderHistory {
  late int checkoutId;
  late String orderDate;
  late String orderTime;
  late String paymentType;
  late String orderStatus;
  late List<OrderDetails> orderDetails;

  OrderHistory(
      {required this.checkoutId,
      required this.orderDate,
      required this.orderTime,
      required this.paymentType,
      required this.orderStatus,
      required this.orderDetails});

  OrderHistory.fromJson(Map<String, dynamic> json) {
    checkoutId = json["checkout_id"];
    orderDate = json["order_date"];
    orderTime = json["order_time"];
    paymentType = json["payment_type"];
    orderStatus = json["order_status"];
    orderDetails = (json["order_details"] == null
        ? null
        : (json["order_details"] as List)
            .map((e) => OrderDetails.fromJson(e))
            .toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["checkout_id"] = checkoutId;
    data["order_date"] = orderDate;
    data["order_time"] = orderTime;
    data["payment_type"] = paymentType;
    data["order_status"] = orderStatus;
    if (orderDetails != null) {
      data["order_details"] = orderDetails.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class OrderDetails {
  late int orderDetailsId;
  late int foodId;
  late int totalCost;
  late String totalQuantity;
  late Food food;

  OrderDetails(
      {required this.orderDetailsId,
      required this.foodId,
      required this.totalCost,
      required this.totalQuantity,
      required this.food});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderDetailsId = json["order_details_id"];
    foodId = json["food_id"];
    totalCost = json["total_cost"];
    totalQuantity = json["total_quantity"];
    food = (json["food"] == null ? null : Food.fromJson(json["food"]))!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["order_details_id"] = orderDetailsId;
    data["food_id"] = foodId;
    data["total_cost"] = totalCost;
    data["total_quantity"] = totalQuantity;
    if (food != null) {
      data["food"] = food.toJson();
    }
    return data;
  }
}

class Food {
  late int id;
  late String name;
  late String description;
  late String unit;
  late int price;
  late String image;
  late int categoryId;

  Food(
      {required this.id,
      required this.name,
      required this.description,
      required this.unit,
      required this.price,
      required this.image,
      required this.categoryId});

  Food.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    unit = json["unit"];
    price = json["price"];
    image = json["image"];
    categoryId = json["category_id"];
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
    return data;
  }
}
