import 'package:esm/controllers/vehicule_controller.dart';
import 'package:esm/core/data/models/vehicle_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';

import '../../components/vehicules/vehicule_tile.dart';

final _controller = VehiculeController();

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
            // Navigator.pop(context);
            _controller.getVehicules();
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
    return FutureBuilder<List<Vehicule>?>(
        future: _controller.getVehicules(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data!=null){
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding * 2.0, vertical: fixPadding),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return VehiculeTile(vehicule: snapshot.data![index],);
                },
              );
            }
          }
          if(snapshot.connectionState== ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          return const Text("data");
        },
    );
  }
}

