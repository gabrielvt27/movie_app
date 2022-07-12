class Movies {
  Movies({
    required this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.totalResults,
    required this.public,
    required this.revenue,
    required this.page,
    required this.listMovie,
    required this.iso_639_1,
    required this.totalPages,
    required this.description,
    required this.createdBy,
    required this.iso_3166_1,
    required this.averageRating,
    required this.runtime,
    required this.name,
  });

  late final String posterPath;
  late final int id;
  late final String backdropPath;
  late final int totalResults;
  late final bool public;
  late final int revenue;
  late final int page;
  late final List<Movie> listMovie;
  late final String iso_639_1;
  late final int totalPages;
  late final String description;
  late final CreatedBy createdBy;
  late final String iso_3166_1;
  late final double averageRating;
  late final int runtime;
  late final String name;

  Movies.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    id = json['id'];
    backdropPath = json['backdrop_path'];
    totalResults = json['total_results'];
    public = json['public'];
    revenue = json['revenue'];
    page = json['page'];
    listMovie =
        List.from(json['results']).map((e) => Movie.fromJson(e)).toList();
    iso_639_1 = json['iso_639_1'];
    totalPages = json['total_pages'];
    description = json['description'];
    createdBy = CreatedBy.fromJson(json['created_by']);
    iso_3166_1 = json['iso_3166_1'];
    averageRating = json['average_rating'] + .0;
    runtime = json['runtime'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['poster_path'] = posterPath;
    data['id'] = id;
    data['backdrop_path'] = backdropPath;
    data['total_results'] = totalResults;
    data['public'] = public;
    data['revenue'] = revenue;
    data['page'] = page;
    data['listMovie'] = listMovie.map((e) => e.toJson()).toList();
    data['iso_639_1'] = iso_639_1;
    data['total_pages'] = totalPages;
    data['description'] = description;
    data['created_by'] = createdBy.toJson();
    data['iso_3166_1'] = iso_3166_1;
    data['average_rating'] = averageRating;
    data['runtime'] = runtime;
    data['name'] = name;
    return data;
  }

  Movies copyWith({
    String? posterPath,
    int? id,
    String? backdropPath,
    int? totalResults,
    bool? public,
    int? revenue,
    int? page,
    List<Movie>? listMovie,
    String? iso_639_1,
    int? totalPages,
    String? description,
    CreatedBy? createdBy,
    String? iso_3166_1,
    double? averageRating,
    int? runtime,
    String? name,
  }) {
    return Movies(
      posterPath: posterPath ?? this.posterPath,
      id: id ?? this.id,
      backdropPath: backdropPath ?? this.backdropPath,
      totalResults: totalResults ?? this.totalResults,
      public: public ?? this.public,
      revenue: revenue ?? this.revenue,
      page: page ?? this.page,
      listMovie: listMovie ?? this.listMovie,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      totalPages: totalPages ?? this.totalPages,
      description: description ?? this.description,
      createdBy: createdBy ?? this.createdBy,
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      averageRating: averageRating ?? this.averageRating,
      runtime: runtime ?? this.runtime,
      name: name ?? this.name,
    );
  }
}

class Movie {
  Movie({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.originalTitle,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });
  late final String posterPath;
  late final bool adult;
  late final String overview;
  late final String releaseDate;
  late final String originalTitle;
  late final List<int> genreIds;
  late final int id;
  late final String mediaType;
  late final String originalLanguage;
  late final String title;
  late final String backdropPath;
  late final double popularity;
  late final int voteCount;
  late final bool video;
  late final double voteAverage;

  Movie.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    originalTitle = json['original_title'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'] + .0;
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = json['vote_average'] + .0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['poster_path'] = posterPath;
    data['adult'] = adult;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    data['original_title'] = originalTitle;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['media_type'] = mediaType;
    data['original_language'] = originalLanguage;
    data['title'] = title;
    data['backdrop_path'] = backdropPath;
    data['popularity'] = popularity;
    data['vote_count'] = voteCount;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    return data;
  }
}

class CreatedBy {
  CreatedBy({
    required this.gravatarHash,
    required this.name,
    required this.username,
  });
  late final String gravatarHash;
  late final String name;
  late final String username;

  CreatedBy.fromJson(Map<String, dynamic> json) {
    gravatarHash = json['gravatar_hash'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['gravatar_hash'] = gravatarHash;
    data['name'] = name;
    data['username'] = username;
    return data;
  }
}
