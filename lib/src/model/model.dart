class Model {
  Model({
    this.id,
    this.type,
    this.infinitive,
    this.past,
    this.participle,
    this.spanish,
    this.pronInfinitive,
    this.pronPast,
    this.pronParticiple,
  });

  int id;
  int type;
  String infinitive;
  String past;
  String participle;
  String spanish;
  String pronInfinitive;
  String pronPast;
  String pronParticiple;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    id: json["id"],
    type: json["type"],
    infinitive: json["infinitive"],
    past: json["past"],
    participle: json["participle"],
    spanish: json["spanish"],
    pronInfinitive: json["pronInfinitive"],
    pronPast: json["pronPast"],
    pronParticiple: json["pronParticiple"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "infinitive": infinitive,
    "past": past,
    "participle": participle,
    "spanish": spanish,
    "pronInfinitive": pronInfinitive,
    "pronPast": pronPast,
    "pronParticiple": pronParticiple,
  };
}