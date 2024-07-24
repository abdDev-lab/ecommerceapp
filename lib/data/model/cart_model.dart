class CartModel {
  int? cartId;
  int? cartUserid;
  int? cartProductid;
  int? cartProductcount;
  String? cartProductcolor;
  dynamic cartProductsizeorstorage;
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
  double? productpricewithdiscount;
  double? productpricewithcount;

  CartModel(
      {this.cartId,
      this.cartUserid,
      this.cartProductid,
      this.cartProductcount,
      this.cartProductcolor,
      this.cartProductsizeorstorage,
      this.productId,
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
      this.productpricewithdiscount,
      this.productpricewithcount});

  CartModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartProductid = json['cart_productid'];
    cartProductcount = json['cart_productcount'];
    cartProductcolor = json['cart_productcolor'];
    cartProductsizeorstorage = json['cart_productsizeorstorage'];
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
    productpricewithdiscount = json['productpricewithdiscount'];
    productpricewithcount = json['productpricewithcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_productid'] = cartProductid;
    data['cart_productcount'] = cartProductcount;
    data['cart_productcolor'] = cartProductcolor;
    data['cart_productsizeorstorage'] = cartProductsizeorstorage;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_name_ar'] = productNameAr;
    data['product_desc'] = productDesc;
    data['product_desc_ar'] = productDescAr;
    data['product_price'] = productPrice;
    data['product_image'] = productImage;
    data['product_count'] = productCount;
    data['product_rating'] = productRating;
    data['product_active'] = productActive;
    data['product_discount'] = productDiscount;
    data['sex'] = sex;
    data['product_date'] = productDate;
    data['product_cat'] = productCat;
    data['subcat_id'] = subcatId;
    data['cat_id'] = catId;
    data['productpricewithdiscount'] = productpricewithdiscount;
    data['productpricewithcount'] = productpricewithcount;
    return data;
  }
}
