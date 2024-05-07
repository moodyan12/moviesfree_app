// To parse this JSON data, do
//
//     final film = filmFromJson(jsonString);

import 'dart:convert';

List<Film> filmFromJson(String str) => List<Film>.from(json.decode(str).map((x) => Film.fromJson(x)));

String filmToJson(List<Film> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Film {
  DateTime? createdAt;
  String? title;
  String? overview;
  String? videoTrailer;
  String? video;
  String? cover;
  String? id;

  Film({
    this.createdAt,
    this.title,
    this.overview,
    this.videoTrailer,
    this.video,
    this.cover,
    this.id,
  });

  factory Film.fromJson(Map<String, dynamic> json) => Film(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        title: json["title"],
        overview: json["overview"],
        videoTrailer: json["video_trailer"],
        video: json["video"],
        cover: json["cover"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "title": title,
        "overview": overview,
        "video_trailer": videoTrailer,
        "video": video,
        "cover": cover,
        "id": id,
      };
}
