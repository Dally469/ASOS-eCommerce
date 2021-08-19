import 'package:asos/models/product_model.dart';
import 'package:asos/pages/cart.dart';
import 'package:asos/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
  final formatCurrency = new NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.arrow_back,
              size: 27,
              color: primaryColor,
            )),
        title: Text(
          widget.productName.length >= 35
              ? widget.productName.substring(0, 30) + "..."
              : widget.productName,
          style: GoogleFonts.nunito(color: primaryColor),
        ),
        elevation: 0,
        backgroundColor: whiteColor,
      ),
      body: Stack(children: [
        ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0, right: 0, bottom: 8, top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 320,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            bottomRight: Radius.circular(40))),
                    child: Container(

                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage(widget.productPhoto), fit: BoxFit.cover),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Property(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[

                          Text(widget.productDesc)
                        ],
                      )
                    ],
                  ),

                ],
              ),
            )

          ],
        ),
        Positioned(
          right: 20,
          left: 20,
          bottom: 0,
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [

                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: blackColor,
                    hoverColor: greenColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Cart()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Add Cart',
                          style: GoogleFonts.nunito(fontSize: 22)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

      ]),
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
              Row(
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                        color: primaryColor, shape: BoxShape.rectangle),
                    width: 150,
                    height: 30,
                    child: Center(child: Text(widget.productCategory, style: GoogleFonts.nunito(color: whiteColor))),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                '${formatCurrency.format(int.parse(widget.productPrice))}',
                style: TextStyle(
                    fontSize: 30,
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
