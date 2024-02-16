import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';

class RideRequestScreen extends StatefulWidget {
  const RideRequestScreen({super.key});

  @override
  State<RideRequestScreen> createState() => _RideRequestScreenState();
}

class _RideRequestScreenState extends State<RideRequestScreen> {
  final rideList = [
    {
      "date": "Aujourd'ui",
      "time": "9H00",
      "pickup": "Hedzranawoe",
      "destination": "Kodjoviakope",
      "request": 2,
      "passenger": [
        "assets/myRides/image-2.png",
        "assets/myRides/image-4.png",
        "assets/myRides/image-3.png",
        "assets/myRides/image-5.png",
      ]
    },
    {
      "date": "Aujourd'ui",
      "time": "9H00",
      "pickup": "Hedzranawoe",
      "destination": "Kodjoviakope",
      "request": 2,
      "passenger": [
        "assets/myRides/image-2.png",
        "assets/myRides/image-4.png",
        "assets/myRides/image-3.png",
        "assets/myRides/image-5.png",
      ]
    },
   
   
    
    
   ];

  final requestList = [
    {
      "image": "assets/myRides/image-2.png",
      "name": "Germaine NOUGLO",
      "pickup": "Avedji",
      "destination": "Maison Blanche",
      "price": "1500F",
      "seat": 1
    },
    {
      "image": "assets/myRides/image-2.png",
      "name": "Germaine NOUGLO",
      "pickup": "Avedji",
      "destination": "Maison Blanche",
      "price": "2500F",
      "seat": 2
    },
    {
      "image": "assets/myRides/image-2.png",
      "name": "Germaine NOUGLO",
      "pickup": "Avedji",
      "destination": "Maison Blanche",
      "price": "1500F",
      "seat": 3
    },
    {
      "image": "assets/myRides/image-2.png",
      "name": "Germaine NOUGLO",
      "pickup": "Avedji",
      "destination": "Maison Blanche",
      "price": "2500F",
      "seat": 3
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
          "Demander une course",
          style: semibold18White,
        ),
      ),
      body: rideListCotent(size),
    );
  }

  rideListCotent(Size size) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
          vertical: fixPadding, horizontal: fixPadding * 2.0),
      physics: const BouncingScrollPhysics(),
      itemCount: rideList.length,
      itemBuilder: (context, index) {
        final passengerList = rideList[index]['passenger'] as List;
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/startRide');
          },
          child: Container(
            padding: const EdgeInsets.all(fixPadding),
            margin: const EdgeInsets.symmetric(vertical: fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.15),
                  blurRadius: 6.0,
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          dateTimeWidget(size, Icons.calendar_month_outlined,
                              rideList[index]['date'].toString()),
                          const Text(
                            " | ",
                            style: medium14Black33,
                          ),
                          dateTimeWidget(size, Icons.access_time,
                              rideList[index]['time'].toString()),
                        ],
                      ),
                      height5Space,
                      address(greenColor, rideList[index]['pickup'].toString()),
                      verticalDivider(),
                      address(
                          redColor, rideList[index]['destination'].toString()),
                      height5Space,
                      SingleChildScrollView(
                        child: Row(
                          children: List.generate(
                            4,
                            (i) => passengerList.length > i
                                ? Container(
                                    height: 25.0,
                                    width: 25.0,
                                    margin: const EdgeInsets.only(right: 5.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          passengerList[i].toString(),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 25.0,
                                    width: 25.0,
                                    margin: const EdgeInsets.only(right: 5.0),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: d9E3EAColor,
                                    ),
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      CupertinoIcons.person_fill,
                                      color: whiteColor,
                                      size: 18.0,
                                    ),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                width5Space,
                requestButton(size, index),
              ],
            ),
          ),
        );
      },
    );
  }

  requestButton(Size size, int index) {
    return GestureDetector(
      onTap: () {
        requestBottomSheet(size);
      },
      child: Container(
        padding: const EdgeInsets.all(fixPadding * 0.9),
        constraints: BoxConstraints(maxWidth: size.width * 0.3),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: primaryColor),
          boxShadow: [
            BoxShadow(
              color: secondaryColor.withOpacity(0.1),
              blurRadius: 12.0,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Text(
          "Commande(${rideList[index]['request']})",
          style: semibold15Primary,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  requestBottomSheet(Size size) {
    return showModalBottomSheet(
      backgroundColor: whiteColor,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: size.height - 60,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.0),
        ),
      ),
      context: context,
      builder: (context) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(fixPadding * 2.0),
          itemCount: requestList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: fixPadding),
              padding: const EdgeInsets.all(fixPadding),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.15),
                    blurRadius: 6.0,
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                            image: AssetImage(
                              requestList[index]['image'].toString(),
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
                              requestList[index]['name'].toString(),
                              style: semibold15Black33,
                              overflow: TextOverflow.ellipsis,
                            ),
                            height5Space,
                            address(greenColor,
                                rideList[index]['pickup'].toString()),
                            verticalDivider(),
                            address(redColor,
                                rideList[index]['destination'].toString()),
                            height5Space,
                            Text(
                              "${requestList[index]['price']} (1 siege)",
                              style: semibold15Primary,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  //heightSpace,
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(fixPadding),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: [
                                BoxShadow(
                                  color: blackColor.withOpacity(0.15),
                                  blurRadius: 6.0,
                                )
                              ],
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "Refuser",
                              style: semibold16Primary,
                            ),
                          ),
                        ),
                      ),
                      widthSpace,
                      widthSpace,
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.popAndPushNamed(context, '/startRide');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(fixPadding),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(5.0),
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
                              "Accepter",
                              style: semibold16White,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  verticalDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 0.6),
      child: DottedBorder(
        padding: EdgeInsets.zero,
        dashPattern: const [1.9, 3.9],
        color: greyColor,
        strokeWidth: 1.2,
        child: const SizedBox(height: 6.0),
      ),
    );
  }

  address(Color color, String address) {
    return Row(
      children: [
        Container(
          height: 12.0,
          width: 12.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.location_pin,
            color: color,
            size: 9.0,
          ),
        ),
        widthSpace,
        Expanded(
          child: Text(
            address,
            style: medium12Grey,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  dateTimeWidget(Size size, IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          color: black33Color,
          size: 14.5,
        ),
        width5Space,
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width * 0.18),
          child: Text(
            title,
            style: medium14Black33,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
