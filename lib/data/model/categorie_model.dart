class CategorieModel {
  int? catId;
  String? catName;
  String? catNameAr;
  String? catDatetime;

  CategorieModel({this.catId, this.catName, this.catNameAr, this.catDatetime});

  CategorieModel.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
    catNameAr = json['cat_name_ar'];
    catDatetime = json['cat_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = catId;
    data['cat_name'] = catName;
    data['cat_name_ar'] = catNameAr;
    data['cat_datetime'] = catDatetime;
    return data;
  }
}