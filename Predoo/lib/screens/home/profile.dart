import 'package:flutter/material.dart';
import 'package:predoo/screens/home/contact.dart';
import 'package:predoo/screens/home/edit_profile.dart';
import 'package:predoo/screens/home/webview.dart';

import '../../utils/color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: ()=>_navigateToEditProfile(context),
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(left: 12, right: 12, top: 20),
                  decoration: BoxDecoration(
                      color: MyColor.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Vibhav Tiwari",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: MyColor.secondaryColor),
                          ),
                          Icon(
                            Icons.keyboard_double_arrow_right_rounded,
                            color: MyColor.secondaryColor,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone_android_rounded,
                            color: MyColor.secondaryColor,
                            size: 14,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "9305471882",
                            style: TextStyle(
                                color: MyColor.secondaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 1,
                          child: Container(
                              width: double.infinity,
                              child: _getIconWithTextWidget(
                                  Icons.person, "My Accounts"))),
                      Flexible(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            child: _getIconWithTextWidget(
                                Icons.calendar_today, "My Bookings"),
                          )),
                      Flexible(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            child: _getIconWithTextWidget(
                                Icons.wallet, "My Wallet"),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 12),
                child: Text(
                  "Others",
                  style: TextStyle(
                      color: MyColor.textColorLight,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ProfileActionList(
                title: "Help & Support",
                iconData: Icons.help_outline_rounded,
                myColors: MyColor.backgroundColor,
              ),
              ProfileActionList(
                title: "Privacy Policy",
                iconData: Icons.privacy_tip_rounded,
                myColors: MyColor.backgroundColor,
              ),
              ProfileActionList(
                title: "Terms and conditions",
                iconData: Icons.calendar_today,
                myColors: MyColor.backgroundColor,
              ),
              ProfileActionList(
                title: "Contact Us",
                iconData: Icons.call,
                myColors: MyColor.backgroundColor,
              ),
              ProfileActionList(
                title: "Rate us",
                iconData: Icons.star_border_rounded,
                myColors: MyColor.backgroundColor,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: MyColor.primaryColor, width: 1)),
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.power_settings_new_rounded,
                        color: MyColor.primaryColor,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Log Out",
                        style: TextStyle(
                            color: MyColor.primaryColor, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getIconWithTextWidget(IconData iconData, String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 2), // changes the shadow direction
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: MyColor.primaryColor,
            size: 24,
          ),
          SizedBox(height: 4), // Adding some space between icon and text
          Text(
            text,
            style: TextStyle(
              color: MyColor.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  _navigateToEditProfile(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
  }
}

class ProfileActionList extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Color myColors;

  const ProfileActionList({
    Key? key,
    required this.iconData,
    required this.title,
    required this.myColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              iconData,
              color: MyColor.primaryColor,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: ()=> _navigateToDiffrentPages(context,title),
            trailing: Icon(Icons.keyboard_arrow_right_rounded),
          ),
          Divider(
            thickness: 0.5,
            color: MyColor.textColorLight,
          )
        ],
      ),
    );
  }

  _navigateToDiffrentPages(BuildContext context, String title) {
    switch (title) {
      case "Privacy Policy":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WebviewScreen()));
        break;
      case "Terms and conditions":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WebviewScreen()));
        break;
      case "Contact Us":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ContactUsScreen()));
        break;
    }
  }
}
