import 'package:asos/models/cart_model.dart';
import 'package:asos/models/product_model.dart';
import 'package:asos/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final formatCurrency = new NumberFormat.simpleCurrency();
  int cartCount = 0;

  int sum = 0;

  total() {
    carts.forEach((element) {
      sum = sum + int.parse(element.price);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      cartCount = carts.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping Cart",
          style: GoogleFonts.nunito(color: whiteColor),
        ),
        elevation: 0,
        backgroundColor: blackColor,
      ),
      body: Stack(children: [
        ListView(
          physics: ClampingScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 16, bottom: 8, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    cartCount.toString() + " items",
                    style: GoogleFonts.nunito(
                        color: primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 19),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(left: 15, top: 15),
                  shrinkWrap: true,
                  itemCount: carts.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          print("Transaction tapped");
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10, bottom: 8, right: 10),
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: whiteColor),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                left: 55,
                                top: 20,
                                child: Text(
                                  carts[index].name,
                                  style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700),
                                )),
                            Positioned(
                                left: 55,
                                bottom: 20,
                                child: Text(
                                  '${formatCurrency.format(int.parse(carts[index].price))}',
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
                                        image: AssetImage(carts[index].photo))),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  // if(carts.contains(item)){
                                  //   carts.remove(item);
                                  // }else{
                                  //   carts.add(item);
                                  // }
                                });
                              },
                              child: Positioned(
                                right: 10,
                                top: 10,
                                bottom: 10,
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: redColor),
                                  child: Icon(Icons.delete_forever, color: whiteColor, size: 18,),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
        Positioned(
          right: 20,
          left: 20,
          bottom: 0,
          child: Container(
            height: 180,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${formatCurrency.format(sum)}',
                          style: GoogleFonts.nunito(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery charge",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(fontSize: 18),
                        ),
                        Text(
                          '${formatCurrency.format(int.parse("50"))}',
                          style: GoogleFonts.nunito(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(fontSize: 20),
                        ),
                        Text(
                          '${formatCurrency.format(int.parse("930"))}',
                          style: GoogleFonts.nunito(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: blackColor,
                    hoverColor: greenColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Checkout',
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
}
