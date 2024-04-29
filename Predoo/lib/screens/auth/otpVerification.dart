import 'package:flutter/material.dart';
import 'package:predoo/utils/color.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OTP Verification",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: MyColor.darkPrimaryColor
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40,),
          Text(
            "An Authentication code has been sent to",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: MyColor.darkPrimaryColor,
            ),
          ),
          Text(
            "+91 XXXXXX8180",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: MyColor.primaryColor,
            ),
          ),
          SizedBox(height: 40,),
          OTPTextField(length: 4),
          Container(
            margin: EdgeInsets.only(left: 16,right: 16,top: 60),
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
        ],
      ),
    );
  }
}

class OTPTextField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onChanged;

  OTPTextField({required this.length, this.onChanged});

  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
    _controllers = List.generate(widget.length, (index) => TextEditingController());
    _configureFocusListeners();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _configureFocusListeners() {
    for (int i = 0; i < widget.length; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.length == 1) {
          if (i < widget.length - 1) {
            _focusNodes[i + 1].requestFocus();
          } else {
            _focusNodes[i].unfocus();
          }
        }
        _updateOTP();
      });
    }
  }

  void _updateOTP() {
    String otp = '';
    for (var controller in _controllers) {
      otp += controller.text;
    }
    if (widget.onChanged != null) {
      widget.onChanged!(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
            (index) => SizedBox(
          width: 50,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

