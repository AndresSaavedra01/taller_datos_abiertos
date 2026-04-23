class Department {
  final int id;
  final String name;
  final String description;
  final int population;
  final int surface;

  Department({
    required this.id,
    required this.name,
    required this.description,
    required this.population,
    required this.surface,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Desconocido',
      description: json['description'] as String? ?? 'Sin descripción',
      population: json['population'] as int? ?? 0,
      surface: json['surface'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'population': population,
      'surface': surface,
    };
  }
}
