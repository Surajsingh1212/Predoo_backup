import 'package:flutter/material.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';
import 'package:predoo/utils/color.dart';

class BookingFullDetailScreen extends StatefulWidget {
  const BookingFullDetailScreen({super.key});

  @override
  State<BookingFullDetailScreen> createState() =>
      _BookingFullDetailScreenState();
}

class _BookingFullDetailScreenState extends State<BookingFullDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: MyColor.secondaryColor,
          ),
          onPressed: () => {Navigator.pop(context)},
        ),
        title: Text(
          "Booking Details",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: MyColor.secondaryColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
              child: Text(
                "Booking Id: BID18383883838",
                style: TextStyle(
                    color: MyColor.textColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w300),
              )),
          Container(
            height: 0.2,
            color: MyColor.textColorLight,
          ),
          Container(
            color: MyColor.secondaryColor,
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cafe Name",
                        style: TextStyle(
                            color: MyColor.darkPrimaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: MyColor.primaryColor,
                            size: 16,
                          ),
                          Text(
                            "Ashiyana, Lucknow",
                            style: TextStyle(
                                color: MyColor.textColorLight,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "₹11097",
                        style: TextStyle(
                            color: MyColor.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://t3.ftcdn.net/jpg/03/24/73/92/360_F_324739203_keeq8udvv0P2h1MLYJ0GLSlTBagoXS48.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              color: MyColor.secondaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Booking Status",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: MyColor.textColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BookingStatus()
                ],
              )
          ),

        ],
      ),
    );
  }
}

class BookingStatus extends StatelessWidget
{
  const BookingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderTrackerZen(

      tracker_data: [
        TrackerData(
          title: "Booking Updated",
          date: "Sat, 8 Apr '22",
          tracker_details: [
            TrackerDetails(
              title: "Your order was placed on Zenzzen",
              datetime: "Sat, 8 Apr '22 - 17:17",
            ),
            TrackerDetails(
              title: "Zenzzen Arranged A Callback Request",
              datetime: "Sat, 8 Apr '22 - 17:42",
            ),
          ],
        ),
        TrackerData(
          title: "Order Shipped",
          date: "Sat, 8 Apr '22",
          tracker_details: [
            TrackerDetails(
              title: "Your order was shipped with MailDeli",
              datetime: "Sat, 8 Apr '22 - 17:50",
            ),
          ],
        ),
        TrackerData(
          title: "Order Delivered",
          date: "Sat,8 Apr '22",
          tracker_details: [
            TrackerDetails(
              title: "You received your order, by MailDeli",
              datetime: "Sat, 8 Apr '22 - 17:51",
            ),
          ],
        ),
      ],
    );
  }
}



