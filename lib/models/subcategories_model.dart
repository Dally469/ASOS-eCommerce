class SubcategoriesModel {
  String id;
  String title;
  String categoryId;
  String photo;


  SubcategoriesModel(this.id, this.title, this.categoryId, this.photo);
}

List<SubcategoriesModel> subcategories = cardData
    .map(
      (item) => SubcategoriesModel(
      item['id'].toString(),
      item['title'].toString(),
      item['categoryId'].toString(),
      item['photo'].toString()
      ),
)
    .toList();

var cardData = [
  {
    "id": "1",
    "title": "New in",
    "categoryId": "2",
    "photo": "assets/images/wwomen.png",
  },
  {
    "id": "2",
    "title": "Topman",
    "categoryId": "2",
    "photo": "assets/images/wwomen.png",
  },
  {
    "id": "3",
    "title": "Clothing",
    "categoryId": "2",
    "photo": "assets/images/clothes.jpg",
  },
  {
    "id": "4",
    "title": "Shoes",
    "categoryId": "2",
    "photo": "assets/images/shoes.jpg",
  },
  {
    "id": "5",
    "title": "Accessories",
    "categoryId": "2",
    "photo": "assets/images/accessories.png",
  },
  {
    "id": "6",
    "title": "Sportswear",
    "categoryId": "2",
    "photo": "assets/images/sports.png",
  },
  {
    "id": "7",
    "title": "Face & Body",
    "categoryId": "2",
    "photo": "assets/images/face.jpg",
  },
  {
    "id": "8",
    "title": "Brands",
    "categoryId": "2",
    "photo": "assets/images/brands.jpg",
  },
  {
    "id": "9",
    "title": "Topshop",
    "categoryId": "1",
    "photo": "assets/images/wwomen.png",
  },
];
