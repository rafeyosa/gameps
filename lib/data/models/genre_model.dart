import 'package:equatable/equatable.dart';

class GenreModel extends Equatable {
  final int? id;
  final String? name;
  final String? slug;

  const GenreModel({
    this.id,
    this.name,
    this.slug,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
      ];
}
