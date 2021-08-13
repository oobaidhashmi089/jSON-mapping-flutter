import 'dart:convert';
import 'dart:convert';
import 'package:automap/automap.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/Songs.dart';
import 'package:music_app/musicmodel.dart';

class Api extends StatefulWidget {
  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {
  @override
  initState() {
    super.initState();
    musicget();
  }

  musicget() async {
    // var musicresponse = await http.get(Uri.http('jsonplaceholder.typicode.com', 'albums/1/photos'));
    var music = [];
    var musicresponse = await rootBundle.loadString("asset/files/music.json");
    var jsonData = jsonDecode(musicresponse);
    var songsData = jsonData["songs"];
    MusicModel.songs = List.from(songsData)
        .map<Songs>((songs) => Songs.fromMap(songs))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      body: Stack(children: [
    Center(
        child: ListView.builder(
      itemCount: MusicModel.songs.length,
      itemBuilder: (context,index){
        return 



      },

    )),
  ]));
}




