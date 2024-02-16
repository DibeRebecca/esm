import 'package:esm/controllers/signup_controller.dart';
import 'package:esm/screens/auth/otp_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //TextEditingController controller=TextEditingController();
int _counter = 0;
        var countriess = countries;
      var filteredCountries = ["BJ", "BF","CI","TG"];
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
  }  final controller=Get.put(SignUpController());
  final _formkey=GlobalKey<FormState>();

  @override
  void initState() {
        // TODO: implement initState
        super.initState();
       for (var element in countriess) {
         for (var filteredc in filteredCountries) {
          if (filteredc == element.code){
            filter.add(element);
          }
         }
        }
      }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          headerImage(size),
          const SizedBox(height: 50,),
          registerTitle(),
           const SizedBox(height: 50,),
          //welcomeText(),
          Expanded(child: formWidget(),)
          
        ],
      ),
    );
  }

  registerButton() {
    return InkWell(
      onTap: () {
        //Navigator.pushNamed(context, '/otp');
        if(_formkey.currentState!.validate()){
          print("yes");
          //SignUpController.instance.registerUser(controller.email.text.trim(),controller.password.text.trim());
          SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
       Get.to(()=>const OTPVerificationScreen() );
        }
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
          "Inscription",
          style: bold18White,
        ),
      ),
    );
  
  }



formWidget() {
  return  Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      padding: const EdgeInsets.all(fixPadding * 2.0),
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
                        ),
        height: 400,
                  //width: size.width,
        child: Column(
            children: [
              Form(
                key: _formkey,
                child: Column(
                  children: [
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
                        controller: controller.name,
                        cursorColor: primaryColor,
                        style: semibold15Black33,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Nom",
                          hintStyle: semibold15Grey,
                          contentPadding: EdgeInsets.symmetric(vertical: fixPadding * 1.4),
                          prefixIcon: Icon(
                            CupertinoIcons.person,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
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
                      child: Container(
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
                          controller: controller.email,
                          cursorColor: primaryColor,
                          style: semibold15Black33,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: semibold15Grey,
                            contentPadding: EdgeInsets.symmetric(vertical: fixPadding * 1.4),
                            prefixIcon: Icon(
                              CupertinoIcons.mail,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
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
                      child:  IntlPhoneField(
                    controller: controller.phoneNo,
                    
                  disableLengthCheck: true,
                  showCountryFlag: true,
                  dropdownIconPosition: IconPosition.trailing,
                  dropdownIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: black33Color,
                    size: 20.0,
                  ),
                  cursorColor: primaryColor,
                   onChanged: (phone) {
              setState(() {
                            _selectedCountryCode = phone.countryCode;
                          });    },
                          onCountryChanged: (phone) {
                              setState(() {
                            _selectedCountryCode = phone.code;
                          });
                            },
                  style: semibold15Black33,
                  countries: filter,
                  initialCountryCode: 'TG',
                  languageCode: "fr",
                  dropdownTextStyle: semibold15Black33,
                  flagsButtonMargin: const EdgeInsets.symmetric(horizontal: fixPadding * 0.7),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Votre numero de telephone",
                    hintStyle: semibold15Grey,
                    contentPadding: EdgeInsets.symmetric(vertical: fixPadding * 1.4),
                  ),
                      
                    ),),
                    
                    
                    const SizedBox(height: 40,),
                    InkWell(
                onTap: () {
                  //Navigator.pushNamed(context, '/otp');
                  if(_formkey.currentState!.validate()){
                    String phoneNumberWithCountryCode =
                              '+$_selectedCountryCode${controller.phoneNo.text.trim()}';
                    //SignUpController.instance.registerUser(controller.email.text.trim(),controller.password.text.trim());
                    SignUpController.instance.phoneAuthentication(phoneNumberWithCountryCode);
                 Get.to(()=>const OTPVerificationScreen() );
                  }
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
                    "Inscription",
                    style: bold18White,
                  ),
                ),
              )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Text.rich(
            TextSpan(
              text: "Vous avez deja un compte?",
              style: const TextStyle(color: Colors.white),
              children: [
                const TextSpan(text: " "),
                TextSpan(
                  text: "Connectez-vous",
                  style: semibold16White,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, '/login');
                    },
                )
              ],
            ),),
            
            
            ],
          
        ),
      ),
  );
  
}

  
  emailField() {
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
      child:  TextField(
        //key: _formkey,
        controller: controller.email,
        cursorColor: primaryColor,
        style: semibold15Black33,
        keyboardType: TextInputType.emailAddress,
        decoration:const InputDecoration(
          border: InputBorder.none,
          hintText: "Email",
          hintStyle: semibold15Grey,
          contentPadding: EdgeInsets.symmetric(vertical: fixPadding * 1.4),
          prefixIcon: Icon(
            CupertinoIcons.mail,
            size: 20.0,
          ),
        ),
      ),
    );
  }

  nameField() {
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
      child:  TextField(
        //key: _formkey,
        controller: controller.name,
        cursorColor: primaryColor,
        style: semibold15Black33,
        keyboardType: TextInputType.name,
        decoration:const  InputDecoration(
          border: InputBorder.none,
          hintText: "Nom",
          hintStyle: semibold15Grey,
          contentPadding: EdgeInsets.symmetric(vertical: fixPadding * 1.4),
          prefixIcon: Icon(
            CupertinoIcons.person,
            size: 20.0,
          ),
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
      child:  TextField(
        key: _formkey,
        controller: controller.phoneNo,
        cursorColor: primaryColor,
        style: semibold15Black33,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Numero de telephone",
          hintStyle: semibold15Grey,
          contentPadding: EdgeInsets.symmetric(vertical: fixPadding * 1.4),
          prefixIcon: Icon(
            CupertinoIcons.phone,
            size: 20.0,
          ),
        ),
      ),
    );
  }

  welcomeText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Text(
        "",
        style: medium15Grey,
        textAlign: TextAlign.center,
      ),
    );
  }

  registerTitle() {
    return const Text(
      "Inscription",
      style: semibold20Black33,
      textAlign: TextAlign.center,
    );
  }

  headerImage(Size size) {
    return Container(
      decoration: const BoxDecoration(
          //color: primaryColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(60.0)),
        ),
      width: double.maxFinite,
      //height: size.height * 0.4,
      //color: primaryColor,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: fixPadding * 2.5),
            alignment: Alignment.center,
            child: Image.asset(
              "assets/auth/header-image.png",
              height: size.height * 0.22,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: fixPadding * 2.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: const EdgeInsets.all(fixPadding * 2.0),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: whiteColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
