import 'package:asos/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Orders",
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
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(left: 15, top: 15),
                  shrinkWrap: true,
                  itemCount: 2,
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
                      ),
                    );
                  }),
            ),
          ],
        ),
      ]),
    );
  }
}
