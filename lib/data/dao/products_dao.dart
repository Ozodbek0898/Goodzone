


import 'package:floor/floor.dart';
import 'package:flutter_goodzone1/data/entities/popular_entity.dart';


@dao
abstract class ProductsDao{


  @Query('SELECT * FROM Products')
  Stream<List<Products>> getProducts();

  @Query('SELECT * FROM Products WHERE id =:id')
  Stream<Products?> getProductsById(int id);


  @insert
  Future<void> insertProducts(Products products);


  @update
  Future<void> updateProducts(Products products);


  @delete
  Future<void> deleteProducts(Products products);
}