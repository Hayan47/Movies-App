class MovieDetails {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieDetails(
      {adult,
      backdropPath,
      belongsToCollection,
      budget,
      genres,
      homepage,
      id,
      imdbId,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      productionCompanies,
      productionCountries,
      releaseDate,
      revenue,
      runtime,
      spokenLanguages,
      status,
      tagline,
      title,
      video,
      voteAverage,
      voteCount});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    if (json['belongs_to_collection'] != null) {
      belongsToCollection =
          BelongsToCollection.fromJson(json['belongs_to_collection']);
    }
    budget = json['budget'];
    genres = json['genres']
            ?.map<Genres>((genre) => Genres.fromJson(genre))
            ?.toList() ??
        [];
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    productionCompanies = json['production_companies']
            ?.map<ProductionCompanies>((productionCompanie) =>
                ProductionCompanies.fromJson(productionCompanie))
            ?.toList() ??
        [];
    productionCountries = json['production_countries']
            ?.map<ProductionCountries>((productionCountrie) =>
                ProductionCountries.fromJson(productionCountrie))
            ?.toList() ??
        [];
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    spokenLanguages = json['spoken_languages']
            ?.map<SpokenLanguages>(
                (spokenLanguage) => SpokenLanguages.fromJson(spokenLanguage))
            ?.toList() ??
        [];
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['adult'] = adult;
  //   data['backdrop_path'] = backdropPath;
  //   data['belongs_to_collection'] = belongsToCollection?.toJson();
  //   data['budget'] = budget;
  //   data['genres'] = genres?.map((v) => v.toJson()).toList() ?? [];
  //   data['homepage'] = homepage;
  //   data['id'] = id;
  //   data['imdb_id'] = imdbId;
  //   data['original_language'] = originalLanguage;
  //   data['original_title'] = originalTitle;
  //   data['overview'] = overview;
  //   data['popularity'] = popularity;
  //   data['poster_path'] = posterPath;
  //   data['production_companies'] =
  //       productionCompanies?.map((v) => v.toJson()).toList() ?? [];
  //   data['production_countries'] =
  //       productionCountries?.map((v) => v.toJson()).toList() ?? [];
  //   data['release_date'] = releaseDate;
  //   data['revenue'] = revenue;
  //   data['runtime'] = runtime;
  //   data['spoken_languages'] =
  //       spokenLanguages?.map((v) => v.toJson()).toList() ?? [];
  //   data['status'] = status;
  //   data['tagline'] = tagline;
  //   data['title'] = title;
  //   data['video'] = video;
  //   data['vote_average'] = voteAverage;
  //   data['vote_count'] = voteCount;
  //   return data;
  // }
}

class BelongsToCollection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({id, name, posterPath, backdropPath});

  BelongsToCollection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['poster_path'] = posterPath;
  //   data['backdrop_path'] = backdropPath;
  //   return data;
  // }
}

class Genres {
  int? id;
  String? name;

  Genres({id, name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = name;
  //   return data;
  // }
}

class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({id, logoPath, name, originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['logo_path'] = logoPath;
  //   data['name'] = name;
  //   data['origin_country'] = originCountry;
  //   return data;
  // }
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({iso31661, name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['iso_3166_1'] = iso31661;
  //   data['name'] = name;
  //   return data;
  // }
}

class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({englishName, iso6391, name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['english_name'] = englishName;
  //   data['iso_639_1'] = iso6391;
  //   data['name'] = name;
  //   return data;
  // }
}
