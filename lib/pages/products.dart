import 'package:asos/models/product_model.dart';
import 'package:asos/pages/product_details.dart';
import 'package:asos/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Product extends StatelessWidget {
  final String category;
  final String id;

  Product(this.category, this.id);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: GoogleFonts.nunito(color: whiteColor),
        ),
        elevation: 0,
        backgroundColor: blackColor,
        actions: [
          IconButton(
              onPressed: (){
                showSearch(context: context, delegate: ProductSearch());
              },
              icon: Icon(
                Icons.search,
                size: 27,
                color: whiteColor,
              ))
        ],
      ),
      body: Stack(children: [
        ListView(
          physics: ClampingScrollPhysics(),
          children: [

            SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 16, bottom: 8, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "All products",
                    style: GoogleFonts.nunito(
                        color: primaryColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 19),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProductDetails(
                                products[index].name,
                                products[index].photo,
                                products[index].price,
                                products[index].category,
                                products[index].description)));
                      },
                      child: ProductCard(
                        products[index].photo,
                        products[index].name,
                        products[index].type,
                        products[index].category,
                        products[index].price,
                        products[index].discount,
                        products[index].description,
                      ),
                    );
                  }),
            )
          ],
        )
      ]),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String photo;
  final String name;
  final String type;
  final String category;
  final String price;
  final String discount;
  final String description;

  ProductCard(this.photo, this.name, this.type, this.category, this.price,
      this.discount, this.description);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final formatCurrency = new NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(right: 5),
              width: 150,
              height: 200,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ], borderRadius: BorderRadius.circular(13), color: whiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Container(
                      height: 80,
                      width: 150,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage(widget.photo), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.name,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: primaryColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          '${formatCurrency.format(int.parse(widget.price))}',
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                        Text(
                          widget.category,
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                right: 20,
                top: 10,
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                  ], borderRadius: BorderRadius.circular(15), color: blackColor),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(widget.type == "1" ? "Women" : "Men", style: GoogleFonts.nunito(color: whiteColor, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class ProductSearch extends SearchDelegate<String> {
  final recent_cities = [
    "Kigali",
    "Huye",
    "Musaze",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "null");
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final format = NumberFormat("#,##0.00", "en_US");
    final suggestionList = query.isEmpty
        ? products
        : products.where((p) => p.name.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //          builder: (context) =>
            //              TransactionDetails(transactions[index])));
          },
          child: Container(
            margin: EdgeInsets.only(left: 10, bottom: 8, right: 10),
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: whiteColor),
            child: Stack(
              children: <Widget>[
                Positioned(
                    left: 50,
                    top: 20,
                    child: Text(
                      products[index].name,
                      style: GoogleFonts.nunito(
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.w700),
                    )),
                Positioned(
                    left: 50,
                    bottom: 20,
                    child: Text(
                      format.format(int.parse(products[index].price)),
                      style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w300),
                    )),
                Positioned(
                  left: 10,
                  top: 10,
                  bottom: 10,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(products[index].photo))),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: suggestionList.length,
    );
  }
}