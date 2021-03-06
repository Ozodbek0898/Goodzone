import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_goodzone1/data/dao/products_dao.dart';
import 'package:flutter_goodzone1/data/entities/popular_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Products])
abstract class ProductDatabase extends FloorDatabase {
  ProductsDao get productDao;

  static ProductDatabase? instance;

  static Future<void> init() async {
    instance =
        await $FloorProductDatabase.databaseBuilder('goodzone.db').build();
  }

  static getInstance() async {
    if (instance == null) await init();
    return instance;
  }
}
