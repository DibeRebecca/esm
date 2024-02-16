import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';

class WalletTransactionScreen extends StatefulWidget {
  const WalletTransactionScreen({super.key});

  @override
  State<WalletTransactionScreen> createState() =>
      _WalletTransactionScreenState();
}

class _WalletTransactionScreenState extends State<WalletTransactionScreen> {
  final transactionList = [
    {
      "title": "Payé au conducteur",
      "name": "Rebecca ASSOGBA",
      "date": "25 janvier 2024",
      "amount": "1000",
      "expense": true
    },
    {
      "title": "Recu du passager",
      "name": "Marine ACAKPO",
      "date": "25 janvier 2024",
      "amount": "1500",
      "expense": false
    },
    
  ];

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
          "Transaction",
          style: semibold18White,
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        itemCount: transactionList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactionList[index]['title'].toString(),
                            style: semibold15Black33,
                            overflow: TextOverflow.ellipsis,
                          ),
                          height5Space,
                          Text(
                            "${transactionList[index]['name']} | ${transactionList[index]['date']}",
                            style: semibold13Grey,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Text(
                      "${transactionList[index]['amount']} F",
                      style: transactionList[index]['expense'] == true
                          ? semibold16Red
                          : semibold16Green,
                    )
                  ],
                ),
              ),
              transactionList.length == index + 1
                  ? const SizedBox()
                  : Container(
                      height: 1,
                      width: double.maxFinite,
                      color: greyD4Color,
                    )
            ],
          );
        },
      ),
    );
  }
}
