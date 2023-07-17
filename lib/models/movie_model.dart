class MovieModel {
  int? page;
  List<Results>? results;

  MovieModel({this.page, this.results});

  MovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  bool? adult;
  int? id;
  String? originalLanguage;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  num? voteAverage;

  Results({
    this.adult,
    this.id,
    this.originalLanguage,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    id = json['id'];
    originalLanguage = json['original_language'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }
}
