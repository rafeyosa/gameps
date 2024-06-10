class EsrbRatingModel {
  int? id;
  String? name;
  String? slug;
  String? nameEn;
  String? nameRu;

  EsrbRatingModel({
    this.id,
    this.name,
    this.slug,
    this.nameEn,
    this.nameRu,
  });

  factory EsrbRatingModel.fromJson(Map<String, dynamic> json) =>
      EsrbRatingModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        nameEn: json["name_en"],
        nameRu: json["name_ru"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "name_en": nameEn,
        "name_ru": nameRu,
      };
}
