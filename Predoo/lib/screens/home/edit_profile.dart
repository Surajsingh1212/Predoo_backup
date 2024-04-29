import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:predoo/screens/auth/login.dart';
import 'package:predoo/utils/color.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
        title: Text(
          "Edit Profile",
          style: TextStyle(
              color: MyColor.secondaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: MyColor.secondaryColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 60,
            color: MyColor.primaryColor,
          ),
          SingleChildScrollView(
            child: Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColor.secondaryColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)
                      )
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:Border.all(
                              color: MyColor.primaryColor,
                              width: 3, // Adjust the width to change the thickness of the ring
                            ),
                          ),
                          child: Stack(
                            clipBehavior: Clip.hardEdge,
                            fit: StackFit.passthrough,
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                height: 106,
                                width: 106,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(53),
                                  child: Image.network(
                                    "https://miro.medium.com/v2/resize:fit:495/0*xFuo_UNWchLZ8bqS.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: MyColor.backgroundColor,
                                  child: IconButton(
                                    icon: Icon(Icons.camera_alt_rounded, size: 22, color: MyColor.primaryColor), // Adjusted icon size and color
                                    onPressed: () {
                                      // Add your onPressed functionality here
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
            
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: EditProfileTextField(
                            inputType: TextInputType.name,
                            text: "Vibhav Tiwari",
                            labelText: "Name",
                          ),
                        ),
            
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: EditProfileTextField(
                            inputType: TextInputType.phone,
                            text: "9305471882",
                            labelText: "Phone",
                          ),
                        ),
            
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: EditProfileTextField(
                            inputType: TextInputType.name,
                            text: "vibhavTiwari29903@gmail.com",
                            labelText: "Email",
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                          decoration: BoxDecoration(
                            color: MyColor.primaryColor,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: Text(
                                "Update",
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: MyColor.secondaryColor),
            
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EditProfileTextField extends StatelessWidget {

  String labelText;
  TextInputType inputType;
  String text;

  TextEditingController _textEditingController = TextEditingController();

  EditProfileTextField({
    Key? key,
    required this.labelText,
    required this.inputType,
    required this.text
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    _textEditingController.text = text;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(labelText,style: TextStyle(fontWeight: FontWeight.bold,color: MyColor.darkPrimaryColor,fontSize: 16),),
          SizedBox(
            height: 4,
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blue.withOpacity(0.1), // Adjust opacity as needed
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none, // Hide the border
              ),
            ),
            controller: _textEditingController
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

