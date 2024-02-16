import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:esm/theme/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: f8Color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 20.0,
        title: const Text(
          "Profil",
          style: semibold18White,
        ),
      ),
      body: Column(
        children: [
          userDetail(),
          profileOptions(context),
        ],
      ),
    );
  }

  profileOptions(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        color: whiteColor,
        child: ListView(
          padding: const EdgeInsets.all(fixPadding * 2.0),
          physics: const BouncingScrollPhysics(),
          children: [
            imageProfileOption("assets/profile/car-line.png", "Mon vehicule",
                "Ajouter les informations du Vehicule", () {
              Navigator.pushNamed(context, '/myVehicle');
            }),
            divider(),
            iconProfileOption(
                Icons.history, "Historique des trajets", "Voir votre historique", () {
              Navigator.pushNamed(context, '/rideHistory');
            }),
            divider(),
            iconProfileOption(Icons.wallet, "Portefeuille",
                "portefeuille", () {
              Navigator.pushNamed(context, '/wallet');
            }),

            /*iconProfileOption(CupertinoIcons.square_list, "Termes et conditions",
                "Les terms et conditions", () {
              Navigator.pushNamed(context, '/termsAndCondition');
            }),*/
           
            /* iconProfileOption(CupertinoIcons.exclamationmark_shield,
                "Politique de confidentialité", "En savoir plus", () {
              Navigator.pushNamed(context, '/privacyPolicy');
            }),*/
            
            /* iconProfileOption(CupertinoIcons.question_circle, "FAQs",
                "En savoir plus", () {
              Navigator.pushNamed(context, '/faqs');
            }),*/
            
            /*imageProfileOption("assets/profile/headset.png", "Service Client",
                "Contactez-nous pour tout support", () {
              Navigator.pushNamed(context, '/customerSupport');
            }),*/
            divider(),
            imageProfileOption(
                "assets/profile/logout.png", "Se Deconnecter", "Deconnexion",
                () {
              logoutDialog();
            }, color: redColor),
          ],
        ),
      ),
    );
  }

  logoutDialog() {
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
                  "Etes vous sur de vouloir vous deconnecter?",
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
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding, vertical: fixPadding * 1.2),
                        color: secondaryColor,
                        alignment: Alignment.center,
                        child: const Text(
                          "Se deconnecter",
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

  iconProfileOption(
      IconData icon, String title, String subTitle, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 18.0,
            color: black33Color,
          ),
          widthSpace,
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: semibold16Black33,
                      ),
                      heightBox(2.0),
                      Text(
                        subTitle,
                        style: medium14Grey,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                width5Space,
                const Icon(
                  Icons.arrow_forward_ios,
                  color: black33Color,
                  size: 16.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  imageProfileOption(
      String image, String title, String subTitle, Function() onTap,
      {Color color = black33Color}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 18.0,
            width: 18.0,
            alignment: Alignment.center,
            child: Image.asset(
              image,
              height: 16.0,
              width: 16.0,
              color: color,
            ),
          ),
          widthSpace,
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: semibold16Black33.copyWith(color: color),
                      ),
                      heightBox(2.0),
                      Text(
                        subTitle,
                        style: medium14Grey,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                width5Space,
                const Icon(
                  Icons.arrow_forward_ios,
                  color: black33Color,
                  size: 16.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: fixPadding * 1.8),
      width: double.maxFinite,
      height: 1.0,
      color: greyD4Color,
    );
  }

  userDetail() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        children: [
          Container(
            height: 75.0,
            width: 75.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  "assets/profile/user-image.png",
                ),
              ),
            ),
          ),
          widthSpace,
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rebecca TABOUKOUNA",
                  style: semibold17Black33,
                  overflow: TextOverflow.ellipsis,
                ),
                height5Space,
                Text(
                  "rebe.taboukouna@mail.com",
                  style: semibold16Grey,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/editProfile');
            },
            child: const Iconify(
              MaterialSymbols.edit_square_outline_rounded,
              color: secondaryColor,
              size: 23,
            ),
          )
        ],
      ),
    );
  }
}
