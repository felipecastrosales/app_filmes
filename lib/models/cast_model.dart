import 'dart:convert';

class CastModel {
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

  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      name: map['original_name'] ?? '',
      image: 'https://image.tmdb.org/t/p/w200${map['profile_path']}',
      character: map['character'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CastModel.fromJson(String source) =>
      CastModel.fromMap(json.decode(source));
}
