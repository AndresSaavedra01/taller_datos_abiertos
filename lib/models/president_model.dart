class President {
  final int id;
  final String name;
  final String lastName;
  final String politicalParty;
  final String description;

  President({
    required this.id,
    required this.name,
    required this.lastName,
    required this.politicalParty,
    required this.description,
  });

  factory President.fromJson(Map<String, dynamic> json) {
    return President(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Desconocido',
      lastName: json['lastName'] as String? ?? '',
      politicalParty: json['politicalParty'] as String? ?? 'Desconocido',
      description: json['description'] as String? ?? 'Sin descripción',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastName': lastName,
      'politicalParty': politicalParty,
      'description': description,
    };
  }
}
