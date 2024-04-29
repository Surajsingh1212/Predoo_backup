import 'package:flutter/material.dart';

import '../../utils/color.dart';
import 'login.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: ()=>_closePage(context),
              child: Container(
                margin: EdgeInsets.all(12),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: MyColor.darkPrimaryColor,
                  size: 30,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 16,top: 20),
                child: Text(
                  "Set New Password",
                  style: TextStyle(
                      color: MyColor.darkPrimaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                )
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                "Create strong and secured new password",
                style: TextStyle(color: MyColor.textColorLight, fontSize: 25),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20,top: 30),
                child: CustomTextField(
                  labelText: "New Password", inputType: TextInputType.name,isPassword: true,)),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: CustomTextField(
                  labelText: "Confirm Password", inputType: TextInputType.name,isPassword: true,)
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(left: 16,right: 16,top: 40),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: MyColor.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Center(
                  child: Container(
                      margin: EdgeInsets.all(20),
                      child: Text("Save Password",style: TextStyle(color: MyColor.secondaryColor,fontSize: 16,fontWeight: FontWeight.w600)
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _closePage(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }
}
