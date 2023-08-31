class ProductDetailModel {
  int? id;
  String? name;
  String? units;
  String? imageUrl;
  String? notes;
  bool? yellowCard;
  List<String>? categories;
  List<Vendors>? vendors;
  Reviews? reviews;
  String? dateAdded;

  ProductDetailModel(
      {this.id,
        this.name,
        this.units,
        this.imageUrl,
        this.notes,
        this.yellowCard,
        this.categories,
        this.vendors,
        this.reviews,
        this.dateAdded});

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
        id : json['id'],
        name : json['name'],
        units : json['units'],
    imageUrl : json['image_url'],
    notes : json['notes'],
    yellowCard : json['yellow_card'],
    categories : json['categories'].cast<String>(),
      vendors: List<dynamic>.from(json['vendors']).map((e) => Vendors.fromJson(e)).toList(),
    reviews : Reviews.fromJson(json['reviews']),
    dateAdded : json['date_added'],
    );
  }
}

class Vendors {
  int? id;
  bool? available;
  String? url;
  Price? price;
  String? vendor;

  Vendors({this.id, this.available, this.url, this.price, this.vendor});

  factory Vendors.fromJson(Map<String, dynamic> json) {
    return Vendors(
        id : json['id'],
        available : json['available'],
        url : json['url'],
    price : Price.fromJson(json['price']),
    vendor : json['vendor'],
    );
  }
}

class Price {
  String? price;
  String? currency;

  Price({this.price, this.currency});

 factory Price.fromJson(Map<String, dynamic> json) {
   return Price(
       price : json['price'],
       currency : json['currency'],
   );
  }
}

class Reviews {
  double? avgRating;
  int? ratingCount;

  Reviews({this.avgRating, this.ratingCount});
factory Reviews.fromJson(Map<String, dynamic> json){
  return Reviews(
    avgRating: json['avg_rating'],
    ratingCount: json['rating_count'],
  );
}
}
