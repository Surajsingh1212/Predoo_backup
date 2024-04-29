import 'package:flutter/material.dart';
import 'package:predoo/screens/home/booking_full_detail.dart';

import '../../utils/color.dart';
import '../../utils/utils.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({super.key});

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          BackgroundContainer(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 5),
              child: Text(
                'My Bookings',
                style: TextStyle(
                    color: MyColor.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(child: BookingList())
        ],
      )),
    );
  }
}

class BookingList extends StatefulWidget {
  const BookingList({super.key});

  @override
  State<BookingList> createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => _navigateToFullView(context),
            child: Container(
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                color: MyColor.secondaryColor,
                shadowColor: MyColor.lightPrimaryExtra,
                elevation: 4,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Barbieri_-_ViaSophia25668.jpg/640px-Barbieri_-_ViaSophia25668.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: MyColor.lightPrimaryExtra,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  margin: EdgeInsets.only(left: 10, top: 10),
                                  padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                                  child: Text(
                                    "Cafe",
                                    style: TextStyle(
                                        color: MyColor.primaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(left: 10, top: 4),
                                  width: double.infinity,
                                  child: Text(
                                    "Cafe Name",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: MyColor.darkPrimaryColor,
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.only(left: 10, top: 4),
                                child: Row(
                                  children: [
                                    Text(
                                      "Booking Id: ",
                                      style: TextStyle(
                                          color: MyColor.textColorLight,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      "139494848585 ",
                                      style: TextStyle(
                                          color: MyColor.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Date Time: ",
                                      style: TextStyle(
                                          color: MyColor.textColorLight,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      "29-06-29 12:43:23 ",
                                      style: TextStyle(
                                          color: MyColor.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.5,
                      margin: (EdgeInsets.only(top: 20)),
                      decoration: BoxDecoration(color: MyColor.textColorLight),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: MyColor.primaryColor,
                                size: 20,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Ashiyana, Lucknow",
                                style: TextStyle(
                                  color: MyColor.textColorLight,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                            decoration: BoxDecoration(
                                color: MyColor.backgroundColor,
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              "Accepted",
                              style: TextStyle(
                                  color: MyColor.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _navigateToFullView(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => BookingFullDetailScreen()));
  }
}
