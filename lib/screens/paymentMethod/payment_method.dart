import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final paymentMethod = [
    {"image": "assets/paymentMethod/credit-card.png", "name": "Flooz"},
    {"image": "assets/paymentMethod/paypal.png", "name": "Tmoney"},
    
  ];

  int selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
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
          "methode de Paiement",
          style: semibold18White,
        ),
      ),
      body: paymentMethodListContent(),
      bottomNavigationBar: addAmountButton(),
    );
  }

  addAmountButton() {
    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, '/creditCard');
      },
      child: Container(
        margin: const EdgeInsets.all(fixPadding * 2.0),
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
          "Ajouter (5000 F)",
          style: bold18White,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  paymentMethodListContent() {
    return ListView.builder(
      itemCount: paymentMethod.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selectedMethod = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(fixPadding * 2.0),
                child: Row(
                  children: [
                    Image.asset(
                      paymentMethod[index]['image'].toString(),
                      height: 28.0,
                      width: 40.0,
                    ),
                    widthSpace,
                    width5Space,
                    Expanded(
                      child: Text(
                        paymentMethod[index]['name'].toString(),
                        style: medium16Black33,
                      ),
                    ),
                    widthSpace,
                    Container(
                      height: 21.0,
                      width: 21.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFF9F8F8),
                        border: selectedMethod == index
                            ? Border.all(color: secondaryColor, width: 7.0)
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: (selectedMethod == index
                                    ? primaryColor
                                    : blackColor)
                                .withOpacity(0.15),
                            blurRadius: 6.0,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            paymentMethod.length == index + 1
                ? const SizedBox()
                : Container(
                    width: double.maxFinite,
                    height: 1.0,
                    color: greyD4Color,
                  )
          ],
        );
      },
    );
  }
}
