import 'dart:convert';

class CastModel {
  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      name: map['original_name'] ?? '',
      image: 'https://image.tmdb.org/t/p/w200${map['profile_path']}',
      character: map['character'] ?? '',
    );
  }

  factory CastModel.fromJson(String source) =>
      CastModel.fromMap(json.decode(source));

  CastModel({
    required this.name,
    required this.image,
    required this.character,
  });

  final String name;
  final String image;
  final String character;

  Map<String, dynamic> toMap() {
    return {
      'original_name': name,
      'profile_path': image,
      'character': character,
    };
  }

  String toJson() => json.encode(toMap());
}
