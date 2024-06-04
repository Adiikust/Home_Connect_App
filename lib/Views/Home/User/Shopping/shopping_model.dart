class ShoppingModel {
  bool? success;
  List<Orders>? orders;

  ShoppingModel({this.success, this.orders});

  ShoppingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  String? userId;
  String? vendorName;
  String? paymentStatus;
  String? orderStatus;
  String? paymentMethod;
  String? totalAmount;
  String? deliveryAddress;
  String? createdAt;
  List<OrderItems>? orderItems;

  Orders(
      {this.id,
      this.userId,
      this.vendorName,
      this.paymentStatus,
      this.orderStatus,
      this.paymentMethod,
      this.totalAmount,
      this.deliveryAddress,
      this.createdAt,
      this.orderItems});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    vendorName = json['vendor_name'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    paymentMethod = json['payment_method'];
    totalAmount = json['total_amount'];
    deliveryAddress = json['delivery_address'];
    createdAt = json['created_at'];
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['vendor_name'] = this.vendorName;
    data['payment_status'] = this.paymentStatus;
    data['order_status'] = this.orderStatus;
    data['payment_method'] = this.paymentMethod;
    data['total_amount'] = this.totalAmount;
    data['delivery_address'] = this.deliveryAddress;
    data['created_at'] = this.createdAt;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  String? productName;
  List<String>? productImages;
  String? description;
  String? quantity;
  String? createdAt;

  OrderItems(
      {this.productName,
      this.productImages,
      this.description,
      this.quantity,
      this.createdAt});

  OrderItems.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    productImages = json['product_images'].cast<String>();
    description = json['description'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['product_images'] = this.productImages;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    return data;
  }
}
