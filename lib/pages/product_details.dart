import 'package:asos/models/product_model.dart';
import 'package:asos/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String productName;
  final String productPhoto;
  final String productPrice;
  final String productCategory;
  final String productDesc;

  ProductDetails(this.productName, this.productPhoto, this.productPrice,
      this.productCategory, this.productDesc);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          appBar(),
          Container(margin: EdgeInsets.all(20), child: hero()),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.productCategory,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: orangeColor),
            ),
          ),
          Container(
              child: Text(
                widget.productDesc,
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.5, fontSize: 20, color: Color(0xFF6F8398)),
              ),
              padding: EdgeInsets.all(16)),
          Property(),
        ],
      ),
    ));
  }

  Widget appBar() {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.arrow_back,
            size: 30,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  widget.productName.length >= 35 ? widget.productName.substring(0, 23)+".." : widget.productName ,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2F2F3E)),
                ),
              ],
            ),
          ),
          Icon(
            Icons.shopping_bag,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget hero() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: AssetImage(widget.productPhoto), fit: BoxFit.cover),
      ),
      child: Stack(
        children: <Widget>[
         
          Positioned(
            child: FloatingActionButton(
                elevation: 2,
                child: Image.asset(
                  "assets/images/sports.png",
                  width: 30,
                  height: 30,
                ),
                backgroundColor: Colors.white,
                onPressed: () {}),
            bottom: 0,
            right: 20,
          ),
        ],
      ),
    );
  }

  Widget Property() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Color"),
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(5),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(5),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow, shape: BoxShape.circle),
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(5),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.pink, shape: BoxShape.circle),
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(5),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text("Price"),
              Text(
                widget.productPrice,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F2F3E)),
              )
            ],
          )
        ],
      ),
    );
  }
}
