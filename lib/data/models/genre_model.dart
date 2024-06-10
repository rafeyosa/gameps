class GenreModel {
  int? id;
  String? name;
  String? slug;

  GenreModel({
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
}
