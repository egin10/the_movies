class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  String? maximum;
  String? minimum;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: json["maximum"],
        minimum: json["minimum"],
      );

  Map<String, dynamic> toJson() => {
        "maximum": maximum,
        "minimum": minimum,
      };
}
