import 'dart:convert';

part 'creation.dart';
part 'experience.dart';
part 'skill.dart';
part 'social_media.dart';

class PersonalData {
  PersonalData({
    required this.name,
    required this.image,
    this.descSimple = '-',
    this.descFull = '-',
    this.email = '-',
    this.lastUpdate = '-',
    this.source = 'https://github.com/',
    this.socialMedia = const <SocialMedia>[],
    this.skills = const <Skill>[],
    this.experiences = const <Experience>[],
    this.creations = const <Creation>[],
  });

  String name;
  String image;
  String descSimple;
  String descFull;
  String email;
  String lastUpdate;
  String source;
  List<SocialMedia> socialMedia;
  List<Skill> skills;
  List<Experience> experiences;
  List<Creation> creations;

  factory PersonalData.fromJson(String str) {
    return PersonalData.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory PersonalData.fromMap(Map<String, dynamic> json) {
    return PersonalData(
      name: json["name"],
      image: json["image"],
      descSimple: json["desc_simple"],
      descFull: json["desc_full"],
      email: json["email"],
      lastUpdate: json["last_update"],
      source: json["source"],
      socialMedia: List<SocialMedia>.from(json["social_media"].map((x) {
        return SocialMedia.fromMap(x);
      })),
      skills: List<Skill>.from(json["skills"].map((x) {
        return Skill.fromMap(x);
      })),
      experiences: List<Experience>.from(json["experiences"].map((x) {
        return Experience.fromMap(x);
      })),
      creations: List<Creation>.from(json["creations"].map((x) {
        return Creation.fromMap(x);
      })),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "name": name,
      "image": image,
      "desc_simple": descSimple,
      "desc_full": descFull,
      "email": email,
      "last_update": lastUpdate,
      "source": source,
      "social_media": List<dynamic>.from(socialMedia.map((x) {
        return x.toMap();
      })),
      "skills": List<dynamic>.from(skills.map((x) {
        return x.toMap();
      })),
      "experiences": List<dynamic>.from(experiences.map((x) {
        return x.toMap();
      })),
      "creations": List<dynamic>.from(creations.map((x) {
        return x.toMap();
      })),
    };
  }

  @override
  String toString() => toJson();
}
