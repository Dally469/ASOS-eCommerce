import 'package:asos/models/card_model.dart';
import 'package:asos/models/subcategories_model.dart';
import 'package:asos/pages/homepage.dart';
import 'package:asos/pages/products.dart';
import 'package:asos/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Categories extends StatefulWidget {

  final String type;

  Categories(this.type);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.type == "1" ? "Women": "Men",
          style: GoogleFonts.nunito(color: whiteColor),
        ),
        elevation: 0,
        backgroundColor: blackColor,
        actions: [
          IconButton(
              onPressed: (){
                // showSearch(context: context, delegate: TransactionSearch());
              },
              icon: Icon(
                Icons.search,
                size: 27,
                color: whiteColor,
              ))
        ],
      ),
      body: Stack(
          children: [
            ListView(
              physics: ClampingScrollPhysics(),
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 16, bottom: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "All Categories",
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
                          crossAxisCount: 3,
                          mainAxisSpacing: 10
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: subcategories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              current = index;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Product(subcategories[index].title,subcategories[index].id))
                              );
                            });
                          },
                          child: SubCategoryCard(
                            subcategories[index].id,
                            subcategories[index].title,
                            subcategories[index].photo,
                            current == index,
                            this,
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
class SubCategoryCard extends StatefulWidget {
  final String id;
  final String title;
  final String photo;
  final bool isSelected;
  _CategoriesState context;

  SubCategoryCard(
      this.id, this.title, this.photo, this.isSelected, this.context);

  @override
  _SubCategoryCardState createState() => _SubCategoryCardState();
}

class _SubCategoryCardState extends State<SubCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          color: widget.isSelected ? whiteColor : whiteColor

      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 65,
            width: 65,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(
                      widget.isSelected ? widget.photo : widget.photo),
                fit: BoxFit.cover,

              ),
            ),
          ),
          SizedBox(height: 5,),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight:widget.isSelected ? FontWeight.bold : FontWeight.w500,
                color: widget.isSelected ? primaryDarkColor : primaryColor),
          )
        ],
      ),
    );
  }
}