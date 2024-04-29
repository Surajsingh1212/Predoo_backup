import 'package:flutter/material.dart';
import 'package:predoo/screens/auth/login.dart';
import 'package:predoo/screens/auth/newPassword.dart';
import 'package:predoo/utils/color.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => _closePage(context),
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
                  "Forget Password",
                  style: TextStyle(
                      color: MyColor.textColorLight,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                )
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                "Enter your email address to reset the password",
                style: TextStyle(color: MyColor.textColorLight, fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16,right: 16,top: 20),
              child: CustomTextField(labelText: "Email address",inputType: TextInputType.emailAddress,),
            ),
            InkWell(
              onTap: () => _navigateToNewPassScreen(context),
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
                      child: Text("Reset Password",style: TextStyle(color: MyColor.secondaryColor,fontSize: 16,fontWeight: FontWeight.w600)
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
}

_closePage(BuildContext ctx) {
  Navigator.of(ctx).pop();
}

_navigateToNewPassScreen(BuildContext ctx) {
  Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => NewPasswordScreen()));
}
