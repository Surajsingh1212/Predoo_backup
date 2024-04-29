import 'package:flutter/material.dart';

import '../../utils/color.dart';

class ParticularServiceFullView extends StatefulWidget {
  const ParticularServiceFullView({Key? key}) : super(key: key);

  @override
  State<ParticularServiceFullView> createState() =>
      _ParticularServiceFullViewState();
}

class _ParticularServiceFullViewState extends State<ParticularServiceFullView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 270,
            child: Image.network(
              "https://res.cloudinary.com/conferences-and-exhibitions-pvt-ltd/image/upload/v1668943139/Review/2022/November-2022/Raipur/Untitled_xibvfi.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            height: 35,
            width: 35,
            top: 50,
            left: 20,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: CircleAvatar(
                backgroundColor: MyColor.secondaryColor,
                child: Icon(Icons.arrow_back_rounded, color: MyColor.textColor),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: MyColor.secondaryColor,
                  child: Icon(Icons.favorite_border_rounded,
                      color: MyColor.textColor),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12),
                  child: CircleAvatar(
                    backgroundColor: MyColor.secondaryColor,
                    child: Icon(Icons.share, color: MyColor.textColor),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: MyColor.secondaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 14, top: 10, right: 14, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  "Glamour Heaven",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 25,
                                      color: MyColor.darkPrimaryColor),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    size: 24,
                                    color: Colors.amberAccent,
                                  ),
                                  Text(
                                    "4.4 (1k+ Reviews)",
                                    style: TextStyle(
                                        color: MyColor.textColorLight,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "Hair Cut, Makeupm, Shavingm, Massage",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: MyColor.primaryColor),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: MyColor.primaryColor,
                                size: 18,
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
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: MyColor.primaryColor,
                                size: 18,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "15 min 13km * Mon Sun | 11am-11pm",
                                style: TextStyle(
                                  color: MyColor.textColorLight,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          SingleChildScrollView(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _getTheOptionInAvatar(
                                    Icons.open_in_browser_rounded, "Message"),
                                _getTheOptionInAvatar(Icons.message, "Message"),
                                _getTheOptionInAvatar(Icons.call, "Call"),
                                _getTheOptionInAvatar(
                                    Icons.directions, "Direction"),
                                _getTheOptionInAvatar(Icons.share, "Share"),
                              ],
                            ),
                          ),
                          Container(
                              height: 450,
                              width: double.infinity,
                              child: Expanded(child: _buildTabLayout()))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)), // Corner radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                    color: MyColor.primaryColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Book Now",
                    style: TextStyle(
                        fontSize: 12,
                        color: MyColor.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getTheOptionInAvatar(IconData icons, String s) {
    return Container(
      margin:
          s == "Website" ? EdgeInsets.only(left: 0) : EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: MyColor.lightPrimaryExtra,
            child: Icon(
              icons,
              size: 20,
              color: MyColor.primaryColor,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "$s",
            style: TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }

  Widget _buildTabLayout() {
    return DefaultTabController(
      length: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            isScrollable: true,
            labelColor: MyColor.primaryColor,
            indicatorColor: MyColor.primaryColor,
            unselectedLabelStyle: TextStyle(color: MyColor.textColorLight),
            tabs: [
              Tab(text: 'Services'),
              Tab(text: 'Package'),
              Tab(text: 'Specialist'),
              Tab(text: 'Gallery'),
              Tab(text: 'Reviews'),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              children: [
                ServicesPage(),
                PackagePage(),
                SpecialistPage(),
                GalleryPage(),
                ReviewsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onClick() {}
}

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Services (18)",
          style: TextStyle(
              color: MyColor.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        Expanded(
          flex: 1,
            child: _getServicesList(context))
      ],
    );
  }

  Widget _getServicesList(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 8,right: 8,top: index == 0? 0:10),
              padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
              decoration: BoxDecoration(
                color: MyColor.secondaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: MyColor.lightPrimaryExtra,width: 0.5,style: BorderStyle.solid)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hair Cut",
                    style: TextStyle(
                        fontSize: 15,
                        color: MyColor.textColorLight,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Text(
                        "10 Types",
                        style: TextStyle(
                            fontSize: 15,
                            color: MyColor.textColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,color: MyColor.primaryColor,size: 20,)
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}

class PackagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Package Page'),
    );
  }
}

class SpecialistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Specialist Page'),
    );
  }
}

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Gallery Page'),
    );
  }
}

class ReviewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Reviews Page'),
    );
  }
}
