import 'package:asos/models/cart_model.dart';
import 'package:asos/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  TextEditingController _controller = TextEditingController();

  final formatCurrency = new NumberFormat.simpleCurrency();
  int cartCount = 0;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Place Order",
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Customer Information",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunito(fontSize: 18),
                    ),
                  ),
                  RoundedTextField(
                    controller: _controller,
                    hintText: "Name",
                    icon: Icons.search,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  RoundedTextField(
                    controller: _controller,
                    hintText: "Phone number",
                    icon: Icons.phone_android,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  RoundedTextField(
                    controller: _controller,
                    hintText: "Shipping location",
                    icon: Icons.place,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          right: 20,
          left: 20,
          bottom: 0,
          child: Container(
            height: 200,
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
                          "Itmes",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          cartCount.toString(),
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
                          "Total",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${formatCurrency.format(800)}',
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
                      child: Text('Plcae Order',
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
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(36),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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