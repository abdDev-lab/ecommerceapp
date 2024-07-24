class ProductsModel {
  int? productId;
  String? productName;
  String? productNameAr;
  String? productDesc;
  String? productDescAr;
  double? productPrice;
  String? productImage;
  int? productCount;
  double? productRating;
  int? productActive;
  int? productDiscount;
  String? sex;
  String? productDate;
  int? productCat;
  int? subcatId;
  int? catId;
  int? favorite;

  ProductsModel(
      {this.productId,
      this.productName,
      this.productNameAr,
      this.productDesc,
      this.productDescAr,
      this.productPrice,
      this.productImage,
      this.productCount,
      this.productRating,
      this.productActive,
      this.productDiscount,
      this.sex,
      this.productDate,
      this.productCat,
      this.subcatId,
      this.catId,
      this.favorite});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productNameAr = json['product_name_ar'];
    productDesc = json['product_desc'];
    productDescAr = json['product_desc_ar'];
    productPrice = json['product_price'];
    productImage = json['product_image'];
    productCount = json['product_count'];
    productRating = json['product_rating'];
    productActive = json['product_active'];
    productDiscount = json['product_discount'];
    sex = json['sex'];
    productDate = json['product_date'];
    productCat = json['product_cat'];
    subcatId = json['subcat_id'];
    catId = json['cat_id'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_name_ar'] = this.productNameAr;
    data['product_desc'] = this.productDesc;
    data['product_desc_ar'] = this.productDescAr;
    data['product_price'] = this.productPrice;
    data['product_image'] = this.productImage;
    data['product_count'] = this.productCount;
    data['product_rating'] = this.productRating;
    data['product_active'] = this.productActive;
    data['product_discount'] = this.productDiscount;
    data['sex'] = this.sex;
    data['product_date'] = this.productDate;
    data['product_cat'] = this.productCat;
    data['subcat_id'] = this.subcatId;
    data['cat_id'] = this.catId;
    data['favorite'] = this.favorite;
    return data;
  }
}
