class OrderMessage {
  String? eventName;
  Order? order;

  OrderMessage({this.eventName, this.order});
}

class Order {
  String? id;
  String? date;
  String? item;
  num? quantity;
  num? price;

  Order({this.id, this.date, this.item, this.quantity, this.price});

  Order.fromMap(Map<String, dynamic> map)
      : id = map['id'] as String?,
        date = map['date'] as String?,
        item = map['item'] as String?,
        quantity = map['quantity'] as num?,
        price = map['price'] as num?;

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['date'] = date;
    map['item'] = item;
    map['quantity'] = quantity;
    map['price'] = price;
    return map;
  }
}
