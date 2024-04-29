import 'package:flutter/material.dart';
import "package:flutter_rating_bar/flutter_rating_bar.dart";
import 'package:predoo/screens/home/Services.dart';
import 'package:predoo/utils/color.dart';
import 'package:predoo/utils/utils.dart';

import '../auth/particularServicefullView.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: MyColor.lightPrimary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(11),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.search_rounded,
                                color: MyColor.textColorLight,
                                size: 24,
                              ),
                              Text(
                                "  Search Salon, Specialist...",
                                style: TextStyle(
                                  color: MyColor.textColorLight,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColor.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(12),
                        child: Icon(
                          Icons.filter_list,
                          color: MyColor.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _getSeeAllHeading(context, "#Special For You"),
              Container(
                height: 200,
                margin: EdgeInsets.only(top: 10),
                child: ImageSlider(images: _getSliderImage()),
              ),
              SizedBox(height: 20),
              _getSeeAllHeading(context, "Services"),
              SizedBox(height: 10),
              Container(
                height: 90,
                child: ServiceHorizontalList(),
              ),
              SizedBox(height: 15),
              _getSeeAllHeading(context, "Top Rated Services"),
              SizedBox(height: 12),
              TopRatedService(),
              SizedBox(height: 15),
              _getSeeAllHeading(context, "Users Feedback"),
              UserFeedBackList(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  List<String> _getSliderImage() {
    List<String> img = [];
    img.add(
        "https://content3.jdmagicbox.com/comp/lucknow/u6/0522px522.x522.170405180105.a3u6/catalogue/raza-unisex-sallon-lucknow-chowk-lucknow-salons-28mbpy3.jpg");
    img.add("https://curlytales.com/wp-content/uploads/2023/09/Lucknow.jpg");
    img.add(
        "https://orane.com/wp-content/uploads/2020/04/62.-Professional-Spa-scaled-1.jpg");
    return img;
  }

  Widget _getSeeAllHeading(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: MyColor.textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () => _navigateToPages(context, text),
            child: Text(
              "See All",
              style: TextStyle(
                color: MyColor.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _navigateToPages(BuildContext context, String text) {
    switch (text) {
      case "Services":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AllServices()));
        break;
    }
  }
}

class TopRatedService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> st = [
      "Hello",
      "Hello",
      "Hello",
      "Hello",
      "Hello",
      "Hello",
      "Hello",
      "Hello",
      "Hello",
    ];

    return SizedBox(
      height: 310,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: st.length,
        itemBuilder: (context, index) {
          return Container(
            width: 250,
            margin: EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () => _navigateToSingleServiceView(context),
              child: Card(
                elevation: 4,
                color: MyColor.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 160,
                        margin: EdgeInsets.all(6),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                child: Image.network(
                                  "https://i.ytimg.com/vi/fnDDPPL4J9M/maxresdefault.jpg",
                                  fit: BoxFit.cover,
                                )),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: CircleAvatar(
                                backgroundColor: MyColor.secondaryColor,
                                child: Icon(Icons.favorite_border_rounded,
                                    color: MyColor.textColor),
                              ),
                            ),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            decoration: BoxDecoration(
                                color: MyColor.lightPrimaryExtra,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Container(
                                margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                child: Text(
                                  "Saloon",
                                  style: TextStyle(
                                      color: MyColor.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ))),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_rounded,
                                size: 20,
                                color: Colors.amberAccent,
                              ),
                              Text(
                                "4.4",
                                style: TextStyle(color: MyColor.textColorLight),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "Mindful Movement",
                          style: TextStyle(
                              color: MyColor.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_rounded,
                            color: MyColor.textColorLight,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Vibhav Tiwari",
                            style: TextStyle(
                                color: MyColor.textColorLight,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "₹100.22",
                          style: TextStyle(
                              color: MyColor.primaryColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 18),
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _navigateToSingleServiceView(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ParticularServiceFullView()));
  }
}

class ServiceHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
      'Item 6',
      'Item 6',
      'Item 6',
      'Item 6',
      'Item 6',
      'Item 6',
      'Item 6',
      'Item 6',
      'Item 6',
      'Item 6',
      'Item 6',
    ];


    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              margin: index == 0 ? EdgeInsets.only(left: 12) : EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: MyColor.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Icon(
                      Icons.miscellaneous_services_outlined,
                      size: 30,
                      color: MyColor.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    items[index],
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class UserFeedBackList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> feedbackList = [
      {
        'profilePhoto':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU063y1Mabhxfmcs8CMW8QAsh72jiG51jqIrYMswA_oA&s',
        'userName': 'John Doe',
        'rating': 4.5,
        'message': 'Great experience with the app!'
      },
      {
        'profilePhoto':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU063y1Mabhxfmcs8CMW8QAsh72jiG51jqIrYMswA_oA&s',
        'userName': 'John Doe',
        'rating': 4.5,
        'message': 'Great experience with the app!'
      },
      {
        'profilePhoto':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU063y1Mabhxfmcs8CMW8QAsh72jiG51jqIrYMswA_oA&s',
        'userName': 'John Doe',
        'rating': 4.5,
        'message': 'Great experience with the app!'
      },
      {
        'profilePhoto':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU063y1Mabhxfmcs8CMW8QAsh72jiG51jqIrYMswA_oA&s',
        'userName': 'John Doe',
        'rating': 4.5,
        'message': 'Great experience with the app!'
      },
      {
        'profilePhoto':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU063y1Mabhxfmcs8CMW8QAsh72jiG51jqIrYMswA_oA&s',
        'userName': 'John Doe',
        'rating': 4.5,
        'message': 'Great experience with the app!'
      },
      {
        'profilePhoto':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU063y1Mabhxfmcs8CMW8QAsh72jiG51jqIrYMswA_oA&s',
        'userName': 'John Doe',
        'rating': 4.5,
        'message': 'Great experience with the app!'
      },
      {
        'profilePhoto':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU063y1Mabhxfmcs8CMW8QAsh72jiG51jqIrYMswA_oA&s',
        'userName': 'John Doe',
        'rating': 4.5,
        'message': 'Great experience with the app!'
      },
      // Add more feedback items as needed
    ];

    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: feedbackList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final feedback = feedbackList[index];
          return Container(
            width: 230,
            margin: EdgeInsets.all(8),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              NetworkImage(feedback['profilePhoto']),
                        ),
                        SizedBox(width: 8),
                        Text(
                          feedback['userName'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: feedback['rating'],
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(feedback['message']),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
