import 'package:dotted_border/dotted_border.dart';
import 'package:esm/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:intl/intl.dart';
import 'package:esm/theme/theme.dart';
import 'package:esm/widget/column_builder.dart';

final controller = Get.put(AuthController());
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? mapController;

  TextEditingController dateAndTimeController = TextEditingController();
  TextEditingController noOfSeatController = TextEditingController();

  static const CameraPosition _currentPosition =
      CameraPosition(target: LatLng(51.507351, -0.127758), zoom: 12);

  final tabList = ["Trouver un trajet", "Proposer un trajet"];

  final seatList = ["1", "2", "3", "4", "5", "6", "7", "8"];
  int? selectedSeat;

  int selectedTab = 0;

  String? sourceLocation;
  String? destinationLocation;

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
   // controller.loadUser();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: f8Color,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70.0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: primaryColor,
        titleSpacing: 20.0,
        title: headerTitle(),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            onPressed: () {
              Navigator.pushNamed(context, '/notification');
            },
            icon: const Iconify(
              Carbon.notification,
              color: whiteColor,
              size: 22.0,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          googleMap(size),
          bottombox(context, size),
        ],
      ),
    );
  }

  bottombox(BuildContext context, Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.maxFinite,
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(
            bottom: fixPadding * 3.0,
            left: fixPadding * 2.0,
            right: fixPadding * 2.0),
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
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            tabBar(),
            pickupLocation(context),
            heightSpace,
            heightSpace,
            destinationLocationAddress(context),
            Padding(
              padding: const EdgeInsets.all(fixPadding * 2.0),
              child: Row(
                children: [
                  dateAndTimeField(size),
                  selectedTab == 0
                      ? widthBox(fixPadding * 1.5)
                      : const SizedBox(),
                  selectedTab == 0 ? noOfSeatField(size) : const SizedBox(),
                ],
              ),
            ),
            selectedTab == 0 ? findRideButton() : continueButton()
          ],
        ),
      ),
    );
  }

  continueButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/offerRide');
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(fixPadding * 1.4),
        decoration: const BoxDecoration(color: secondaryColor),
        alignment: Alignment.center,
        child: const Text(
          "Continuer",
          style: bold18White,
        ),
      ),
    );
  }

  findRideButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/findRide');
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(fixPadding * 1.4),
        decoration: const BoxDecoration(color: secondaryColor),
        alignment: Alignment.center,
        child: const Text(
          "Trouver un trajet",
          style: bold18White,
        ),
      ),
    );
  }

  noOfSeatField(Size size) {
    return Expanded(
      child: Container(
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
        child: TextField(
          readOnly: true,
          style: semibold15Black33,
          onTap: () {
            noOfSeatBottomsheet(size);
          },
          controller: noOfSeatController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIconConstraints: BoxConstraints(minWidth: 38.0),
            prefixIcon: Icon(
              CupertinoIcons.person,
              size: 18.0,
              color: greyColor,
            ),
            hintText: "Nb. sièges",
            hintStyle: semibold15Grey,
          ),
        ),
      ),
    );
  }

  noOfSeatBottomsheet(Size size) {
    return showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints(maxHeight: size.height - 80),
        backgroundColor: whiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
        ),
        context: context,
        builder: (contetx) {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              heightSpace,
              heightSpace,
              const Text(
                "Nombre de siege",
                style: semibold18Primary,
                textAlign: TextAlign.center,
              ),
              ColumnBuilder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            setState(() {
                              selectedSeat = index;
                              noOfSeatController.text =
                                  "${seatList[selectedSeat!]} siege";
                            });
                            Navigator.pop(context);
                          },
                          title: Text(
                            "${seatList[index]} siege",
                            style: selectedSeat == index
                                ? semibold16Secondary
                                : semibold16Black33,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        seatList.length == index + 1
                            ? const SizedBox()
                            : Container(
                                width: double.maxFinite,
                                height: 1,
                                color: greyD4Color,
                              )
                      ],
                    );
                  },
                  itemCount: seatList.length)
            ],
          );
        });
  }

  dateAndTimeField(Size size) {
    return Expanded(
      child: Container(
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
        child: TextField(
          readOnly: true,
          style: semibold15Black33,
          onTap: () {
            dateAndTimeBottomsheet(size);
          },
          controller: dateAndTimeController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIconConstraints: BoxConstraints(minWidth: 38.0),
            prefixIcon: Icon(
              Icons.calendar_month_outlined,
              size: 18.0,
              color: greyColor,
            ),
            hintText: "Date et heure",
            hintStyle: semibold15Grey,
          ),
        ),
      ),
    );
  }

  dateAndTimeBottomsheet(Size size) {
    return showModalBottomSheet(
      isScrollControlled: true,
      constraints: BoxConstraints(maxHeight: size.height - 80),
      backgroundColor: whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
      ),
      context: context,
      builder: (context) {
        DateTime dateValue = date;
        var hour = DateFormat('h').format(DateTime.now());
        var minute = DateFormat('m').format(DateTime.now());
        var marker = DateFormat('a').format(DateTime.now());
        String selectedHour = hour;
        String selectedMinute = minute;
        String selectedMarker = marker;
        PageController hourController =
            PageController(initialPage: int.parse(hour));
        PageController minuteController =
            PageController(initialPage: int.parse(minute));
        PageController markerController =
            PageController(initialPage: marker == "H" ? 0 : 1);
        final markerList = ["H", "H"];
        return StatefulBuilder(
          builder: (context, state) {
            return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                const Padding(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Text(
                    "Choisir la date",
                    style: semibold16Primary,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 280,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme:
                          const ColorScheme.light(primary: secondaryColor),
                      datePickerTheme: DatePickerThemeData(
                        dayStyle: semibold15White.copyWith(
                            color: const Color(0xFF4A5660)),
                      ),
                    ),
                    child: CalendarDatePicker(
                      initialDate: date,
                      firstDate: DateTime.now(),
                      currentDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 36500)),
                      onDateChanged: (datetime) {
                        state(() {
                          setState(() {
                            dateValue = datetime;
                          });
                        });
                      },
                    ),
                  ),
                ),
                heightSpace,
                dottedDivder(),
                Padding(
                  padding: const EdgeInsets.all(fixPadding * 2.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                upButton(() {
                                  state(() {
                                    selectedHour == "00"
                                        ? hourController.jumpToPage(0)
                                        : hourController.previousPage(
                                            duration: const Duration(
                                                microseconds: 10),
                                            curve: Curves.ease);
                                  });
                                }),
                                Container(
                                  height: 50,
                                  decoration: timerBoxDecoration,
                                  alignment: Alignment.center,
                                  child: PageView.builder(
                                    itemCount: 13,
                                    scrollDirection: Axis.vertical,
                                    onPageChanged: (index) {
                                      state(() {
                                        index < 10
                                            ? setState(() {
                                                selectedHour = "0$index";
                                              })
                                            : setState(() {
                                                selectedHour = index.toString();
                                              });
                                      });
                                    },
                                    controller: hourController,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        height: 43,
                                        child: Center(
                                          child: Text(
                                            index < 10
                                                ? "0$index"
                                                : index.toString(),
                                            style: semibold18Primary,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                downButton(() {
                                  state(() {
                                    selectedHour == "12"
                                        ? hourController.jumpToPage(0)
                                        : hourController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 10),
                                            curve: Curves.ease);
                                  });
                                }),
                              ],
                            ),
                          ),
                          widthSpace,
                          const Text(
                            ":",
                            style: semibold28Black33,
                          ),
                          widthSpace,
                          Expanded(
                            child: Column(
                              children: [
                                upButton(() {
                                  state(() {
                                    selectedMinute == "00"
                                        ? minuteController.jumpToPage(59)
                                        : minuteController.previousPage(
                                            duration: const Duration(
                                                microseconds: 10),
                                            curve: Curves.ease);
                                  });
                                }),
                                Container(
                                  height: 50.0,
                                  decoration: timerBoxDecoration,
                                  alignment: Alignment.center,
                                  child: PageView.builder(
                                    itemCount: 60,
                                    scrollDirection: Axis.vertical,
                                    onPageChanged: (index) {
                                      state(() {
                                        index < 10
                                            ? setState(() {
                                                selectedMinute = "0$index";
                                              })
                                            : setState(() {
                                                selectedMinute =
                                                    index.toString();
                                              });
                                      });
                                    },
                                    controller: minuteController,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        height: 43,
                                        child: Center(
                                          child: Text(
                                            index < 10
                                                ? "0$index"
                                                : index.toString(),
                                            style: semibold18Primary,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                downButton(() {
                                  state(() {
                                    selectedMinute == "59"
                                        ? minuteController.jumpToPage(0)
                                        : minuteController.nextPage(
                                            duration: const Duration(
                                                microseconds: 10),
                                            curve: Curves.ease);
                                  });
                                }),
                              ],
                            ),
                          ),
                          widthSpace,
                          widthSpace,
                          Expanded(
                            child: Column(
                              children: [
                                selectedMarker == "H"
                                    ? iconPlaceHolder()
                                    : upButton(() {
                                        state(() {
                                          markerController.previousPage(
                                              duration: const Duration(
                                                  microseconds: 10),
                                              curve: Curves.ease);
                                        });
                                      }),
                                Container(
                                  height: 50.0,
                                  decoration: timerBoxDecoration,
                                  alignment: Alignment.center,
                                  child: PageView.builder(
                                    itemCount: markerList.length,
                                    scrollDirection: Axis.vertical,
                                    onPageChanged: (index) {
                                      state(() {
                                        setState(() {
                                          selectedMarker = markerList[index];
                                        });
                                      });
                                    },
                                    controller: markerController,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        height: 43,
                                        child: Center(
                                          child: Text(
                                            markerList[index].toString(),
                                            style: semibold18Primary,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                selectedMarker == "H"
                                    ? iconPlaceHolder()
                                    : downButton(() {
                                        state(() {
                                          markerController.nextPage(
                                              duration: const Duration(
                                                  microseconds: 10),
                                              curve: Curves.ease);
                                        });
                                      }),
                              ],
                            ),
                          ),
                        ],
                      ),
                      heightSpace,
                      heightSpace,
                      okayButton(context, dateValue, selectedHour,
                          selectedMinute, selectedMarker),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  iconPlaceHolder() {
    return const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.keyboard_arrow_up_outlined,
          color: Colors.transparent,
        ));
  }

  okayButton(BuildContext context, DateTime dateValue, String selectedHour,
      String selectedMinute, String selectedMarker) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          dateAndTimeController.text =
              "${DateFormat('dd MMMM').format(dateValue)},$selectedHour:$selectedMinute$selectedMarker";

          date = dateValue;
        });
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0, vertical: fixPadding * 1.4),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10.0),
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
          "D'accord",
          style: bold18White,
        ),
      ),
    );
  }

  dottedDivder() {
    return DottedBorder(
      padding: EdgeInsets.zero,
      color: greyColor,
      dashPattern: const [2, 5],
      child: const SizedBox(
        width: double.maxFinite,
      ),
    );
  }

  downButton(Function() onTap) {
    return IconButton(
      onPressed: onTap,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: greyColor,
      ),
    );
  }

  upButton(Function() onTap) {
    return IconButton(
      onPressed: onTap,
      icon: const Icon(
        Icons.keyboard_arrow_up,
        color: greyColor,
      ),
    );
  }

  destinationLocationAddress(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.pushNamed(context, '/pickLocation');
        if (result != null) {
          setState(() {
            destinationLocation = result.toString();
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(fixPadding * 1.4),
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.15),
                blurRadius: 6.0,
              )
            ]),
        child: Row(
          children: [
            locationIcon(redColor),
            widthSpace,
            width5Space,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Destination",
                    style: semibold15Black33,
                    overflow: TextOverflow.ellipsis,
                  ),
                  height5Space,
                  Text(
                    destinationLocation != null
                        ? destinationLocation.toString()
                        : "Selectionnez l'adresse",
                    style: medium14Grey,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  pickupLocation(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.pushNamed(context, '/pickLocation');
        if (result != null) {
          setState(() {
            sourceLocation = result.toString();
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(fixPadding * 1.4),
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.15),
                blurRadius: 6.0,
              )
            ]),
        child: Row(
          children: [
            locationIcon(greenColor),
            widthSpace,
            width5Space,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Départ",
                    style: semibold15Black33,
                    overflow: TextOverflow.ellipsis,
                  ),
                  height5Space,
                  Text(
                    sourceLocation != null
                        ? sourceLocation.toString()
                        : "Selectionnez l'adresse",
                    style: medium14Grey,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  locationIcon(Color color) {
    return Container(
      height: 24.0,
      width: 24.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color),
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.location_pin,
        color: color,
        size: 18.0,
      ),
    );
  }

  tabBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
          fixPadding * 2.0, fixPadding, fixPadding * 2.0, fixPadding * 2.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: f8Color,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.15),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: List.generate(
          tabList.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: fixPadding * 1.3, horizontal: fixPadding),
                color: selectedTab == index ? primaryColor : f8Color,
                alignment: Alignment.center,
                child: Text(
                  tabList[index].toString(),
                  style:
                      selectedTab == index ? semibold15White : semibold15Grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  googleMap(Size size) {
    return SizedBox(
      height: double.maxFinite,
      width: size.width,
      child: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: _currentPosition,
        onMapCreated: mapCreated,
        zoomControlsEnabled: false,
      ),
    );
  }

  mapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  headerTitle() {
    return Row(
      children: [
        GestureDetector(
  onTap: () {
    Navigator.pushNamed(context, '/profile');
  }, // Image tapped
  child:Container(
          height: 45.0,
          width: 45.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                "assets/home/rbk2.jpeg",
              ),
            ),
          ),
        ),),
        widthSpace,
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*const Text(
                "Bienvenue Rebecca",
                style: semibold16White,
                overflow: TextOverflow.ellipsis,
              ),
              heightBox(2.0),
              const Row(
                children: [
                  Iconify(
                    Carbon.location,
                    color: whiteColor,
                    size: 14.0,
                  ),
                  width5Space,
                  Expanded(
                    child: Text(
                      "Lome",
                      style: medium14White,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              )*/
            ],
          ),
        )
      ],
    );
  }

  var timerBoxDecoration = BoxDecoration(
    color: whiteColor,
    borderRadius: BorderRadius.circular(5.0),
    boxShadow: [
      BoxShadow(
        color: blackColor.withOpacity(0.2),
        blurRadius: 6.0,
      )
    ],
  );
}
