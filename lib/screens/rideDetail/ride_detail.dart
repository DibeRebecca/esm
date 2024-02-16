import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';
import 'package:esm/widget/column_builder.dart';

class RideDetailScreen extends StatefulWidget {
  const RideDetailScreen({super.key});

  @override
  State<RideDetailScreen> createState() => _RideDetailScreenState();
}

class _RideDetailScreenState extends State<RideDetailScreen> {
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

  final passengerList = [
    {"image": "assets/rideDetail/passenger-1.png", "name": "Satah ADJOYI"},
    {"image": "assets/rideDetail/passenger-2.png", "name": "Brice TCHAMDJA"},
  ];

  final reviewList = [
    {
      /*"image": "assets/review/review-7.png",*/
      "name": "Rebecca",
      "date": "25 jan 2024",
      "rate": "4.8",
      "detail":
          "Course passionnante"
    },
    {
      /*"image": "assets/review/review-7.png",*/
      "name": "Rebecca",
      "date": "25 jan 2024",
      "rate": "4.8",
      "detail":
          "Course passionnante"
    },
    
  ];

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
        title: const Text(
          "Detail de la course",
          style: semibold18White,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          
          riderDetail(size),
          rideDetail(),
          heightSpace,
          heightSpace,
          //passangerDetail(),
          heightSpace,
          heightSpace,
          //requestBottomSheet(size),
          review(),
          //notificationListContent(),
          heightSpace,
          heightSpace,
          vehicleInfo()
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(fixPadding * 2.0),
        child: Row(
          children: [
            id == 0
                ? buttonWidget("Commander une course", () {
                    Navigator.pushNamed(context, '/success',
                        arguments: {"id": 0});
                  })
                : cancelButton(),
            widthSpace,
            widthSpace,
            buttonWidget("Message", () {
              Navigator.pushNamed(context, '/messages');
            }),
          ],
        ),
      ),
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
 review() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.0, vertical: fixPadding * 1.5),
      width: double.maxFinite,
      color: whiteColor,
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Notifications",
                  style: semibold17Secondary,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/review');
                },
                child: const Text(
                  "Voir tout",
                  style: semibold14Primary,
                ),
              )
            ],
          ),
          heightSpace,
          height5Space,
          ColumnBuilder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                         /* Container(
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
                          ),*/
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
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /*Text(
                                reviewList[index]['rate'].toString(),
                                style: semibold16Grey,
                              ),*/
                               Icon(
                                Icons.notifications,
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
                          margin: const EdgeInsets.symmetric(
                              vertical: fixPadding * 2.0),
                        )
                ],
              );
            },
            itemCount: reviewList.length,
          )
        ],
      ),
    );
  }
  cancelButton() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          cancelDialog();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: fixPadding, vertical: fixPadding * 1.4),
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
          child: const Text(
            "Annuler la course",
            style: bold18Primary,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  cancelDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          backgroundColor: whiteColor,
          insetPadding: const EdgeInsets.all(fixPadding * 3.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: fixPadding * 2.4, horizontal: fixPadding * 2.0),
                child: Text(
                  " Etes vous sur de vouloir annuler?",
                  style: semibold16Black33,
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding, vertical: fixPadding * 1.2),
                        color: secondaryColor,
                        alignment: Alignment.center,
                        child: const Text(
                          "Non",
                          style: semibold18White,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  widthBox(2.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context, "Annuler");
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding, vertical: fixPadding * 1.2),
                        color: secondaryColor,
                        alignment: Alignment.center,
                        child: const Text(
                          "Oui",
                          style: semibold18White,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  buttonWidget(String title, Function() onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: fixPadding, vertical: fixPadding * 1.4),
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
          child: Text(
            title,
            style: bold18White,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  vehicleInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: fixPadding * 1.5, horizontal: fixPadding * 2.0),
      width: double.maxFinite,
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "information du Vehicule",
            style: semibold17Secondary,
          ),
          heightSpace,
          height5Space,
          vehicleDetailWidget(
              "Modelde la Voiture", "Toyota Matrix | KJ 5454 | couleur"),
          heightSpace,
          heightSpace,
          vehicleDetailWidget("Support", "AC , Capot,  systeme de  Musique")
        ],
      ),
    );
  }

  vehicleDetailWidget(String title, String detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: semibold14Grey,
        ),
        Text(
          detail,
          style: medium14Black33,
        )
      ],
    );
  }


  rideDetail() {
    return Container(
      width: double.maxFinite,
      color: whiteColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0, vertical: fixPadding * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Detail du Chauffeur",
                        style: semibold17Secondary,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/mapView');
                      },
                      child: Text(
                        "Voir la localisation",
                        style: semibold14Green.copyWith(
                          color: const Color(0xFF048447),
                          decoration: TextDecoration.underline,
                          decorationColor: const Color(0xFF048447),
                          decorationThickness: 1.5,
                        ),
                      ),
                    )
                  ],
                ),
                heightSpace,
                heightSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    address(
                      greenColor,
                      '2715 Agoe Fiovi',
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: fixPadding),
                      child: DottedBorder(
                        padding: EdgeInsets.zero,
                        dashPattern: const [1.9, 3.9],
                        color: greyColor,
                        strokeWidth: 1.2,
                        child: const SizedBox(height: 14.0),
                      ),
                    ),
                    address(
                      redColor,
                      'Agoe, Koshigan',
                    ),
                  ],
                ),
              ],
            ),
          ),
          DottedBorder(
            padding: EdgeInsets.zero,
            dashPattern: const [2, 4.2],
            color: greyColor,
            child: const SizedBox(
              width: double.maxFinite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0, vertical: fixPadding * 1.5),
            child: Row(
              children: [
                detailWidget("Depart", "25 Juin,09 H", 3),
                verticaldivider(),
                detailWidget("Arrivée", "25 juin,09 H", 3),
                verticaldivider(),
                detailWidget("Partir avec ", "150 personnes", 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  verticaldivider() {
    return Container(
      height: 40,
      width: 1,
      color: greyD4Color,
      margin: const EdgeInsets.symmetric(horizontal: fixPadding / 2),
    );
  }

  detailWidget(String title, String detail, int flex) {
    return Expanded(
      flex: flex,
      child: Column(
        children: [
          Text(
            title,
            style: semibold14Black33,
            overflow: TextOverflow.ellipsis,
          ),
          height5Space,
          Text(
            detail,
            style: semibold14Grey,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  address(Color color, String address) {
    return Row(
      children: [
        Container(
          height: 20.0,
          width: 20.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.location_pin,
            color: color,
            size: 15.0,
          ),
        ),
        widthSpace,
        Expanded(
          child: Text(
            address,
            style: medium14Black3C,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  riderDetail(Size size) {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        children: [
          Container(
            height: size.width * 0.21,
            width: size.width * 0.21,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
              image: const DecorationImage(
                image: AssetImage("assets/rideDetail/rider-image.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          widthSpace,
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jacob ACAKPO",
                  style: semibold17Black33,
                  overflow: TextOverflow.ellipsis,
                ),
                height5Space,
                Row(
                  children: [
                    Text(
                      "4.8",
                      style: semibold14Grey,
                    ),
                    Icon(
                      Icons.star,
                      color: secondaryColor,
                      size: 15.0,
                    ),
                    Expanded(
                      child: Text(
                        " | 120 vues",
                        style: semibold14Grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                height5Space,
                Text(
                  "Rejoint en 2023",
                  style: semibold14Grey,
                )
              ],
            ),
          ),
          widthSpace,
          const Text(
            "1500 F",
            style: semibold18Primary,
          ),
        ],
      ),
    );
  }
}
