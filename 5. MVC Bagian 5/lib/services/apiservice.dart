import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:integration_api/models/product.dart';

class ApiService {
  final String apiUrl = "http://192.168.1.15:82/api/";

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(apiUrl+"GetProduct"));
    //log(response.toString());
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<Product> createUser(Product product) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 201) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<Product> updateUser(String kode_product , Product product) async {
    final response = await http.put(
      Uri.parse("$apiUrl/$kode_product"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse("$apiUrl/$id"));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete product');
    }
  }
}
