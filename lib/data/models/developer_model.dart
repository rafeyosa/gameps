class DeveloperModel {
  int? id;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;

  DeveloperModel({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
  });

  factory DeveloperModel.fromJson(Map<String, dynamic> json) => DeveloperModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    gamesCount: json["games_count"],
    imageBackground: json["image_background"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "games_count": gamesCount,
    "image_background": imageBackground,
  };
}