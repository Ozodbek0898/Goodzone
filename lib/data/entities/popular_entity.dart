
import 'package:floor/floor.dart';
import 'package:flutter_goodzone1/Model/popular.dart';

@entity
class Products {
  @PrimaryKey(autoGenerate: false)
  String? id;
  bool favorite = false;
  bool recFavorite = false;
  String? name;
  String? price;

  String? title;
  String? image;

  Products({this.id,
    this.name,
    this.price,

    this.title,

    this.image,
    this.recFavorite = false,
    this.favorite = false,
  });
}
