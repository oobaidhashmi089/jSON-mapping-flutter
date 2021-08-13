import 'dart:convert';
import 'dart:convert';
import 'dart:convert';
import 'package:automap/automap.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/Songs.dart';

class Songs {
  final String title;
  final String artist;
  final String year;
  final String web_url;

  static var lenght;

  Songs({
    required this.title,
    required this.artist,
    required this.year,
    required this.web_url,
  });

  Songs copyWith({
    required String title,
    required String artist,
    required String year,
    required String web_Url,
  }) {
    return Songs(
      title: title,
      artist: artist,
      year: year,
      web_url: web_Url,
    );
  }

  // Songs merge(Songs model) {
  //   return Songs(
  //     title: model.title ?? this.title,
  //     artist: model.artist ?? this.artist,
  //     year: model.year ?? this.year,
  //     web_url: model.web_url ?? this.web_url,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'artist': artist,
      'year': year,
      'web_url': web_url,
    };
  }

  factory Songs.fromMap(Map<String, dynamic> map) {
    //if (map == null) return null;

    return Songs(
      title: map['title'],
      artist: map['artist'],
      year: map['year'],
      web_url: map['web_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Songs.fromJson(String source) => Songs.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Songs(title: $title, artist: $artist, year: $year, webUrl: $web_url)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Songs &&
        o.title == title &&
        o.artist == artist &&
        o.year == year &&
        o.web_url == web_url;
  }

  @override
  int get hashCode {
    return title.hashCode ^ artist.hashCode ^ year.hashCode ^ web_url.hashCode;
  }
}
