import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:predoo/screens/home/booking.dart';
import 'package:predoo/screens/home/home.dart';
import 'package:predoo/screens/home/profile.dart';
import 'package:predoo/screens/home/wishlist.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../../utils/color.dart';

class UserDashBoardScreen extends StatefulWidget {
  const UserDashBoardScreen({Key? key}) : super(key: key);

  @override
  State<UserDashBoardScreen> createState() => _UserDashBoardScreenState();
}

class _UserDashBoardScreenState extends State<UserDashBoardScreen> {
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  /*Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 14,
                            color: MyColor.textColorLight,
                          ),
                        ),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: MyColor.primaryColor,
                            ),
                            Text(
                              " Lucknow, India ",
                              style: TextStyle(
                                color: MyColor.textColor,
                                fontSize: 20,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: MyColor.textColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: MyColor.backgroundColor,
                      child: Icon(
                        Icons.notifications,
                        color: MyColor.textColor,
                      ),
                    ),
                  ],
                ),
              ),*/

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            margin: EdgeInsets.only(bottom: 16,top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 14,
                        color: MyColor.textColorLight,
                      ),
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: MyColor.primaryColor,
                        ),
                        Text(
                          " Lucknow, India ",
                          style: TextStyle(
                            color: MyColor.textColor,
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: MyColor.textColor,
                        ),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: MyColor.backgroundColor,
                  child: Icon(
                    Icons.notifications,
                    color: MyColor.textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: _getBody(selectedIndex),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 8),
          child: WaterDropNavBar(
            backgroundColor: Colors.white,
            onItemSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
              pageController.animateToPage(
                selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad,
              );
            },
            selectedIndex: selectedIndex,
            barItems: [
              BarItem(
                filledIcon: Icons.home,
                outlinedIcon: Icons.home_outlined,
              ),
              BarItem(
                filledIcon: Icons.favorite_rounded,
                outlinedIcon: Icons.favorite_border_rounded,
              ),
              BarItem(
                filledIcon: Icons.calendar_today,
                outlinedIcon: Icons.calendar_today_outlined,
              ),
              BarItem(
                filledIcon: Icons.person,
                outlinedIcon: Icons.person_outline,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBody(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return WishListScreen();
      case 2:
        return BookingListScreen();
      case 3:
        return ProfileScreen();
      default:
        return Container();
    }
  }
}

