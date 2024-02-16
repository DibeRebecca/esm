import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final reviewList = [
    {
      "image": "assets/review/review-1.png",
      "name": "Jenny wilsom",
      "date": "25 jan 2023",
      "rate": "4.8",
      "detail":
          "Lorem ipsum dolor sit amet consectetur. Allaliquam sit mollis adipiscing donec ut sed. Dictum dignissim enim condimentum vitae aliquam sed."
    },
    {
      "image": "assets/review/review-2.png",
      "name": "Wade Warren",
      "date": "25 jan 2023",
      "rate": "3.5",
      "detail":
          "Lorem ipsum dolor sit amet consectetur. Allaliquam sit mollis adipiscing donec ut sed. Dictum dignissim enim condimentum vitae aliquam sed."
    },
    {
      "image": "assets/review/review-3.png",
      "name": "Leslie Alexander",
      "date": "24 jan 2023",
      "rate": "3.0",
      "detail":
          "Lorem ipsum dolor sit amet consectetur. Allaliquam sit mollis adipiscing donec ut sed. Dictum dignissim enim condimentum vitae aliquam sed."
    },
    {
      "image": "assets/review/review-4.png",
      "name": "Robert Fox",
      "date": "24 jan 2023",
      "rate": "4.0",
      "detail":
          "Lorem ipsum dolor sit amet consectetur. Allaliquam sit mollis adipiscing donec ut sed. Dictum dignissim enim condimentum vitae aliquam sed."
    },
    {
      "image": "assets/review/review-5.png",
      "name": "Cody Fisher",
      "date": "23 jan 2023",
      "rate": "2.5",
      "detail":
          "Lorem ipsum dolor sit amet consectetur. Allaliquam sit mollis adipiscing donec ut sed. Dictum dignissim enim condimentum vitae aliquam sed."
    },
    {
      "image": "assets/review/review-6.png",
      "name": "Ronald Richards",
      "date": "23 jan 2023",
      "rate": "3.5",
      "detail":
          "Lorem ipsum dolor sit amet consectetur. Allaliquam sit mollis adipiscing donec ut sed. Dictum dignissim enim condimentum vitae aliquam sed."
    },
    {
      "image": "assets/review/review-7.png",
      "name": "Kathryn Murphy",
      "date": "20 jan 2023",
      "rate": "3.0",
      "detail":
          "Lorem ipsum dolor sit amet consectetur. Allaliquam sit mollis adipiscing donec ut sed. Dictum dignissim enim condimentum vitae aliquam sed."
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
          "Review",
          style: semibold18White,
        ),
      ),
      body: reviewListContent(),
    );
  }

  reviewListContent() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(fixPadding * 2.0),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                        image: DecorationImage(
                          image: AssetImage(
                            reviewList[index]['image'].toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    widthSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviewList[index]['name'].toString(),
                            style: semibold16Black33,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            reviewList[index]['date'].toString(),
                            style: medium14Grey,
                          )
                        ],
                      ),
                    ),
                    widthSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reviewList[index]['rate'].toString(),
                          style: semibold16Grey,
                        ),
                        const Icon(
                          Icons.star_rounded,
                          color: secondaryColor,
                          size: 17.0,
                        )
                      ],
                    )
                  ],
                ),
                heightSpace,
                Text(
                  reviewList[index]['detail'].toString(),
                  style: medium14Grey,
                )
              ],
            ),
            reviewList.length == index + 1
                ? const SizedBox()
                : Container(
                    height: 1,
                    width: double.maxFinite,
                    color: greyD4Color,
                    margin:
                        const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
                  )
          ],
        );
      },
      itemCount: reviewList.length,
    );
  }
}
