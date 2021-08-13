import 'dart:convert';

import 'package:flutter/widgets.dart';

class Items {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String img;

  Items({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.color,
    this.img,
  });
//   factory Items.fromMap(Map<String, dynamic> map) {
//     Items(
//       id: map["id"],
//       name: map["name"],
//       desc: map["desc"],
//       price: map["price"],
//       color: map["color"],
//       img: map["img"],
//     );
//   }
//   toMap() => {
//         "id": id,
//         "name": name,
//         "desc": desc,
//         "price": price,
//         "color": color,
//         "img": img,
//       };

  Items copyWith({
    int id,
    String name,
    String desc,
    num price,
    String color,
    String img,
  }) {
    return Items(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'img': img,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Items(id: $id, name: $name, desc: $desc, price: $price, color: $color, img: $img)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Items &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        img.hashCode;
  }
}

class Mitems {
  static List<Items> items;
  //[
  //   Items(
  //       id: 1,
  //       name: "Samsung Galaxy A32",
  //       desc: "In Stock",
  //       price: 20000,
  //       color: "",
  //       img:
  //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkBQ56_o6ibXAFeA5T92Usn7Q1qZSjj24Z6Q&usqp=CAU")
  // ];
}
