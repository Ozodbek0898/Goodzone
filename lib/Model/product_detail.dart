class ProductDetail {
  Product? product;

  ProductDetail({this.product});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? slug;
  CategoryDetail? category;
  dynamic additionalCategories;
  List<RelatedProducts>? relatedProducts;
  Brand? brand;
  String? previewText;
  String? description;
  bool? active;
  dynamic properties;
  List<Prices>? prices;
  Price? price;
  String? image;
  List<String>? gallery;
  dynamic averageRate;
  String? reviewsCount;
  Meta? meta;
  String? externalId;
  String? code;
  String? createdAt;
  String? updatedAt;
  InStock? inStock;

  Product(
      {this.id,
      this.name,
      this.slug,
      this.category,
      this.additionalCategories,
      this.relatedProducts,
      this.brand,
      this.previewText,
      this.description,
      this.active,
      this.properties,
      this.prices,
      this.price,
      this.image,
      this.gallery,
      this.averageRate,
      this.reviewsCount,
      this.meta,
      this.externalId,
      this.code,
      this.createdAt,
      this.updatedAt,
      this.inStock});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'] != null
        ? new CategoryDetail.fromJson(json['category'])
        : null;
    additionalCategories = json['additional_categories'];
    relatedProducts = <RelatedProducts>[];
    if (json['related_products'] != null) {
      json['related_products'].forEach((v) {
        relatedProducts!.add(new RelatedProducts.fromJson(v));
      });
    }
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    previewText = json['preview_text'];
    description = json['description'];
    active = json['active'];
    properties = json['properties'];
    prices = <Prices>[];
    if (json['prices'] != null) {
      json['prices'].forEach((v) {
        prices!.add(new Prices.fromJson(v));
      });
    }
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    image = json['image'];
    gallery = [];
    if (json['gallery'] != null) gallery = json['gallery'].cast<String>();
    averageRate = json['average_rate'];
    reviewsCount = json['reviews_count'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    externalId = json['external_id'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    inStock = json['in_stock'] != null
        ? new InStock.fromJson(json['in_stock'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['additional_categories'] = this.additionalCategories;
    if (this.relatedProducts != null) {
      data['related_products'] =
          this.relatedProducts!.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['preview_text'] = this.previewText;
    data['description'] = this.description;
    data['active'] = this.active;
    data['properties'] = this.properties;
    if (this.prices != null) {
      data['prices'] = this.prices!.map((v) => v.toJson()).toList();
    }
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['image'] = this.image;
    data['gallery'] = this.gallery;
    data['average_rate'] = this.averageRate;
    data['reviews_count'] = this.reviewsCount;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['external_id'] = this.externalId;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.inStock != null) {
      data['in_stock'] = this.inStock!.toJson();
    }
    return data;
  }
}

class CategoryDetail {
  String? id;
  String? name;
  String? slug;
  Parent? parent;
  bool? active;
  String? order;
  String? image;

  CategoryDetail(
      {this.id,
      this.name,
      this.slug,
      this.parent,
      this.active,
      this.order,
      this.image});

  CategoryDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    active = json['active'];
    order = json['order'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    data['active'] = this.active;
    data['order'] = this.order;
    data['image'] = this.image;
    return data;
  }
}

class Parent {
  String? id;
  String? name;
  String? slug;
  bool? active;
  String? description;
  String? order;
  String? image;
  String? createdAt;
  String? updatedAt;

  Parent(
      {this.id,
      this.name,
      this.slug,
      this.active,
      this.description,
      this.order,
      this.image,
      this.createdAt,
      this.updatedAt});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    active = json['active'];
    description = json['description'];
    order = json['order'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['active'] = this.active;
    data['description'] = this.description;
    data['order'] = this.order;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class RelatedProducts {
  String? id;
  String? name;
  String? slug;
  CategoryDetail? category;
  Brand? brand;
  String? previewText;
  bool? active;
  Price? price;
  List<Prices>? prices;
  String? image;
  String? externalId;
  String? code;
  String? createdAt;
  String? updatedAt;
  InStock? inStock;

  RelatedProducts(
      {this.id,
      this.name,
      this.slug,
      this.category,
      this.brand,
      this.previewText,
      this.active,
      this.price,
      this.prices,
      this.image,
      this.externalId,
      this.code,
      this.createdAt,
      this.updatedAt,
      this.inStock});

  RelatedProducts.fromJson(Map<String, dynamic> json) {
    prices = <Prices>[];
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'] != null
        ? new CategoryDetail.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    previewText = json['preview_text'];
    active = json['active'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    if (json['prices'] != null) {
      json['prices'].forEach((v) {
        prices!.add(new Prices.fromJson(v));
      });
    }
    image = json['image'];
    externalId = json['external_id'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    inStock = json['in_stock'] != null
        ? new InStock.fromJson(json['in_stock'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['preview_text'] = this.previewText;
    data['active'] = this.active;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    if (this.prices != null) {
      data['prices'] = this.prices!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    data['external_id'] = this.externalId;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.inStock != null) {
      data['in_stock'] = this.inStock!.toJson();
    }
    return data;
  }
}

class Brand {
  String? id;
  String? name;
  String? slug;
  bool? active;
  String? previewText;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? order;

  Brand(
      {this.id,
      this.name,
      this.slug,
      this.active,
      this.previewText,
      this.description,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.order});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    active = json['active'];
    previewText = json['preview_text'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['active'] = this.active;
    data['preview_text'] = this.previewText;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['order'] = this.order;
    return data;
  }
}

class Price {
  String? price;
  String? oldPrice;

  Price({this.price, this.oldPrice});

  Price.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    oldPrice = json['old_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    return data;
  }
}

class Prices {
  String? id;
  String? type;
  String? price;
  String? oldPrice;

  Prices({this.id, this.type, this.price, this.oldPrice});

  Prices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    price = json['price'];
    oldPrice = json['old_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    return data;
  }
}

class InStock {
  bool? samarkand;
  bool? tashkentCity;

  InStock({this.samarkand, this.tashkentCity});

  InStock.fromJson(Map<String, dynamic> json) {
    samarkand = json['samarkand'];
    tashkentCity = json['tashkent_city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['samarkand'] = this.samarkand;
    data['tashkent_city'] = this.tashkentCity;
    return data;
  }
}

class Meta {
  String? title;
  String? description;
  String? tags;

  Meta({this.title, this.description, this.tags});

  Meta.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['tags'] = this.tags;
    return data;
  }
}
