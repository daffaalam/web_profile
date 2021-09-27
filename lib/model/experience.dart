part of 'personal_data.dart';

class Experience {
  Experience({
    required this.title,
    required this.period,
  });

  String title;
  String period;

  factory Experience.fromJson(String str) {
    return Experience.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Experience.fromMap(Map<String, dynamic> json) {
    return Experience(
      title: json["title"],
      period: json["period"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "period": period,
    };
  }
}
