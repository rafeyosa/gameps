import 'esrb_rating_model.dart';
import 'genre_model.dart';

class GameModel {
  String? name;
  String? released;
  bool? tba;
  String? backgroundImage;
  double? rating;
  int? metacritic;
  String? updated;
  int? id;
  EsrbRatingModel? esrbRating;
  List<GenreModel>? genres;

  GameModel({
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.metacritic,
    this.updated,
    this.id,
    this.esrbRating,
    this.genres,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        name: json["name"],
        released: json["released"],
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"]?.toDouble(),
        metacritic: json["metacritic"],
        updated: json["updated"],
        id: json["id"],
        esrbRating: json["esrb_rating"] == null
            ? null
            : EsrbRatingModel.fromJson(json["esrb_rating"]),
        genres: json["genres"] == null
            ? []
            : List<GenreModel>.from(
                json["genres"]!.map((x) => GenreModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "released": released,
        "tba": tba,
        "background_image": backgroundImage,
        "rating": rating,
        "metacritic": metacritic,
        "updated": updated,
        "id": id,
        "esrb_rating": esrbRating?.toJson(),
        "genres": genres == null
            ? []
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
      };
}
