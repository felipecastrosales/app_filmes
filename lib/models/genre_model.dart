import 'dart:convert';

class GenreModel {
  GenreModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name; 

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GenreModel.fromJson(String source) => 
      GenreModel.fromMap(json.decode(source));
}
