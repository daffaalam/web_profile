part of 'personal_data.dart';

class SocialMedia {
  SocialMedia({
    required this.title,
    this.image = '',
    required this.url,
  });

  String title;
  String image;
  String url;

  factory SocialMedia.fromJson(String str) {
    return SocialMedia.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory SocialMedia.fromMap(Map<String, dynamic> json) {
    return SocialMedia(
      title: json["title"],
      image: json["image"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "image": image,
      "url": url,
    };
  }
}
