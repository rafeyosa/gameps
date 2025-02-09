import 'package:equatable/equatable.dart';

import 'esrb_rating_model.dart';
import 'genre_model.dart';
import 'developer_model.dart';

class GameDetailModel extends Equatable {
  final int? id;
  final String? slug;
  final String? name;
  final String? nameOriginal;
  final String? description;
  final int? metacritic;
  final String? released;
  final bool? tba;
  final String? updated;
  final String? backgroundImage;
  final String? backgroundImageAdditional;
  final String? website;
  final double? rating;
  final int? ratingTop;
  final String? metacriticUrl;
  final List<DeveloperModel>? developers;
  final List<GenreModel>? genres;
  final List<DeveloperModel>? publishers;
  final EsrbRatingModel? esrbRating;
  final String? descriptionRaw;

  const GameDetailModel({
    this.id,
    this.slug,
    this.name,
    this.nameOriginal,
    this.description,
    this.metacritic,
    this.released,
    this.tba,
    this.updated,
    this.backgroundImage,
    this.backgroundImageAdditional,
    this.website,
    this.rating,
    this.ratingTop,
    this.metacriticUrl,
    this.developers,
    this.genres,
    this.publishers,
    this.esrbRating,
    this.descriptionRaw,
  });

  factory GameDetailModel.fromJson(Map<String, dynamic> json) =>
      GameDetailModel(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        nameOriginal: json["name_original"],
        description: json["description"],
        metacritic: json["metacritic"],
        released: json["released"],
        tba: json["tba"],
        updated: json["updated"],
        backgroundImage: json["background_image"],
        backgroundImageAdditional: json["background_image_additional"],
        website: json["website"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        metacriticUrl: json["metacritic_url"],
        developers: json["developers"] == null
            ? null
            : List<DeveloperModel>.from(
                json["developers"]!.map((x) => DeveloperModel.fromJson(x))),
        genres: json["genres"] == null
            ? null
            : List<GenreModel>.from(
                json["genres"]!.map((x) => GenreModel.fromJson(x))),
        publishers: json["publishers"] == null
            ? null
            : List<DeveloperModel>.from(
                json["publishers"]!.map((x) => DeveloperModel.fromJson(x))),
        esrbRating: json["esrb_rating"] == null
            ? null
            : EsrbRatingModel.fromJson(json["esrb_rating"]),
        descriptionRaw: json["description_raw"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "name_original": nameOriginal,
        "description": description,
        "metacritic": metacritic,
        "released": released,
        "tba": tba,
        "updated": updated,
        "background_image": backgroundImage,
        "background_image_additional": backgroundImageAdditional,
        "website": website,
        "rating": rating,
        "metacritic_url": metacriticUrl,
        "developers": developers == null
            ? null
            : List<dynamic>.from(developers!.map((x) => x.toJson())),
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "publishers": publishers == null
            ? null
            : List<dynamic>.from(publishers!.map((x) => x.toJson())),
        "esrb_rating": esrbRating?.toJson(),
        "description_raw": descriptionRaw,
      };

  @override
  List<Object?> get props => [
        id,
        slug,
        name,
        nameOriginal,
        description,
        metacritic,
        released,
        tba,
        updated,
        backgroundImage,
        backgroundImageAdditional,
        website,
        rating,
        metacriticUrl,
        developers,
        genres,
        publishers,
        esrbRating,
        descriptionRaw,
      ];
}
