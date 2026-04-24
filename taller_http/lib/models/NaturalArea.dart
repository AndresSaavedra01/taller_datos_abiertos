
class NaturalArea  {
  int id;
  int areaGroupId;
  int categoryNaturalAreaId;
  String name;
  int departmentId;
  int daneCode;
  int landArea;
  int maritimeArea;

  NaturalArea({
    required this.id,
    required this.areaGroupId,
    required this.categoryNaturalAreaId,
    required this.name,
    required this.departmentId,
    required this.daneCode,
    required this.landArea,
    required this.maritimeArea
  });

  factory NaturalArea.fromJson(Map<String, dynamic> json){
    return NaturalArea(id: json["id"],
        areaGroupId: json["name"],
        categoryNaturalAreaId: json["categoryNaturalAreaId"],
        name: json["name"],
        departmentId: json["departmentId"],
        daneCode: json["daneCode"],
        landArea: json["landArea"],
        maritimeArea: json["maritimeArea"]
    );
  }

}