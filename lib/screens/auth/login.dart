import 'dart:io';

import 'package:esm/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../controllers/auth_controller.dart';

final _authController = Get.put(AuthController());

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneFieldController = TextEditingController();
  final emailFieldController = TextEditingController();
  DateTime? backPressTime;
  int _counter = 0;
  var countriess = countries;
  var filteredCountries = ["BJ", "BF", "CI", "TG"];
  List<Country> filter = [];
  String? _selectedCountryCode;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  } //

  //final controller=Get.put(SignUpController());
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var element in countriess) {
      for (var filteredc in filteredCountries) {
        if (filteredc == element.code) {
          filter.add(element);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        } else {
          return false;
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              headerImage(size),
              loginTitle(),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 400,
                padding: const EdgeInsets.all(fixPadding * 2.0),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40.0)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    heightSpace,
                    //welcomeText(),
                    SizedBox(
                      height: 50,
                    ),
                    mobileNumberField(),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(0.1),
                            blurRadius: 12.0,
                            offset: const Offset(0, 6),
                          )
                        ],
                      ),
                      child: TextField(
                        controller: emailFieldController,
                        cursorColor: primaryColor,
                        style: semibold15Black33,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: semibold15Grey,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: fixPadding * 1.4),
                          prefixIcon: Icon(
                            CupertinoIcons.mail,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    loginButton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  loginButton() {
    return InkWell(
      onTap: () {
        //Navigator.pushNamed(context, '/home');
        String phoneNumberWithCountryCode =
            '$_selectedCountryCode${phoneFieldController.text.trim()}';
        _authController.login(
            email: emailFieldController.text,
            phone: phoneNumberWithCountryCode);
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0, vertical: fixPadding * 1.4),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: secondaryColor.withOpacity(0.1),
              blurRadius: 12.0,
              offset: const Offset(0, 6),
            )
          ],
        ),
        alignment: Alignment.center,
        child: const Text(
          "Se connecter",
          style: bold18White,
        ),
      ),
    );
  }

  mobileNumberField() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            blurRadius: 12.0,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: IntlPhoneField(
        controller: phoneFieldController,
        disableLengthCheck: true,
        showCountryFlag: true,
        dropdownIconPosition: IconPosition.trailing,
        dropdownIcon: Icon(
          Icons.keyboard_arrow_down,
          color: black33Color,
          size: 20.0,
        ),
        cursorColor: primaryColor,
        onChanged: (phone) {
          setState(() {
            _selectedCountryCode = phone.countryCode;
          });
        },
        onCountryChanged: (phone) {
          setState(() {
            _selectedCountryCode = phone.code;
          });
        },
        style: semibold15Black33,
        initialCountryCode: 'TG',
        dropdownTextStyle: semibold15Black33,
        flagsButtonMargin: EdgeInsets.symmetric(horizontal: fixPadding * 0.7),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Votre numero de télephone",
          hintStyle: semibold15Grey,
          contentPadding: EdgeInsets.symmetric(vertical: fixPadding * 1.4),
        ),
      ),
    );
  }

  welcomeText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Text(
        "Welcome, please login your account using mobile number",
        style: medium15Grey,
        textAlign: TextAlign.center,
      ),
    );
  }

  loginTitle() {
    return const Text(
      "Connexion",
      style: semibold20Black33,
      textAlign: TextAlign.center,
    );
  }

  headerImage(Size size) {
    return Container(
      padding: const EdgeInsets.only(top: fixPadding * 1.5),
      width: double.maxFinite,
      height: size.height * 0.45,
      //color: primaryColor,
      alignment: Alignment.center,
      child: Image.asset(
        "assets/auth/header-image.png",
        height: size.height * 0.22,
        fit: BoxFit.cover,
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (backPressTime == null ||
        now.difference(backPressTime!) > const Duration(seconds: 2)) {
      backPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 1500),
          behavior: SnackBarBehavior.floating,
          backgroundColor: blackColor,
          content: Text(
            "Press back once again to exit",
            style: semibold15White,
          ),
        ),
      );
      return false;
    } else {
      return true;
    }
  }
}
