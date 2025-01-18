import 'package:http/http.dart' as http;
import 'dart:convert';

class DeliveryService {
  final String baseUrl;

  DeliveryService({required this.baseUrl});

  Future<Map<String, dynamic>> getDeliveryDetails(String orderId) async {
    final response = await http.get(Uri.parse('$baseUrl/delivery/$orderId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load delivery details');
    }
  }

  Future<bool> updateDeliveryStatus(String orderId, String status) async {
    final response = await http.put(
      Uri.parse('$baseUrl/delivery/$orderId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'status': status,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to update delivery status');
    }
  }
}