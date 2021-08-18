import 'package:asos/models/cart_model.dart';
import 'package:asos/models/product_model.dart';
import 'package:asos/pages/cart.dart';
import 'package:asos/pages/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:asos/models/operation_model.dart';
import 'package:asos/utils/colors.dart';
import 'package:asos/models/card_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:asos/utils/placeholder.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

int cartCount = 0;

class _HomepageState extends State<Homepage> {
// CUrrent selected
  int current = 0;
  int currentCard = 0;

  final List<Widget> _children = [
    PlaceholderWidget(Colors.pink),
    PlaceholderWidget(Colors.blueGrey),
    PlaceholderWidget(Colors.orange),
    PlaceholderWidget(Colors.teal)
  ];

  //Handle indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final format = NumberFormat("#,##0.00", "en_US");

  ScrollController _scrollController = ScrollController();
  bool closeTopContainer = false;
  TextEditingController _controller = TextEditingController();
  List<String> cartArray = [];

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        // cartCount = 0;
        cartCount = carts.length;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(

      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: Stack(
                children: [
                  Flexible(
                    child: Container(
                      height: size.height * .3,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(70),
                              bottomRight: Radius.circular(40))),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 10, top: 40, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              child: Row(
                                children: [
                                  RoundedTextField(
                                    controller: _controller,
                                    hintText: "Search Product",
                                    icon: Icons.search,
                                    onChanged: (value) {
                                      print(value);
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Cart())
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: 0,
                                          child: Container(
                                            height: 19,
                                            width: 19,
                                            decoration: BoxDecoration(
                                                color: greenColor,
                                                borderRadius:
                                                BorderRadius.circular(40)),
                                            child: Center(
                                                child: Text(
                                                  cartCount.toString(),
                                                  style: GoogleFonts.nunito(
                                                      color: whiteColor,
                                                      fontWeight: FontWeight
                                                          .bold),
                                                )),
                                          ),
                                        ),
                                        Container(
                                          height: 54,
                                          width: 54,
                                          decoration: BoxDecoration(
                                              color: primaryOverlayColor,
                                              borderRadius:
                                              BorderRadius.circular(40)),
                                          child: Icon(
                                            Icons.shopping_cart_outlined,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Positioned(
                                        right: 0,
                                        child: Container(
                                          height: 19,
                                          width: 19,
                                          decoration: BoxDecoration(
                                              color: redColor,
                                              borderRadius:
                                              BorderRadius.circular(40)),
                                          child: Center(
                                              child: Text(
                                                "3",
                                                style: GoogleFonts.nunito(
                                                    color: whiteColor,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              )),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: primaryOverlayColor,
                                            borderRadius:
                                            BorderRadius.circular(40)),
                                        child: Icon(
                                          Icons.notifications_none_outlined,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Stack(
                              children: [
                                Container(
                                  height: 110,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Perfect Summer' Fits",
                                          style: GoogleFonts.nunito(
                                              color: whiteColor, fontSize: 18),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "UP TO 50% OFF DISCOUNT",
                                          style: GoogleFonts.nunito(
                                              color: whiteColor,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: greyTwoColor,
                                        borderRadius:
                                        BorderRadius.circular(40)),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: greyOneColor,
                                        borderRadius:
                                        BorderRadius.circular(30)),
                                  ),
                                ),
                                Positioned(
                                  left: 3,
                                  bottom: 3,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: greyTwoColor,
                                        borderRadius:
                                        BorderRadius.circular(30)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 16, bottom: 6, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Main Category",
                    style: GoogleFonts.nunito(
                        color: primaryColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 19),
                  ),
                  Row(
                    children: map<Widget>(categories, (index, selected) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        height: current == index ? 12 : 8,
                        width: current == index ? 12 : 8,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                          current == index ? primaryDarkColor : greyColor,
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
            Container(
              height: 160,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 8, top: 8),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Categories(categories[index].type)));
                        });
                      },
                      child: Card(
                          categories[index].title,
                          categories[index].type,
                          categories[index].brandNumber,
                          categories[index].categoryNumber,
                          categories[index].photo,
                          current == index,
                          this),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 10, right: 16, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "List of Products",
                    style: GoogleFonts.nunito(
                        color: primaryColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 19),
                  ),
                  IconButton(
                      onPressed: () {
                        showSearch(
                            context: context, delegate: TransactionSearch());
                      },
                      icon: Icon(
                        Icons.search,
                        size: 27,
                        color: primaryColor,
                      ))
                ],
              ),
            ),
            Flexible(
              child: Container(
                height: 220,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 8, top: 8),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Categories(categories[index].type)));
                          });
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
              ),
            ),

          ],
        ),
      ),
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
              width: 200,
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

class Card extends StatefulWidget {
  final String title;
  final String type;
  final String brand_number;
  final String category_number;
  final String photo;
  final bool isTapped;
  _HomepageState context;

  Card(this.title, this.type, this.brand_number, this.category_number,
      this.photo,
      this.isTapped, this.context);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  final format = NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                height: 160,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(widget.photo),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        left: 30,
                        top: 50,
                        child: Text(
                          widget.title,
                          style: GoogleFonts.nunito(
                              fontSize: 40,
                              color: whiteColor,
                              fontWeight: FontWeight.w700),
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                height: 160,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: blackOverlayColor
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                height: 160,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        left: 30,
                        top: 20,
                        child: Text(
                          "Fashion ",
                          style: GoogleFonts.nunito(
                              fontSize: 20,
                              color: whiteColor,
                              fontWeight: FontWeight.w500),
                        )),
                    Positioned(
                        left: 30,
                        top: 50,
                        child: Text(
                          widget.title,
                          style: GoogleFonts.nunito(
                              fontSize: 40,
                              color: whiteColor,
                              fontWeight: FontWeight.w900),
                        )),
                    Positioned(
                        left: 35,
                        bottom: 30,
                        child: Text(
                          widget.category_number + " Categories ",
                          style: GoogleFonts.nunito(
                              fontSize: 20,
                              color: whiteColor,
                              fontWeight: FontWeight.w700),
                        )),
                    Positioned(
                        right: 35,
                        bottom: 30,
                        child: Text(
                          widget.brand_number + " Brand ",
                          style: GoogleFonts.nunito(
                              fontSize: 20,
                              color: whiteColor,
                              fontWeight: FontWeight.w700),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionSearch extends SearchDelegate<String> {
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
        ? operations
        : operations.where((p) => p.name.startsWith(query)).toList();
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
                      operations[index].name,
                      style: GoogleFonts.nunito(
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.w700),
                    )),
                Positioned(
                    left: 50,
                    bottom: 20,
                    child: Text(
                      format.format(int.parse("8000")),
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
                            image: AssetImage(operations[index].activeIcon))),
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

class RoundedTextField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const RoundedTextField({Key? key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.color = blackColor,
    this.backgroundColor = primaryOverlayColor,
    this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(36),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: color,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: color,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: color),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
