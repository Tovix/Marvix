class ProductsModel
{
  int? id;
  String? title;
  int? price;
  String? description;
  Category? category;
  List<String>? images;

  ProductsModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = Category.fromJson(json['category']);
    images = json['images'].cast<String>();

  }
}

class Category
{
  int? id;
  String? name;
  String? image;

  Category.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
