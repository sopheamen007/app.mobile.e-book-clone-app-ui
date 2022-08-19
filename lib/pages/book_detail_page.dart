import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:e_book_app_ui/json/home_json.dart';
import 'package:e_book_app_ui/pages/playing_now_page.dart';
import 'package:e_book_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BookDetailPage extends StatefulWidget {
  final String img;
  final String title;
  final String subTitle;
  final String price;
  final String page;
  final String rate;
  final String authorName;

  const BookDetailPage({Key? key,required this.img,required this.title,required this.subTitle,required this.price,required this.page,required this.rate,required this.authorName}) : super(key: key);

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
          child: getAppBar(), preferredSize: Size.fromHeight(130)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: white,
      flexibleSpace: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        widget.img),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(color: black.withOpacity(0.2)),
          ),
          Container(
            height: 180,
            width: double.infinity,
            child: Stack(
              children: [
                BlurryContainer(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: white,
                                  size: 22,
                                )),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.bookmark,
                                      color: white,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  PlayingNowPage(
                                                    img:widget.img ,
                                                    title: widget.title,
                                                    subTitle: widget.subTitle,
                                                  )));
                                    },
                                    icon: Icon(
                                      Icons.headphones,
                                      color: white,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      getBottomSheetListening();
                                    },
                                    icon: Icon(
                                      Icons.settings,
                                      color: white,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: white),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              widget.subTitle,
                              style: TextStyle(fontSize: 16, color: white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          getFirstSection(),
          SizedBox(
            height: 30,
          ),
          getSecondSection(),
          SizedBox(
            height: 30,
          ),
          getThirdSection(),
          SizedBox(
            height: 30,
          ),
          getFourthSection(),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget getFirstSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "${widget.price}\$",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Price",
              style: TextStyle(fontSize: 14, color: black.withOpacity(0.5)),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              widget.page,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Pages",
              style: TextStyle(fontSize: 14, color: black.withOpacity(0.5)),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              widget.rate,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Rating",
              style: TextStyle(fontSize: 14, color: black.withOpacity(0.5)),
            ),
          ],
        ),
      ],
    );
  }

  Widget getSecondSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 15,
        ),
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text:
                "She returns to town in the hopes of regaining custody of her and Scotty's daughter who is being raised by Scotty's parents, the Landrys. However, the Landrys are still angry and heartbroken over the loss of their son. Meanwhile, Kenna ends up meeting Ledger, Scotty's best friend, who has been helping to raise her daughter. In this emotional novel about redemption and forgiveness, Kenna must find a way to made amends and figure out what her life will look like moving forward.",
            style: TextStyle(
                fontSize: 15,
                height: 1.5,
                fontWeight: FontWeight.w500,
                color: black),
            children: [
              TextSpan(
                  text: 'more',
                  style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      color: primary)),
            ],
          ),
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
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.authorName,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "1896-1940",
                        style: TextStyle(
                            fontSize: 13, color: black.withOpacity(0.5)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "32 Books",
                  style: TextStyle(fontSize: 13, color: black.withOpacity(0.5)),
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
        )
      ],
    );
  }

  Widget getThirdSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 15,
        ),
        Column(
          children: List.generate(reviewsPeople.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          reviewsPeople[index]['img']
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviewsPeople[index]['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          RatingBar.builder(
                            ignoreGestures: true,
                            initialRating: reviewsPeople[index]['rate'],
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
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text:
                          reviewsPeople[index]['text'],
                      style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          color: black),
                      children: [
                        TextSpan(
                            text: 'more',
                            style: TextStyle(
                                fontSize: 15,
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                                color: primary)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        )
      ],
    );
  }

  Widget getFourthSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Similar books",
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
            children: List.generate(similarBooksJson.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => BookDetailPage(
                    img: similarBooksJson[index]['img'],
                    title: similarBooksJson[index]['title'],
                    subTitle: similarBooksJson[index]['sub_title'],
                    price: similarBooksJson[index]['price'].toString(),
                    page: similarBooksJson[index]['page'],
                    authorName: similarBooksJson[index]['author_name'],
                    rate: similarBooksJson[index]['rate'].toString(),
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
                                        similarBooksJson[index]['img']),
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
                                similarBooksJson[index]['favourite'] ?  LineIcons.heartAlt : LineIcons.heart,
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
                                  "\$ ${similarBooksJson[index]['price']}",
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
                          similarBooksJson[index]['title'],
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          similarBooksJson[index]['sub_title'],
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
                              initialRating: similarBooksJson[index]['rate'],
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
                              "(${similarBooksJson[index]['rate']})",
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

  getBottomSheetListening() {
    List themes = [
      Color(0xFFFFFFFF),
      Color(0xFF000000),
      Color(0xFFf0cea0),
    ];

    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(color: primary.withOpacity(0.15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(themes.length, (index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: black.withOpacity(0.7),
                                      width: 0.5),
                                  shape: BoxShape.circle,
                                  color: themes[index]),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: themes[index]),
                          ),
                        );
                      }),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: primary, shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              "TT",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: primary,
                              ),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              "Tt",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                            color: black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                     
                      child: Container(
                        height: 4,
                        width: 150,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 145),
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primary
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Aa",style: TextStyle(
                      fontSize: 13,
                      color: black.withOpacity(0.8)
                    ),),
                     Text("Aa",style: TextStyle(
                      fontSize: 20,
                      color: black.withOpacity(0.8)
                    ),)
                  ],
                ),
                SizedBox(height: 30,),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                            color: black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                     
                      child: Container(
                        height: 4,
                        width: 220,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 215),
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primary
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.light_mode,color: black.withOpacity(0.6),size: 18,),
                    Icon(Icons.light_mode,color: black.withOpacity(0.6),size: 28,),
                    
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
