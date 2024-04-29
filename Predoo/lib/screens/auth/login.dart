
import 'package:flutter/material.dart';
import 'package:predoo/screens/auth/forget.dart';
import 'package:predoo/screens/auth/register.dart';
import 'package:predoo/screens/home/home.dart';
import 'package:predoo/screens/home/user_dashboard.dart';
import 'package:predoo/utils/color.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    bool isChecked = false;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    "Let's Sign You In",
                    style: TextStyle(
                        color: MyColor.darkPrimaryColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(color: MyColor.textColorLight, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: CustomTextField(
                    labelText: "Mobile No.",
                    inputType: TextInputType.phone,
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: CustomTextField(
                    labelText: "password",
                    inputType: TextInputType.visiblePassword,
                    isPassword: true,
                  )),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 6),
                    child: Row(
                      children: [
                        Checkbox(
                          value: isChecked, // isChecked is a boolean variable to track the checkbox state
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                          checkColor: MyColor.textColorLight, // Change checkbox color
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(
                              color: MyColor.darkPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () =>_navigateToForgetPasswordPage(context),
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyColor.orangeColor),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40
              ),
              InkWell(
                onTap: ()=>_navigateToHomePage(context),
                child: Container(
                  margin: EdgeInsets.only(left: 16,right: 16),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: MyColor.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(20),
                        child: Text("Login",style: TextStyle(color: MyColor.secondaryColor,fontSize: 16,fontWeight: FontWeight.w600)
                        )
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10,bottom: 10),
                child: Center(
                    child: Text("or",style: TextStyle(fontSize: 16,color: MyColor.textColorLight))
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: MyColor.backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Center(
                  child: Container(
                      margin: EdgeInsets.all(18),
                      child: Text("Continue with Google",style: TextStyle(color: MyColor.darkPrimaryColor,fontSize: 18,fontWeight: FontWeight.w600)
                      )
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have Account? ",style: TextStyle(color: MyColor.textColorLight),),
                  InkWell(
                      onTap: () => _navigateToRegisterPage(context),
                      child: Text("Sign Up",style: TextStyle(color: MyColor.primaryColor,fontWeight: FontWeight.w700),)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  checkChange() {}

  void _navigateToRegisterPage(BuildContext ctx) {
    print("okk");
    Navigator.push(
        ctx,
        MaterialPageRoute(builder: (ctx) => RegisterScreen())
    );
  }

  void _navigateToForgetPasswordPage(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(builder: (ctx) => ForgetPassScreen()),
    );
  }

  _navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => UserDashBoardScreen()),
    );
  }

}



class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextInputType inputType;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.inputType,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      keyboardType: widget.inputType,
      obscureText: widget.isPassword ? _isObscured : false,
      decoration: InputDecoration(
        hintText: widget.labelText,
        hintStyle: TextStyle(color: MyColor.textColorLight),
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: MyColor.primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: MyColor.textColorLight, width: 1.0),
        ),
        isDense: true,
        labelText: widget.labelText,
        // This will move up when focused
        labelStyle: TextStyle(color: _isFocused ? Colors.blue : MyColor.textColorLight),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                  color: MyColor.textColorLight,
                ),
                onPressed: _togglePasswordVisibility,
              )
            : null,
      ),
      onChanged: (value) {
        // Handle value changes
      },
    );
  }
}
