class SearchHomeModel {
  final String? title;
  final String? year;
  final String? imdbID;
  final String? type;
  final String poster;

  SearchHomeModel({
    required this.imdbID,
    required this.poster,
    required this.title,
    required this.type,
    required this.year,
  });

  factory SearchHomeModel.fromJson(Map<String, dynamic> json) {
    return SearchHomeModel(
        imdbID: json['imdbID'],
        poster: json['Poster'],
        title: json['Title'],
        type: json['Type'],
        year: json['Year']);
  }

  Map<String, dynamic> toJson() {
    return {
      "Title": title,
      "Year": year,
      "imdbID": imdbID,
      "Type": type,
      "Poster": poster
    };
  }
}
