import 'package:flutter/material.dart';
import 'package:predoo/screens/auth/otpVerification.dart';
import 'package:predoo/screens/auth/login.dart';
import 'package:predoo/utils/color.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {

    bool isChecked = true;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: MyColor.darkPrimaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Registration",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: MyColor.darkPrimaryColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Getting Started",
                  style: TextStyle(
                      color: MyColor.darkPrimaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w600),
                )),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                child: Text(
                  "Seems are you new here let's setup your profile",
                  style: TextStyle(
                      color: MyColor.textColorLight,
                      fontSize: 28,
                      fontWeight: FontWeight.w300),
                )),
            SizedBox(
              height: 40,
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: CustomTextField(
                    labelText: "Full Name", inputType: TextInputType.name)),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: CustomTextField(
                    labelText: "Email", inputType: TextInputType.emailAddress)),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: CustomTextField(
                    labelText: "Mobile", inputType: TextInputType.phone)),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
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
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 12,right: 16),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked, // isChecked is a boolean variable to track the checkbox state
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    checkColor: MyColor.orangeColor, // Change checkbox color
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "By Creating an account, you agree to our",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                      ),
                      Text("Terms and Conditions",style: TextStyle(color: MyColor.orangeColor,fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              onTap: ()=> _navigateToOtpVefifcaton(context),
              child: Container(
                margin: EdgeInsets.only(left: 16,right: 16,top: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: MyColor.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Center(
                  child: Container(
                      margin: EdgeInsets.all(20),
                      child: Text("Continue",style: TextStyle(color: MyColor.secondaryColor,fontSize: 16,fontWeight: FontWeight.w600)
                      )
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have Account? ",style: TextStyle(color: MyColor.textColorLight),),
                  InkWell(
                      onTap: () => _navigateToLoginPage(context),
                      child: Text("Login",style: TextStyle(color: MyColor.primaryColor,fontWeight: FontWeight.w700),)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _navigateToLoginPage(BuildContext context) {
    Navigator.of(context).pop();
  }
  _navigateToOtpVefifcaton(BuildContext ctx) {
    Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => OtpVerification()));
  }


}
