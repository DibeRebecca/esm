import 'package:esm/controllers/vehicule_controller.dart';
import 'package:esm/core/data/models/vehicle_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';

final controller = Get.put(VehiculeController());

class VehiculeTile extends StatelessWidget {
  const VehiculeTile({Key? key, required this.vehicule}) : super(key: key);
  final Vehicule vehicule;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.22,
      clipBehavior: Clip.hardEdge,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          image: AssetImage(
            "assets/myVehicle/image-1.png",
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
                      controller.deleteVehicle(id: vehicule.id.toString());
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
                    vehicule.modele!.nom.toString(),
                    style: semibold15White,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  height5Space,
                  Text(
                    "${vehicule.nbSieges} personnes",
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
  }
}
