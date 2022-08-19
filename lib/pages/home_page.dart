import 'package:badges/badges.dart';
import 'package:e_book_app_ui/json/home_json.dart';
import 'package:e_book_app_ui/pages/book_detail_page.dart';
import 'package:e_book_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello, Sopheamen",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.8,
                  height: 40,
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 0),
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
            ),
            SizedBox(
              height: 15,
            ),
            getSectionQuoate(),
            SizedBox(
              height: 30,
            ),
            readerToday(),
            SizedBox(
              height: 30,
            ),
            specialForYou(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget getSectionQuoate() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quote of the Day",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "I'd rather have roses on my table than diamonds on my neck.",
              style: TextStyle(
                  fontSize: 15, height: 1.5, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Emma Goldman",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget readerToday() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Reader today",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1544716278-e513176f20b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJvb2t8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 15,
        ),
        Text("Top 10 books for self-development",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        SizedBox(
          height: 10,
        ),
        Row(
          children: List.generate(tags.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: tags[index]['color'],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: Text(
                      tags[index]['label'],
                      style: TextStyle(fontSize: 12, color: white),
                    )),
              ),
            );
          }),
        )
      ],
    );
  }

  Widget specialForYou() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Special for you",
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
            children: List.generate(specialForYouJson.length, (index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => BookDetailPage(
                    img: specialForYouJson[index]['img'],
                    title: specialForYouJson[index]['title'],
                    subTitle: specialForYouJson[index]['sub_title'],
                    price: specialForYouJson[index]['price'].toString(),
                    page: specialForYouJson[index]['page'],
                    authorName: specialForYouJson[index]['author_name'],
                    rate: specialForYouJson[index]['rate'].toString(),
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
                                        specialForYouJson[index]['img']),
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
                                specialForYouJson[index]['favourite'] ? LineIcons.heartAlt : LineIcons.heart,
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
                                  "\$ "+specialForYouJson[index]['price'],
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
                          specialForYouJson[index]['title'],
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
                          
                          specialForYouJson[index]['sub_title'],
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
                              initialRating: specialForYouJson[index]['rate'],
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
                              "(${specialForYouJson[index]['rate']})",
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
