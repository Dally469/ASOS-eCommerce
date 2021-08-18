class ProductModel {
  String photo;
  String name;
  String type;
  String category;
  String price;
  String discount;
  String description;

  ProductModel(this.photo, this.name, this.type, this.category, this.price, this.discount, this.description);
}

List<ProductModel> products = cardData
    .map(
      (item) => ProductModel(
      item['photo'].toString(),
      item['name'].toString(),
      item['type'].toString(),
      item['category'].toString(),
      item['price'].toString(),
      item['discount'].toString(),
      item['description'].toString()
      ),
)
    .toList();

var cardData = [
  {
    "photo": "assets/images/shoes.jpg",
    "name": "Crooked Tongues logo t-shirt in black",
    "type": "2",
    "category": "Shoes",
    "price": "65",
    "discount": "21",
    "description": "Product description",
  },
  {
    "photo": "assets/images/tshirt.jpg",
    "name": "Carhartt WIP chase t-shirt in purple",
    "type": "2",
    "category": "T-Shirt",
    "price": "80",
    "discount": "21",
    "description": "Product description",
  },
  {
    "photo": "assets/images/har.png",
    "name": "Nike SB Skate Scott t-shirt in wine",
    "type": "2",
    "category": "Gucci Hat",
    "price": "20",
    "discount": "21",
    "description": "Product description",
  },
  {
    "photo": "assets/images/legg.png",
    "name": "Everest Face Expedition Legging in purple",
    "type": "1",
    "category": "Legging",
    "price": "30",
    "discount": "21",
    "description": "Product description",
  },
  {
    "photo": "assets/images/wmen.png",
    "name": "Women",
    "type": "1",
    "category": "Pants",
    "price": "21",
    "discount": "21",
    "description": "Product description",
  },
];
