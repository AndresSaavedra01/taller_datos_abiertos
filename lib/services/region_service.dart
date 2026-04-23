import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/region_model.dart';

class RegionService {
  final String _baseUrl = dotenv.env['API_URL'] ?? 'https://api-colombia.com/api/v1/';

  Future<List<Region>> getRegions() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl' 'Region'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Region.fromJson(json)).toList();
      } else {
        throw Exception('Error al cargar regiones: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Excepción al cargar regiones: $e');
    }
  }

  Future<Region> getRegionById(int id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl' 'Region/$id'));
      if (response.statusCode == 200) {
        return Region.fromJson(json.decode(response.body));
      } else {
        throw Exception('Error al cargar la región');
      }
    } catch (e) {
      throw Exception('Excepción al cargar la región: $e');
    }
  }
}
