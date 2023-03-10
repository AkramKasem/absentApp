import 'dart:convert';

List<StudentData> studentDataFromJson(String str) => List<StudentData>.from(json.decode(str).map((x) => StudentData.fromJson(x)));

String studentDataToJson(List<StudentData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentData {
  StudentData({
    this.id,
    this.name,
    this.department,
    this.section,
    this.macAddress,
  });

  num? id;
  String? name;
  String? department;
  num? section;
  String? macAddress;

  factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
    id: json["id"],
    name: json["name"],
    department: json["department"],
    section: json["section"],
    macAddress: json["macAddress"] ,
  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "name": name,
    "department": department,
    "section": section,
    "macAddress": macAddress,
  };
}