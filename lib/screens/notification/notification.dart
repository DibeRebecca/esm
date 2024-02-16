import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:esm/theme/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationList = [
    {
      "title": "Accepter la demande ",
      "description": "Felicitations Job a accepté votre demande",
      "time": "2min"
    },
    {
      "title": "Refuser la demande",
      "description": "Jenny wisdom a refusé votre demande",
      "time": "2min"
    },
    {
      "title": "Ajouter de l'argent",
      "description":
          "Felicitations vous avez 1000 F de plus",
      "time": "2min"
    },
    {
      "title": "Accepter la demande ",
      "description": "Felicitations Job a accepté votre demande",
      "time": "2min"
    },
  ];


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
          "Notifications",
          style: semibold18White,
        ),
      ),
      body: notificationList.isEmpty
          ? emptyListContent(size)
          : notificationListContent(),
    );
  }

  emptyListContent(Size size) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(fixPadding * 2.0),
        physics: const BouncingScrollPhysics(),
        children: [
          Image.asset(
            "assets/notification/empty-icon.png",
            height: size.height * 0.07,
          ),
          heightSpace,
          height5Space,
          const Text(
            "pas de nouvelles notifications",
            style: semibold18Grey,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  notificationListContent() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: fixPadding / 2),
      itemCount: notificationList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                setState(() {
                  notificationList.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: blackColor,
                    duration: Duration(milliseconds: 1500),
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                      "Supprimé des notifications",
                      style: semibold15White,
                    ),
                  ),
                );
              },
              background: Container(color: redColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: fixPadding * 1.5, horizontal: fixPadding * 2.0),
                child: Row(
                  children: [
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(0.15),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Iconify(
                        Carbon.notification,
                        color: secondaryColor,
                      ),
                    ),
                    widthSpace,
                    width5Space,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notificationList[index]['title'].toString(),
                            style: semibold16Black33,
                          ),
                          heightBox(3.0),
                          Text(
                            notificationList[index]['description'].toString(),
                            style: medium14Black33,
                          ),
                          heightBox(3.0),
                          Text(
                            "depuis ${notificationList[index]['time']}",
                            style: semibold14Grey,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            notificationList.length == index + 1
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
