import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';

class MyVehicleScreen extends StatefulWidget {
  const MyVehicleScreen({super.key});

  @override
  State<MyVehicleScreen> createState() => _MyVehicleScreenState();
}

class _MyVehicleScreenState extends State<MyVehicleScreen> {
  final vehicleList = [
    {
      "image": "assets/myVehicle/image-1.png",
      "name": "Mercedes-Benz AMG A35",
      "seat": "2",
    },
    {
      "image": "assets/myVehicle/image-2.png",
      "name": "Toyota Matrix | KJ 5454 | Black colour",
      "seat": "4",
    }
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
          "Mon vehicule",
          style: semibold18White,
        ),
      ),
      body: vehicleListContent(size),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: addButton(),
    );
  }

  addButton() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/addNewVehicle');
      },
      child: Container(
        height: 45.0,
        width: 45.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: secondaryColor,
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.add,
          size: 40.0,
          color: whiteColor,
        ),
      ),
    );
  }

  vehicleListContent(Size size) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.0, vertical: fixPadding),
      itemCount: vehicleList.length,
      itemBuilder: (context, index) {
        return Container(
          height: size.height * 0.22,
          clipBehavior: Clip.hardEdge,
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(vertical: fixPadding),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(
                vehicleList[index]['image'].toString(),
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  whiteColor.withOpacity(0.0),
                  const Color(0xFF1C1C1C).withOpacity(0.5)
                ],
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(fixPadding * 0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            vehicleList.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 1500),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: blackColor,
                              content: Text(
                                "Supprimer de mes vehicules",
                                style: semibold15White,
                              ),
                            ),
                          );
                        },
                        child: const Icon(
                          CupertinoIcons.trash,
                          color: redColor,
                          size: 23.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(fixPadding * 1.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vehicleList[index]['name'].toString(),
                        style: semibold15White,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      height5Space,
                      Text(
                        "${vehicleList[index]['seat']} personnes",
                        style: medium15White,
                        overflow: TextOverflow.ellipsis,
                      )
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
}
