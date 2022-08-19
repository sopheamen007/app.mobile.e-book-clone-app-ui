import 'dart:ffi';

import 'package:e_book_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PlayingNowPage extends StatefulWidget {
  final String img;
  final String title;
  final String subTitle;
  const PlayingNowPage({Key? key,required this.img,required this.title,required this.subTitle}) : super(key: key);

  @override
  State<PlayingNowPage> createState() => _PlayingNowPageState();
}

class _PlayingNowPageState extends State<PlayingNowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: black,
            size: 22,
          )),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.more_horiz,
              color: black,
              size: 30,
            )),
      ],
      title: Text(
        "Playing Now",
        style: TextStyle(color: black, fontSize: 18),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        widget.img),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 5,
                      color: black.withOpacity(0.05),
                      offset: Offset(0, 10))
                ],
                borderRadius: BorderRadius.circular(12)),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            widget.subTitle,
            style: TextStyle(
                fontSize: 16,
                color: black.withOpacity(0.6),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              Container(
                height: 4,
                decoration: BoxDecoration(
                    color: black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5)),
              ),
              Container(
                height: 4,
                width: 150,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(5)),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "0:34:15",
                style: TextStyle(fontSize: 13, color: black.withOpacity(0.5)),
              ),
              Text(
                "5:34:15",
                style: TextStyle(fontSize: 13, color: black.withOpacity(0.5)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(
                    Feather.skip_back,
                    color: primary,
                    size: 25,
                  ),
                  onPressed: null),
              SizedBox(
                width: 25,
              ),
              IconButton(
                  iconSize: 50,
                  icon: Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: primary),
                    child: Center(
                      child: Icon(
                        Icons.play_arrow,
                        size: 30,
                        color: white,
                      ),
                    ),
                  ),
                  onPressed: null),
              SizedBox(
                width: 25,
              ),
              IconButton(
                  icon: Icon(
                    Feather.skip_forward,
                    color: primary,
                    size: 25,
                  ),
                  onPressed: null),
            ],
          )
        ],
      ),
    );
  }
}
