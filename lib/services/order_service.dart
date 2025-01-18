import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderService {
  final String baseUrl;

  OrderService({required this.baseUrl});

  Future<List<Order>> fetchOrders() async {
    final response = await http.get(Uri.parse('$baseUrl/orders'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Order> orders = body.map((dynamic item) => Order.fromJson(item)).toList();
      return orders;
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<Order> fetchOrderById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/orders/$id'));

    if (response.statusCode == 200) {
      return Order.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load order');
    }
  }

  Future<void> createOrder(Order order) async {
    final response = await http.post(
      Uri.parse('$baseUrl/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(order.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create order');
    }
  }

  Future<void> updateOrder(String id, Order order) async {
    final response = await http.put(
      Uri.parse('$baseUrl/orders/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(order.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update order');
    }
  }

  Future<void> deleteOrder(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/orders/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete order');
    }
  }
}

class Order {
  final String id;
  final String product;
  final int quantity;
  final double price;

  Order({required this.id, required this.product, required this.quantity, required this.price});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      product: json['product'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product,
      'quantity': quantity,
      'price': price,
    };
  }
}