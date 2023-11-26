// To parse this JSON data, do
//
//     final moviesModel = moviesModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<MoviesModel> moviesModelFromJson(String str) => List<MoviesModel>.from(
    json.decode(str).map((x) => MoviesModel.fromJson(x)));

String moviesModelToJson(List<MoviesModel> data) =>
    json.encode(List<dynamic>.from(data.map((MoviesModel x) => x.toJson())));

class MoviesModel {
  MoviesModel({
    this.score,
    this.show,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        score: json['score']?.toDouble() ?? 0.0,
        show: json['show'] == null ? Show() : Show.fromJson(json['show']),
      );
  double? score;
  Show? show;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'score': score,
        'show': show?.toJson(),
      };
}

class Show {
  Show({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
  });

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        id: json['id'] ?? 0,
        url: json['url'] ?? '',
        name: json['name'] ?? '',
        type: typeValues.map[json['type']] ?? Type.DOCUMENTARY,
        language: languageValues.map[json['language']] ?? Language.ENGLISH,
        genres: json['genres'] == null
            ? <String>[]
            : List<String>.from(json['genres']!.map((x) => x)),
        status: statusValues.map[json['status']] ?? Status.ENDED,
        runtime: json['runtime'] ?? 0,
        averageRuntime: json['averageRuntime'] ?? 0,
        premiered: json['premiered'] == null
            ? DateTime.now()
            : DateTime.parse(json['premiered']),
        ended: json['ended'] == null
            ? DateTime.now()
            : DateTime.parse(json['ended']),
        officialSite: json['officialSite'] ?? '',
        schedule: json['schedule'] == null
            ? Schedule()
            : Schedule.fromJson(json['schedule']),
        rating:
            json['rating'] == null ? Rating() : Rating.fromJson(json['rating']),
        weight: json['weight'] ?? 0,
        network: json['network'] == null
            ? Network()
            : Network.fromJson(json['network']),
        webChannel: json['webChannel'] == null
            ? Network()
            : Network.fromJson(json['webChannel']),
        dvdCountry: json['dvdCountry'],
        externals: json['externals'] == null
            ? Externals()
            : Externals.fromJson(json['externals']),
        image: json['image'] == null ? null : Image.fromJson(json['image']),
        summary: json['summary'] ?? '',
        updated: json['updated'] ?? 0,
        links:
            json['_links'] == null ? Links() : Links.fromJson(json['_links']),
      );
  int? id;
  String? url;
  String? name;
  Type? type;
  Language? language;
  List<String>? genres;
  Status? status;
  int? runtime;
  int? averageRuntime;
  DateTime? premiered;
  DateTime? ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  int? weight;
  Network? network;
  Network? webChannel;
  dynamic dvdCountry;
  Externals? externals;
  Image? image;
  String? summary;
  int? updated;
  Links? links;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'url': url,
        'name': name,
        'type': typeValues.reverse[type],
        'language': languageValues.reverse[language],
        'genres': genres == null
            ? <String>[]
            : List<dynamic>.from(genres!.map((String x) => x)),
        'status': statusValues.reverse[status],
        'runtime': runtime,
        'averageRuntime': averageRuntime,
        'premiered':
            "${premiered!.year.toString().padLeft(4, '0')}-${premiered!.month.toString().padLeft(2, '0')}-${premiered!.day.toString().padLeft(2, '0')}",
        'ended':
            "${ended!.year.toString().padLeft(4, '0')}-${ended!.month.toString().padLeft(2, '0')}-${ended!.day.toString().padLeft(2, '0')}",
        'officialSite': officialSite,
        'schedule': schedule?.toJson(),
        'rating': rating?.toJson(),
        'weight': weight,
        'network': network?.toJson(),
        'webChannel': webChannel?.toJson(),
        'dvdCountry': dvdCountry,
        'externals': externals?.toJson(),
        'image': image?.toJson(),
        'summary': summary,
        'updated': updated,
        '_links': links?.toJson(),
      };
}

class Externals {
  Externals({
    this.tvrage,
    this.thetvdb,
    this.imdb,
  });

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json['tvrage'] ?? 0,
        thetvdb: json['thetvdb'] ?? 0,
        imdb: json['imdb'] ?? '',
      );
  dynamic tvrage;
  int? thetvdb;
  String? imdb;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'tvrage': tvrage,
        'thetvdb': thetvdb,
        'imdb': imdb,
      };
}

class Image {
  Image({
    this.medium,
    this.original,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json['medium'] ?? "",
        original: json['original'] ?? '',
      );
  String? medium;
  String? original;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'medium': medium,
        'original': original,
      };
}

enum Language { BULGARIAN, ENGLISH, KOREAN }

final EnumValues<Language> languageValues = EnumValues(<String, Language>{
  'Bulgarian': Language.BULGARIAN,
  'English': Language.ENGLISH,
  'Korean': Language.KOREAN
});

class Links {
  Links({
    this.self,
    this.previousepisode,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json['self'] == null
            ? Previousepisode()
            : Previousepisode.fromJson(json['self']),
        previousepisode: json['previousepisode'] == null
            ? Previousepisode()
            : Previousepisode.fromJson(json['previousepisode']),
      );
  Previousepisode? self;
  Previousepisode? previousepisode;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'self': self?.toJson(),
        'previousepisode': previousepisode?.toJson(),
      };
}

class Previousepisode {
  Previousepisode({
    this.href,
  });

  factory Previousepisode.fromJson(Map<String, dynamic> json) =>
      Previousepisode(
        href: json['href'] ?? '',
      );
  String? href;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'href': href,
      };
}

class Network {
  Network({
    this.id,
    this.name,
    this.country,
    this.officialSite,
  });

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        country: json['country'] == null
            ? Country()
            : Country.fromJson(json['country']),
        officialSite: json['officialSite'] ?? '',
      );
  int? id;
  String? name;
  Country? country;
  String? officialSite;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'country': country?.toJson(),
        'officialSite': officialSite,
      };
}

class Country {
  Country({
    this.name,
    this.code,
    this.timezone,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json['name'] ?? '',
        code: json['code'] ?? '',
        timezone: json['timezone'] ?? '',
      );
  String? name;
  String? code;
  String? timezone;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'code': code,
        'timezone': timezone,
      };
}

class Rating {
  Rating({
    this.average,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json['average']?.toDouble() ?? 0.0,
      );
  double? average;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'average': average,
      };
}

class Schedule {
  Schedule({
    this.time,
    this.days,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json['time'] ?? '',
        days: json['days'] == null
            ? <String>[]
            : List<String>.from(json['days']!.map((x) => x)),
      );
  String? time;
  List<String>? days;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'time': time,
        'days': days == null
            ? <String>[]
            : List<dynamic>.from(days!.map((String x) => x)),
      };
}

enum Status { ENDED, IN_DEVELOPMENT, RUNNING }

final EnumValues<Status> statusValues = EnumValues(<String, Status>{
  'Ended': Status.ENDED,
  'In Development': Status.IN_DEVELOPMENT,
  'Running': Status.RUNNING
});

enum Type { DOCUMENTARY, SCRIPTED, VARIETY }

final EnumValues<Type> typeValues = EnumValues(<String, Type>{
  'Documentary': Type.DOCUMENTARY,
  'Scripted': Type.SCRIPTED,
  'Variety': Type.VARIETY
});

class EnumValues<T> {
  EnumValues(this.map);
  Map<String, T> map;
  late Map<T, String> reverseMap;

  Map<T, String> get reverse {
    reverseMap = map.map((String k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
