class RecommendProductModel {
  int? count;
  List<Results>? results;

  RecommendProductModel({
    this.count,
    this.results});

  factory RecommendProductModel.fromJson(Map<String, dynamic> json) {
    return RecommendProductModel(
      count: json['count'],
      results: List<dynamic>.from(json['results']).map((e) => Results.fromJson(e)).toList(),
    );
  }
}

class Results {
  int? id;
  String? name;
  String? imageUrl;
  bool? yellowCard;
  Reviews? reviews;
  List<Vendors>? vendors;
  String? dateAdded;
  String? notes;

  Results(
      {this.id,
        this.name,
        this.imageUrl,
        this.yellowCard,
        this.reviews,
        this.vendors,
        this.dateAdded,
        this.notes});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
        id : json['id'],
        name : json['name'],
        imageUrl : json['image_url'],
    yellowCard : json['yellow_card'],
    reviews : Reviews.fromJson(json['reviews']),
      vendors: List<dynamic>.from(json['vendors']).map((e) => Vendors.fromJson(e)).toList(),
    dateAdded : json['date_added'],
    notes : json['notes'],
    );
  }
}

class Reviews {
  double? avgRating;
  int? ratingCount;

  Reviews({this.avgRating, this.ratingCount});

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
        avgRating : json['avg_rating'],
        ratingCount : json['rating_count'],
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
