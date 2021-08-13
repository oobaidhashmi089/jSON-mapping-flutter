import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_ob/widgets/home_widgets/cataloglist.dart';
import 'package:flutter_application_ob/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_ob/model/catapp.dart';
import 'package:flutter_application_ob/widgets/drawer.dart';
import 'package:flutter_application_ob/widgets/items.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get child => null;

  @override
  void initState() {
    super.initState();
    dataload();
  }

  dataload() async {
    await Future.delayed(Duration(seconds: 2));
    final json = await rootBundle.loadString("asset/files/app.json");
    final decodedData = jsonDecode(json);
    var productsData = decodedData["products"];
    Mitems.items = List.from(productsData)
        .map<Items>((item) => Items.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
              child: Image.asset(
            'asset/windows_10_store.png',
            height: 100,
            width: 100,
          )),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  CupertinoIcons.shopping_cart,
                  color: Colors.black,
                ),
                onPressed: () {
                  // do something
                }),
          ]),
      drawer: Mdrawer(),
      body: SafeArea(
        child: Container(
            color: Colors.white,
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Saint-Étienne APP".text.bold.xl5.black.center.make(),
                "Atlético mineiro".text.xl.blueGray500.make(),
                if (Mitems.items != null && Mitems.items.isNotEmpty)
                  CatalogList().expand()
                else
                  CircularProgressIndicator(color: Colors.black)
                      .centered()
                      .expand(),
              ],
            )),
      ),
    ));
  }
}





