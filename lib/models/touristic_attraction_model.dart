class TouristicAttraction {
  final int id;
  final String name;
  final String description;
  final String cityId;

  TouristicAttraction({
    required this.id,
    required this.name,
    required this.description,
    required this.cityId,
  });

  factory TouristicAttraction.fromJson(Map<String, dynamic> json) {
    return TouristicAttraction(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Desconocido',
      description: json['description'] as String? ?? 'Sin descripción',
      cityId: json['cityId']?.toString() ?? '0',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'cityId': cityId,
    };
  }
}
