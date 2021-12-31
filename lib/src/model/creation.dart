part of 'personal_data.dart';

class Creation {
  Creation({
    required this.title,
    required this.url,
  });

  String title;
  String url;

  factory Creation.fromJson(String str) {
    return Creation.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Creation.fromMap(Map<String, dynamic> json) {
    return Creation(
      title: json["title"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "title": title,
      "url": url,
    };
  }

  @override
  String toString() => toJson();
}
