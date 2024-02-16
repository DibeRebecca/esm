import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../theme/theme.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isSave = true;

  OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(color: blackColor.withOpacity(0.1), width: 1.2),
      borderRadius: BorderRadius.circular(5.0));

  OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColor, width: 1.2),
      borderRadius: BorderRadius.circular(5.0));

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0.0,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
        ),
        title: const Text(
          "Credit card",
          style: semibold18White,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(fixPadding / 2),
        physics: const BouncingScrollPhysics(),
        children: [
          creditCard(size),
          creditcardfrom(),
          heightSpace,
          height5Space,
        ],
      ),
      bottomNavigationBar: paymentButton(),
    );
  }

  paymentButton() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/paymentSuccess', arguments: {"id": 0});
        },
        child: Container(
          margin: const EdgeInsets.only(
              left: fixPadding * 2.0,
              right: fixPadding * 2.0,
              bottom: fixPadding * 2.0),
          padding: const EdgeInsets.symmetric(
              vertical: fixPadding * 1.4, horizontal: fixPadding * 2.0),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: secondaryColor.withOpacity(0.1),
                blurRadius: 12.0,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Text(
            "Continue",
            style: bold18White,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  creditCard(Size size) {
    return CreditCardWidget(
      height: size.height * 0.28,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      showBackView: isCvvFocused,
      obscureCardNumber: true,
      obscureCardCvv: true,
      isHolderNameVisible: true,
      cardType: CardType.mastercard,
      isChipVisible: false,
      padding: fixPadding * 1.5,
      cardBgColor: screenBgColor,
      bankName: "Credit card",
      backgroundImage: "assets/creditCard/card-bg.png",
      customCardTypeIcons: <CustomCardTypeIcon>[
        CustomCardTypeIcon(
          cardType: CardType.mastercard,
          cardImage: Image.asset(
            'assets/creditCard/Mastercard.png',
            height: 30,
            fit: BoxFit.cover,
          ),
        ),
      ],
      onCreditCardWidgetChange: (CreditCardBrand? creditCardBrand) {},
    );
  }

  creditcardfrom() {
    return CreditCardForm(
      obscureCvv: true,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      inputConfiguration: InputConfiguration(
        cardHolderDecoration: InputDecoration(
          hintText: "Enter name on card",
          hintStyle: medium16Grey,
          labelText: "Name on card",
          labelStyle: medium18Grey,
          filled: true,
          fillColor: whiteColor,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          border: InputBorder.none,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          isDense: true,
        ),
        cardNumberDecoration: InputDecoration(
          hintText: "Enter card number",
          hintStyle: medium16Grey,
          labelText: "Card number",
          labelStyle: medium18Grey,
          filled: true,
          fillColor: whiteColor,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          border: InputBorder.none,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          isDense: true,
        ),
        expiryDateDecoration: InputDecoration(
          hintText: "XX/YY",
          hintStyle: medium16Grey,
          labelText: "Expiry date",
          labelStyle: medium18Grey,
          filled: true,
          fillColor: whiteColor,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          border: InputBorder.none,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          isDense: true,
        ),
        cvvCodeDecoration: InputDecoration(
          hintText: "CVV",
          hintStyle: medium16Grey,
          labelText: "CVV",
          labelStyle: medium18Grey,
          filled: true,
          fillColor: whiteColor,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          border: InputBorder.none,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          isDense: true,
        ),
        cardHolderTextStyle: semibold16Black33,
        cardNumberTextStyle: semibold16Black33,
        expiryDateTextStyle: semibold16Black33,
        cvvCodeTextStyle: semibold16Black33,
      ),
      onCreditCardModelChange: (CreditCardModel? creditCardModel) {
        setState(() {
          cardNumber = creditCardModel!.cardNumber;
          expiryDate = creditCardModel.expiryDate;
          cardHolderName = creditCardModel.cardHolderName;
          cvvCode = creditCardModel.cvvCode;
          isCvvFocused = creditCardModel.isCvvFocused;
        });
      },
      formKey: formKey,
    );
  }
}
