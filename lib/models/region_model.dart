class Region {
  final int id;
  final String name;
  final String description;

  Region({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Desconocida',
      description: json['description'] as String? ?? 'Sin descripción',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
