import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  final faqsList = [
    {
      "question": "How to find ride?",
      "answer":
          "Lorem ipsum dolor sit amet, consecteadipiscindf elitj. Eu scelerisque neque nevestibulumaugued enullalkll quis mauris. solliciegestapellentesqueg adipiscing. Leo aliquam, aliquam novalaoreethg "
    },
    {
      "question": "How to find ride?",
      "answer":
          "Lorem ipsum dolor sit amet, consecteadipiscindf elitj. Eu scelerisque neque nevestibulumaugued enullalkll quis mauris. solliciegestapellentesqueg adipiscing. Leo aliquam, aliquam novalaoreethg "
    },
    {
      "question": "How to add money in wallet?",
      "answer":
          "Lorem ipsum dolor sit amet, consecteadipiscindf elitj. Eu scelerisque neque nevestibulumaugued enullalkll quis mauris. solliciegestapellentesqueg adipiscing. Leo aliquam, aliquam novalaoreethg "
    },
    {
      "question": "How to chat with rider?",
      "answer":
          "Lorem ipsum dolor sit amet, consecteadipiscindf elitj. Eu scelerisque neque nevestibulumaugued enullalkll quis mauris. solliciegestapellentesqueg adipiscing. Leo aliquam, aliquam novalaoreethg "
    },
    {
      "question": "How to send money in bank?",
      "answer":
          "Lorem ipsum dolor sit amet, consecteadipiscindf elitj. Eu scelerisque neque nevestibulumaugued enullalkll quis mauris. solliciegestapellentesqueg adipiscing. Leo aliquam, aliquam novalaoreethg "
    },
    {
      "question": "How to add my vehicle?",
      "answer":
          "Lorem ipsum dolor sit amet, consecteadipiscindf elitj. Eu scelerisque neque nevestibulumaugued enullalkll quis mauris. solliciegestapellentesqueg adipiscing. Leo aliquam, aliquam novalaoreethg "
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
          "FAQs",
          style: semibold18White,
        ),
      ),
      body: faqsListContent(),
    );
  }

  faqsListContent() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: faqsList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(fixPadding * 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    faqsList[index]['question'].toString(),
                    style: semibold16Black33,
                  ),
                  height5Space,
                  Text(
                    faqsList[index]['answer'].toString(),
                    style: medium15Grey,
                  )
                ],
              ),
            ),
            faqsList.length == index + 1
                ? const SizedBox()
                : Container(
                    width: double.maxFinite,
                    height: 1,
                    color: greyD4Color,
                  )
          ],
        );
      },
    );
  }
}
