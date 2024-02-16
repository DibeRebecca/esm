import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';

class AddAndSendMoneyScreen extends StatefulWidget {
  const AddAndSendMoneyScreen({super.key});

  @override
  State<AddAndSendMoneyScreen> createState() => _AddAndSendMoneyScreenState();
}

class _AddAndSendMoneyScreenState extends State<AddAndSendMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final id = data['id'];

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
        title: Text(
          id == 0 ? "Ajouter de l'argent" : "Envoyer sur Compte",
          style: semibold18White,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(fixPadding * 2.0),
        physics: const BouncingScrollPhysics(),
        children: [
          Image.asset(
            "assets/wallet/credit card.png",
            height: size.height * 0.23,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          amountField(id),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          height5Space,
          continueButton(id),
        ],
      ),
    );
  }

  continueButton(id) {
    return GestureDetector(
      onTap: () {
        id == 0
            ? Navigator.pushNamed(context, '/paymentMethod')
            : Navigator.pushNamed(context, '/paymentMethod');
      },
      child: Container(
        width: double.maxFinite,
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
            )
          ],
        ),
        alignment: Alignment.center,
        child: const Text(
          "Continuer",
          style: bold18White,
        ),
      ),
    );
  }

  amountField(id) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          id == 0 ? "Ajouter un montant" : "Montant à envoyer",
          style: semibold15Black33,
        ),
        heightSpace,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.15),
                blurRadius: 6.0,
              )
            ],
          ),
          child: TextField(
            style: semibold15Black33,
            cursorColor: primaryColor,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText:
                  id == 0 ? "Ajouter un montant" : "Montant à envoyer",
              hintStyle: medium15Grey,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding * 1.5,
              ),
              prefixText: "",
              prefixStyle: semibold15Black33,
              isDense: true,
            ),
          ),
        )
      ],
    );
  }
}
