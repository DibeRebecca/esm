import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';

class RideHistoryScreen extends StatefulWidget {
  const RideHistoryScreen({super.key});

  @override
  State<RideHistoryScreen> createState() => _RideHistoryScreenState();
}

class _RideHistoryScreenState extends State<RideHistoryScreen> {
  final ridesList = [
    {
      "image": "assets/myRides/image-5.png",
      "name": "Esther AKPOVI",
      "date": "26 Janvier 2024",
      "time": "9 H",
      "pickup": "Agoe Anome",
      "destination": "Sogbossito"
    },

    {
      "image": "assets/myRides/image-5.png",
      "name": "Esther AKPOVI",
      "date": "26 Janvier 2024",
      "time": "9 H",
      "pickup": "Agoe Anome",
      "destination": "Sogbossito"
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
          " historique des Trajets",
          style: semibold18White,
        ),
      ),
      body: rideListContent(size),
    );
  }

  rideListContent(Size size) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.0, vertical: fixPadding),
      physics: const BouncingScrollPhysics(),
      itemCount: ridesList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/historyRideDetail');
          },
          child: Container(
            width: double.maxFinite,
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
                Container(
                  height: size.width * 0.2,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      image: AssetImage(
                        ridesList[index]['image'].toString(),
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
                        ridesList[index]['name'].toString(),
                        style: semibold15Black33,
                        overflow: TextOverflow.ellipsis,
                      ),
                      height5Space,
                      Row(
                        children: [
                          dateTimeWidget(size, Icons.calendar_month_outlined,
                              ridesList[index]['date'].toString()),
                          const Text(
                            " | ",
                            style: medium12Black33,
                          ),
                          dateTimeWidget(size, Icons.access_time,
                              ridesList[index]['time'].toString()),
                        ],
                      ),
                      height5Space,
                      address(
                          greenColor, ridesList[index]['pickup'].toString()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding * 0.6),
                        child: DottedBorder(
                          padding: EdgeInsets.zero,
                          dashPattern: const [1.9, 3.9],
                          color: greyColor,
                          strokeWidth: 1.2,
                          child: const SizedBox(height: 6.0),
                        ),
                      ),
                      address(
                          redColor, ridesList[index]['destination'].toString()),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  dateTimeWidget(Size size, IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          color: black33Color,
          size: 14.0,
        ),
        width5Space,
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width * 0.2),
          child: Text(
            title,
            style: medium12Black33,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
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
}
