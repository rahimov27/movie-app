class PopularMoviesModel {
  final bool? adult;
  final String? backDropPath;
  final String? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final String? video;
  final String? voteAverage;
  final String? voteCount;

  PopularMoviesModel(
      this.adult,
      this.backDropPath,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) {
    return PopularMoviesModel(
      json['adult'],
      json['backdrop_path'],
      json['id']?.toString(),
      json['original_language'],
      json['original_title'],
      json['overview'],
      json['popularity']?.toString(),
      json['poster_path'],
      json['release_date'],
      json['title'],
      json['video']?.toString(),
      json['vote_average']?.toString(),
      json['vote_count']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "adult": adult,
      "backdrop_path": backDropPath,
      "id": id,
      "original_language": originalLanguage,
      "original_title": originalTitle,
      "overview": overview,
      "popularity": popularity,
      "poster_path": posterPath,
      "release_date": releaseDate,
      "title": title,
      "video": video,
      "vote_average": voteAverage,
      "vote_count": voteCount,
    };
  }
}
