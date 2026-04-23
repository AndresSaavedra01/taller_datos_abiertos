import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/president_model.dart';

class PresidentService {
  final String _baseUrl = dotenv.env['API_URL'] ?? 'https://api-colombia.com/api/v1/';

  Future<List<President>> getPresidents() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl' 'President'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => President.fromJson(json)).toList();
      } else {
        throw Exception('Error al cargar presidentes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Excepción al cargar presidentes: $e');
    }
  }

  Future<President> getPresidentById(int id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl' 'President/$id'));
      if (response.statusCode == 200) {
        return President.fromJson(json.decode(response.body));
      } else {
        throw Exception('Error al cargar el presidente');
      }
    } catch (e) {
      throw Exception('Excepción al cargar el presidente: $e');
    }
  }
}
