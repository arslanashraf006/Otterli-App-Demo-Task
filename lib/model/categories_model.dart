class CategoriesModel {
  int? count;
  List<Results>? results;

  CategoriesModel({this.count, this.results});

   factory CategoriesModel.fromJson(Map<String, dynamic> json) {
   return CategoriesModel(
        count : json['count'],
    results : List<dynamic>.from(json['results']).map((e) => Results.fromJson(e)).toList(),

    );
  }
}

class Results {
  String? name;
  String? iconSvg;

  Results({this.name, this.iconSvg});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
        name : json['name'],
        iconSvg : json['icon_svg'],
    );
  }
}
