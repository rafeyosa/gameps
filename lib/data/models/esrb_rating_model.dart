class EsrbRatingModel {
  int? id;
  String? name;
  String? slug;

  EsrbRatingModel({
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
}
