// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Items {
  final String name;
  final String date;
  final int instock;
  final double price;
  final int sold;
  final String description;
  final String imgurl;
  final int total;
  final double rating;
  Items({
    required this.name,
    required this.date,
    required this.instock,
    required this.price,
    required this.sold,
    required this.description,
    required this.imgurl,
    required this.total,
    required this.rating,
  });

  Items copyWith({
    String? name,
    String? date,
    int? instock,
    double? price,
    int? sold,
    String? description,
    String? imgurl,
    int? total,
    double? rating,
  }) {
    return Items(
      name: name ?? this.name,
      date: date ?? this.date,
      instock: instock ?? this.instock,
      price: price ?? this.price,
      sold: sold ?? this.sold,
      description: description ?? this.description,
      imgurl: imgurl ?? this.imgurl,
      total: total ?? this.total,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'date': date,
      'instock': instock,
      'price': price,
      'sold': sold,
      'description': description,
      'imgurl': imgurl,
      'total': total,
      'rating': rating,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      name: map['name'] as String,
      date: map['date'] as String,
      instock: map['instock'] as int,
      price: map['price'] as double,
      sold: map['sold'] as int,
      description: map['description'] as String,
      imgurl: map['imgurl'] as String,
      total: map['total'] as int,
      rating: map['rating'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Items(name: $name, date: $date, instock: $instock, price: $price, sold: $sold, description: $description, imgurl: $imgurl, total: $total, rating: $rating)';
  }

  @override
  bool operator ==(covariant Items other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.date == date &&
      other.instock == instock &&
      other.price == price &&
      other.sold == sold &&
      other.description == description &&
      other.imgurl == imgurl &&
      other.total == total &&
      other.rating == rating;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      date.hashCode ^
      instock.hashCode ^
      price.hashCode ^
      sold.hashCode ^
      description.hashCode ^
      imgurl.hashCode ^
      total.hashCode ^
      rating.hashCode;
  }
}
