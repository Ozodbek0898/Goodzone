// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorProductDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProductDatabaseBuilder databaseBuilder(String name) =>
      _$ProductDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProductDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ProductDatabaseBuilder(null);
}

class _$ProductDatabaseBuilder {
  _$ProductDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ProductDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ProductDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ProductDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ProductDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ProductDatabase extends ProductDatabase {
  _$ProductDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ProductsDao? _productDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Products` (`id` TEXT PRIMARY KEY AUTOINCREMENT, `favorite` INTEGER NOT NULL, `recFavorite` INTEGER NOT NULL, `name` TEXT, `price` TEXT, `title` TEXT, `image` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProductsDao get productDao {
    return _productDaoInstance ??= _$ProductsDao(database, changeListener);
  }
}

class _$ProductsDao extends ProductsDao {
  _$ProductsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _productsInsertionAdapter = InsertionAdapter(
            database,
            'Products',
            (Products item) => <String, Object?>{
                  'id': item.id,
                  'favorite': item.favorite ? 1 : 0,
                  'recFavorite': item.recFavorite ? 1 : 0,
                  'name': item.name,
                  'price': item.price,
                  'title': item.title,
                  'image': item.image
                },
            changeListener),
        _productsUpdateAdapter = UpdateAdapter(
            database,
            'Products',
            ['id'],
            (Products item) => <String, Object?>{
                  'id': item.id,
                  'favorite': item.favorite ? 1 : 0,
                  'recFavorite': item.recFavorite ? 1 : 0,
                  'name': item.name,
                  'price': item.price,
                  'title': item.title,
                  'image': item.image
                },
            changeListener),
        _productsDeletionAdapter = DeletionAdapter(
            database,
            'Products',
            ['id'],
            (Products item) => <String, Object?>{
                  'id': item.id,
                  'favorite': item.favorite ? 1 : 0,
                  'recFavorite': item.recFavorite ? 1 : 0,
                  'name': item.name,
                  'price': item.price,
                  'title': item.title,
                  'image': item.image
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Products> _productsInsertionAdapter;

  final UpdateAdapter<Products> _productsUpdateAdapter;

  final DeletionAdapter<Products> _productsDeletionAdapter;

  @override
  Stream<List<Products>> getProducts() {
    return _queryAdapter.queryListStream('SELECT * FROM Products',
        mapper: (Map<String, Object?> row) => Products(
            id: row['id'] as String?,
            name: row['name'] as String?,
            price: row['price'] as String?,
            title: row['title'] as String?,
            image: row['image'] as String?,
            recFavorite: (row['recFavorite'] as int) != 0,
            favorite: (row['favorite'] as int) != 0),
        queryableName: 'Products',
        isView: false);
  }

  @override
  Stream<Products?> getProductsById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Products WHERE id =?1',
        mapper: (Map<String, Object?> row) => Products(
            id: row['id'] as String?,
            name: row['name'] as String?,
            price: row['price'] as String?,
            title: row['title'] as String?,
            image: row['image'] as String?,
            recFavorite: (row['recFavorite'] as int) != 0,
            favorite: (row['favorite'] as int) != 0),
        arguments: [id],
        queryableName: 'Products',
        isView: false);
  }

  @override
  Future<void> insertProducts(Products products) async {
    await _productsInsertionAdapter.insert(products, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProducts(Products products) async {
    await _productsUpdateAdapter.update(products, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteProducts(Products products) async {
    await _productsDeletionAdapter.delete(products);
  }
}
