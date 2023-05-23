import 'package:json_annotation/json_annotation.dart';

part 'character_response_model.g.dart';

@JsonSerializable()
class CharacterResponseModel {
  final Info? info;
  final List<Result>? results;

  CharacterResponseModel({this.info, this.results});

  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) => _$CharacterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseModelToJson(this);
}

@JsonSerializable()
class Info {
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  Info({this.count, this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class Result {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final Origin? origin;
  final Location? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  Result(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Origin {
  final String? name;
  final String? url;

  Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}

@JsonSerializable()
class Location {
  final String? name;
  final String? url;

  Location({this.name, this.url});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
