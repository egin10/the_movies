class SpokenLanguage {
  SpokenLanguage({
    this.englishName,
    this.iso6391,
    this.name,
  });

  String? englishName;
  String? iso6391;
  String? name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
