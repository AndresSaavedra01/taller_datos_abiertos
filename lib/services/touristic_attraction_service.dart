import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/touristic_attraction_model.dart';

class TouristicAttractionService {
  final String _baseUrl = dotenv.env['API_URL'] ?? 'https://api-colombia.com/api/v1/';

  Future<List<TouristicAttraction>> getAttractions() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl' 'TouristicAttraction'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => TouristicAttraction.fromJson(json)).toList();
      } else {
        throw Exception('Error al cargar atracciones: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Excepción al cargar atracciones: $e');
    }
  }

  Future<TouristicAttraction> getAttractionById(int id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl' 'TouristicAttraction/$id'));
      if (response.statusCode == 200) {
        return TouristicAttraction.fromJson(json.decode(response.body));
      } else {
        throw Exception('Error al cargar la atracción');
      }
    } catch (e) {
      throw Exception('Excepción al cargar la atracción: $e');
    }
  }
}
