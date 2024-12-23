class MovieActorsModel {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartament;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final int? order;

  MovieActorsModel(
      this.adult,
      this.gender,
      this.id,
      this.knownForDepartament,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order);

  factory MovieActorsModel.fromJson(Map<String, dynamic> json) {
    return MovieActorsModel(
      json['adult'],
      json['gender'],
      json['id'],
      json['known_for_department'],
      json['name'],
      json['original_name'],
      json['popularity'],
      json['profile_path'],
      json['cast_id'],
      json['character'],
      json['credit_id'],
      json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "adult": adult,
      "gender": gender,
      "id": id,
      "known_for_department": knownForDepartament,
      "name": name,
      "original_name": originalName,
      "popularity": popularity,
      "profile_path": profilePath,
      "cast_id": castId,
      "character": character,
      "credit_id": creditId,
      "order": order
    };
  }
}
