import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/department_model.dart';

class DepartmentService {
  final String _baseUrl = dotenv.env['API_URL'] ?? 'https://api-colombia.com/api/v1/';

  Future<List<Department>> getDepartments() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl' 'Department'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Department.fromJson(json)).toList();
      } else {
        throw Exception('Error al cargar departamentos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Excepción al cargar departamentos: $e');
    }
  }

  Future<Department> getDepartmentById(int id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl' 'Department/$id'));
      if (response.statusCode == 200) {
        return Department.fromJson(json.decode(response.body));
      } else {
        throw Exception('Error al cargar el departamento');
      }
    } catch (e) {
      throw Exception('Excepción al cargar el departamento: $e');
    }
  }
}
