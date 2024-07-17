import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transittrack/core/routes/route_path.dart';
import 'package:transittrack/core/widget/button_widget.dart';
import 'package:transittrack/core/widget/forward_widget.dart';
import 'package:transittrack/features/authentication/presentation/widget/input_field_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var _isObsecured;

  String? phoneNumberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number can not be empty';
    }
  }

  @override
  void initState() {
    super.initState();
    _isObsecured = true;
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 150, 30, 0),
            child: Container(
                height: 510,
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputFieldWidget(
                          hintText: 'Full Name',
                          controller: fullNameController,
                          context: context,
                          validation: null,
                          keyboardType: TextInputType.text,
                        ),
                        InputFieldWidget(
                          hintText: 'Phone Number',
                          controller: phoneNumberController,
                          context: context,
                          validation: phoneNumberValidation,
                          keyboardType: TextInputType.phone,
                        ),
                        InputFieldWidget(
                          obsecured: _isObsecured,
                          hintText: 'Password',
                          controller: passwordController,
                          context: context,
                          icon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObsecured = !_isObsecured;
                                });
                              },
                              icon: !_isObsecured
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          validation: null,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ButtonWidget(
                            context: context,
                            text: 'Sign Up',
                            onClick: () {
                              (context).goNamed(AppPath.login);
                            }),
                        GestureDetector(
                          onTap: () {
                            (context).goNamed(AppPath.login);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Do you have an account? '),
                              Text(
                                "Log In",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        )
                      ]),
                ))));
  }
}
