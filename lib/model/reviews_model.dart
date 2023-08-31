class ReviewModel {
  int? count;
  String? next;
  List<Results>? results;

  ReviewModel({this.count, this.next, this.results});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        count : json['count'],
        next : json['next'],
    results: List<dynamic>.from(json['results']).map((e) => Results.fromJson(e)).toList(),
    );
  }
}

class Results {
  int? id;
  String? product;
  int? productId;
  String? consumer;
  int? rating;
  String? review;
  String? createdDate;
  String? lastUpdateDate;
  String? reviewerRef;
  String? username;

  Results(
      {this.id,
        this.product,
        this.productId,
        this.consumer,
        this.rating,
        this.review,
        this.createdDate,
        this.lastUpdateDate,
        this.reviewerRef,
        this.username});

 factory Results.fromJson(Map<String, dynamic> json) {
   return Results(
       id : json['id'],
       product : json['product'],
       productId : json['product_id'],
   consumer : json['consumer'],
   rating : json['rating'],
   review : json['review'],
   createdDate : json['created_date'],
   lastUpdateDate : json['last_update_date'],
   reviewerRef : json['reviewer_ref'],
   username : json['username'],
   );

  }

}
