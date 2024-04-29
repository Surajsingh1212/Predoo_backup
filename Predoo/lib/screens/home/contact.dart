

import 'package:flutter/material.dart';
import 'package:predoo/utils/color.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
            child: Text("You can get in touch through below platform. Our Team will reach out to you as soon as it would possible",
            style: TextStyle(color: MyColor.textColorLight,fontWeight: FontWeight.bold,fontSize: 14),),
          )
        ],
      ),
    );
  }

  void launch(String s) {

  }
}