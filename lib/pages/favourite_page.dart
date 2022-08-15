import 'package:badges/badges.dart';
import 'package:e_book_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            getSearchAndCart(),
            SizedBox(
              height: 30,
            ),
            getFavourite()
          ],
        ),
      ),
    );
  }

  Widget getSearchAndCart() {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * 0.8,
          height: 40,
          decoration: BoxDecoration(
              color: grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 0),
            child: TextField(
              cursorColor: primary,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search...",
              ),
            ),
          ),
        ),
        Flexible(
          child: IconButton(
              onPressed: () {},
              icon: Badge(
                badgeColor: primary,
                badgeContent: Text(
                  "3",
                  style: TextStyle(color: white),
                ),
                child: Icon(
                  LineIcons.shoppingBag,
                  size: 25,
                ),
              )),
        )
      ],
    );
  }

  Widget getFavourite() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 15,
      runSpacing: 20,
      children: List.generate(6, (index) {
        return Column(
          children: [
            Stack(
              children: [
                Container(
                  width: (size.width - 55) / 2,
                  height: (size.width + 40) / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://covers.openlibrary.org/b/id/12539702-M.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12)),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration:
                        BoxDecoration(color: white, shape: BoxShape.circle),
                    child: Icon(
                      LineIcons.heartAlt,
                      size: 20,
                      color: danger,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Atomic Habits",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "J.K Rowling",
              style: TextStyle(fontSize: 14, color: black.withOpacity(0.4)),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    itemPadding: EdgeInsets.only(right: 2),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: danger,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Text(
                    "(4.1)",
                    style: TextStyle(
                        color: danger,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
