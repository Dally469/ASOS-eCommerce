class CardModel {
  String title;
  String type;
  String brandNumber;
  String categoryNumber;
  String photo;


  CardModel(this.title, this.type, this.brandNumber, this.categoryNumber, this.photo);
}



List<CardModel> categories = cardData
    .map(
      (item) => CardModel(
      item['title'].toString(),
      item['type'].toString(),
      item['brandNumber'].toString(),
      item['categoryNumber'].toString(),
      item['photo'].toString()
      ),
)
    .toList();

var cardData = [
  {
    "title": "Women",
    "type": "1",
    "brandNumber": "7",
    "categoryNumber": "21",
    "photo": "assets/images/wwomen.png",
  },
  {
    "title": "Men",
    "type": "2",
    "brandNumber": "6",
    "categoryNumber": "18",
    "photo": "assets/images/wmen.png",
  }
];
