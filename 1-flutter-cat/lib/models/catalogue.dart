import 'dart:convert';

class Catalogue {
  static List<CatalogueItem>? items;
}

class CatalogueItem {
  final int id;
  final String name, desc, colour, img;
  final num price;

  CatalogueItem({
    required this.id,
    required this.name,
    required this.desc,
    required this.colour,
    required this.img,
    required this.price,
  });

  /* factory CatalogueItem.fromMap(Map<String, dynamic> map) {
    return CatalogueItem(
      id: map['id'],
      name: map['name'],
      colour: map['colour'],
      desc: map['desc'],
      img: map['img'],
      price: map['price'],
    );
  }

  toMap() => {
    'id': id,
    'name': name,
    'colour': colour,
    'desc': desc,
    'img': img,
    'price': price,
  }; */

  CatalogueItem copyWith({
    int? id,
    String? name,
    String? desc,
    String? colour,
    String? img,
    num? price,
  }) {
    return CatalogueItem(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      colour: colour ?? this.colour,
      img: img ?? this.img,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'colour': colour,
      'img': img,
      'price': price,
    };
  }

  factory CatalogueItem.fromMap(Map<String, dynamic> map) {
    return CatalogueItem(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      colour: map['colour'],
      img: map['img'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CatalogueItem.fromJson(String source) => CatalogueItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CatalogueItem(id: $id, name: $name, desc: $desc, colour: $colour, img: $img, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CatalogueItem &&
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.colour == colour &&
      other.img == img &&
      other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      colour.hashCode ^
      img.hashCode ^
      price.hashCode;
  }
}
