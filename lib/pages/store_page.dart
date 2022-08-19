import 'package:badges/badges.dart';
import 'package:e_book_app_ui/json/home_json.dart';
import 'package:e_book_app_ui/json/store_json.dart';
import 'package:e_book_app_ui/pages/book_detail_page.dart';
import 'package:e_book_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            getSearchAndCart(),
            SizedBox(
              height: 30,
            ),
            recommendation(),
            SizedBox(
              height: 30,
            ),
            getGenres(),
             SizedBox(
              height: 30,
            ),
            getTrendingBooks(),
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

  Widget recommendation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Recommendations",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Row(
              children: [
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(recommendationsList.length, (index) {
              return GestureDetector(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_) => BookDetailPage(
                    img: recommendationsList[index]['img'],
                    title: recommendationsList[index]['title'],
                    subTitle: recommendationsList[index]['sub_title'],
                    price: recommendationsList[index]['price'].toString(),
                    page: recommendationsList[index]['page'],
                    authorName: recommendationsList[index]['author_name'],
                    rate: recommendationsList[index]['rate'].toString(),
                  )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        recommendationsList[index]['img']),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                                color: black.withOpacity(0.02),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: white, shape: BoxShape.circle),
                              child: Icon(
                                recommendationsList[index]['favourite'] ?  LineIcons.heartAlt : LineIcons.heart,
                                size: 20,
                                color: danger,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            child: Container(
                              height: 25,
                              width: 65,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12))),
                              child: Center(
                                child: Text(
                                  "\$ "+recommendationsList[index]['price'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          recommendationsList[index]['title'],
                          maxLines: 1,
                          style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          recommendationsList[index]['sub_title'],
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 13, color: black.withOpacity(0.4)),
                        ),
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
                              initialRating: recommendationsList[index]['rate'],
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 14,
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
                              "(${recommendationsList[index]['rate']})",
                              style: TextStyle(
                                  color: danger,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  Widget getGenres() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Genres",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Row(
              children: [
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Wrap(
          runSpacing: 10,
          children: List.generate(storeTags.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: storeTags[index]['color'],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: Text(
                      storeTags[index]['label'],
                      style: TextStyle(fontSize: 12, color: white),
                    )),
              ),
            );
          }),
        )
    ]);
  }
  Widget getTrendingBooks(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Trending Books",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Row(
              children: [
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(trendingBooks.length, (index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => BookDetailPage(
                    img: trendingBooks[index]['img'],
                    title: trendingBooks[index]['title'],
                    subTitle: trendingBooks[index]['sub_title'],
                    price: trendingBooks[index]['price'].toString(),
                    page: trendingBooks[index]['page'],
                    authorName: trendingBooks[index]['author_name'],
                    rate: trendingBooks[index]['rate'].toString(),
                  )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        trendingBooks[index]['img']),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                                color: black.withOpacity(0.02),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: white, shape: BoxShape.circle),
                              child: Icon(
                                trendingBooks[index]['favourite'] ? LineIcons.heartAlt :  LineIcons.heart,
                                size: 20,
                                color: danger,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            child: Container(
                              height: 25,
                              width: 65,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12))),
                              child: Center(
                                child: Text(
                                  "\$ "+trendingBooks[index]['price'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          trendingBooks[index]['title'],
                          maxLines: 1,
                          style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          trendingBooks[index]['sub_title'],
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 13, color: black.withOpacity(0.4)),
                        ),
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
                              initialRating: trendingBooks[index]['rate'],
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 14,
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
                              "(${trendingBooks[index]['rate']})",
                              style: TextStyle(
                                  color: danger,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
