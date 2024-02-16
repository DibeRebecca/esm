import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';

class FindRideScreen extends StatefulWidget {
  const FindRideScreen({super.key});

  @override
  State<FindRideScreen> createState() => _FindRideScreenState();
}

class _FindRideScreenState extends State<FindRideScreen> {
  final rideList = [
    {
      "pickupLocation": "Agoe Fiovi",
      "destinationLocation": "Hotel 2 Fevrier ",
      "price": "2500", 
      "image": "assets/findRide/rider-1.png",
      "name": "Rebecca TABOUKOUNA",
      "dateTime": "25 Janvier, 10H",
      "rate": 4.8,
      "bookedSeat": 2
    },
    {
      "pickupLocation": "Agoe Koshigan",
      "destinationLocation": "Hotel 2 Fevrier ",
      "price": "5000", 
      "image": "assets/findRide/rider-1.png",
      "name": "Rebecca TABOUKOUNA",
      "dateTime": "25 Janvier, 10H",
      "rate": 4.8,
      "bookedSeat": 3
    },
    {
      "pickupLocation": "Agoe Fiovi",
      "destinationLocation": "Hotel 2 Fevrier ",
      "price": "2300", 
      "image": "assets/findRide/rider-1.png",
      "name": "Rebecca TABOUKOUNA",
      "dateTime": "25 Janvier, 10H",
      "rate": 4.8,
      "bookedSeat": 1
    },
    {
      "pickupLocation": "Agoe Fiovi",
      "destinationLocation": "Hotel 2 Fevrier ",
      "price": "2500", 
      "image": "assets/findRide/rider-1.png",
      "name": "Rebecca TABOUKOUNA",
      "dateTime": "25 Janvier, 10H",
      "rate": 4.8,
      "bookedSeat": 4
    },
    {
      "pickupLocation": "Agoe Fiovi",
      "destinationLocation": "Hotel 2 Fevrier ",
      "price": "2500", 
      "image": "assets/findRide/rider-1.png",
      "name": "Rebecca TABOUKOUNA",
      "dateTime": "25 Janvier, 10H",
      "rate": 4.8,
      "bookedSeat": 2
    },
    {
      "pickupLocation": "Agoe Fiovi",
      "destinationLocation": "Hotel 2 Fevrier ",
      "price": "2500", 
      "image": "assets/findRide/rider-1.png",
      "name": "Rebecca TABOUKOUNA",
      "dateTime": "25 Janvier, 10H",
      "rate": 4.8,
      "bookedSeat": 4
    },
    {
      "pickupLocation": "Agoe Fiovi",
      "destinationLocation": "Hotel 2 Fevrier ",
      "price": "2500", 
      "image": "assets/findRide/rider-1.png",
      "name": "Rebecca TABOUKOUNA",
      "dateTime": "25 Janvier, 10H",
      "rate": 4.8,
      "bookedSeat": 1
    },
    {
      "pickupLocation": "Agoe Fiovi",
      "destinationLocation": "Hotel 2 Fevrier ",
      "price": "2500", 
      "image": "assets/findRide/rider-1.png",
      "name": "Rebecca TABOUKOUNA",
      "dateTime": "25 Janvier, 10H",
      "rate": 4.8,
      "bookedSeat": 3
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
          "Voitures disponibles le 26 Janvier à 15h",
          style: semibold18White,
        ),
      ),
      body: rideListContent(size),
    );
  }

  rideListContent(Size size) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: fixPadding),
      itemCount: rideList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/rideDetail', arguments: {"id": 0});
          },
          child: Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0, vertical: fixPadding),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(fixPadding),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            address(greenColor,
                                rideList[index]['pickupLocation'].toString()),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: fixPadding * 0.75),
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
                                rideList[index]['destinationLocation']
                                    .toString()),
                          ],
                        ),
                      ),
                      widthSpace,
                      Text(
                        "${rideList[index]['price']} F",
                        style: semibold18Primary,
                      )
                    ],
                  ),
                ),
                DottedBorder(
                  padding: EdgeInsets.zero,
                  dashPattern: const [2, 4],
                  color: greyColor,
                  child: const SizedBox(
                    width: double.maxFinite,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(fixPadding),
                  child: Row(
                    children: [
                      Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                              image: AssetImage(
                                rideList[index]['image'].toString(),
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      widthSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rideList[index]['name'].toString(),
                              style: semibold15Black33,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: size.width * 0.28,
                                  ),
                                  child: Text(
                                    rideList[index]['dateTime'].toString(),
                                    style: semibold13Grey,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  " | ${rideList[index]['rate']}",
                                  style: semibold13Grey,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: secondaryColor,
                                  size: 15.0,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      seats(index)
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

  seats(int index) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 95.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            4,
            (i) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: fixPadding * 0.25),
              child: Icon(
                Icons.event_seat,
                color: (i < (rideList[index]['bookedSeat'] as int))
                    ? primaryColor
                    : greyColor,
                size: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  address(Color color, String address) {
    return Row(
      children: [
        Container(
          height: 16.0,
          width: 16.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.location_pin,
            color: color,
            size: 12.0,
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
}
