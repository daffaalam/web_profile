part of 'personal_data.dart';

class Skill {
  Skill({
    required this.title,
    required this.rating,
  });

  String title;
  int rating;

  factory Skill.fromJson(String str) {
    return Skill.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Skill.fromMap(Map<String, dynamic> json) {
    return Skill(
      title: json["title"],
      rating: json["rating"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "rating": rating,
    };
  }
}
