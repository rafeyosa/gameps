import 'package:equatable/equatable.dart';

class EsrbRatingModel extends Equatable {
  final int? id;
  final String? name;
  final String? slug;

  const EsrbRatingModel({
    this.id,
    this.name,
    this.slug,
  });

  factory EsrbRatingModel.fromJson(Map<String, dynamic> json) =>
      EsrbRatingModel(
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
