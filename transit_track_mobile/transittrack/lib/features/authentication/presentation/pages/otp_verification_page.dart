import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transittrack/core/routes/route_path.dart';
import 'package:transittrack/core/widget/button_widget.dart';
import 'package:transittrack/features/authentication/presentation/widget/input_field_widget.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 90, 15, 0),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/otp.png',
                  width: 430,
                  height: 272,
                ),
                Container(
                  height: 210,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('OTP Verification code', style: TextStyle(fontSize: 32),),
                      Text("Enter email or phone number", style: TextStyle(color: Color.fromRGBO(109, 109, 109, 1)),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3.0,25,2,25),
                        child: InputFieldWidget(
                          hintText: 'Phone Number',
                          controller: phoneNumberController,
                          context: context,
                          validation: null,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      ButtonWidget(
                          context: context,
                          text: 'Send',
                          onClick: () {
                            (context).goNamed(AppPath.login);
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
