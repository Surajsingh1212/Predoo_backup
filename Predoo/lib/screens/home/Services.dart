import 'package:flutter/material.dart';
import 'package:predoo/utils/color.dart';

class AllServices extends StatefulWidget {
  const AllServices({Key? key}) : super(key: key);

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          height: 30,
          width: 30,
          margin: EdgeInsets.only(left: 12),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: CircleAvatar(
              backgroundColor: MyColor.backgroundColor,
              child: Icon(Icons.arrow_back_rounded),
            ),
          ),
        ),
        title: Text(
          "Services",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: AllServicesList()),
          ],
        ),
      ),
    );
  }
}

class AllServicesList extends StatefulWidget {
  const AllServicesList({Key? key}) : super(key: key);

  @override
  State<AllServicesList> createState() => _AllServicesListState();
}

class _AllServicesListState extends State<AllServicesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
        ),
        itemCount: 10, // Number of items in the grid
        itemBuilder: (context, index) {
          return SizedBox(
            height: 120,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    child: Image.network(
                      "https://static.toiimg.com/photo/40684909.cms",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.3),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                ),
                Center(
                  child: Text(
                    "Services",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      color: MyColor.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

