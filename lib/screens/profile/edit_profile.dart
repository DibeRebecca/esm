import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  @override
  void initState() {
    userNameController.text = "Rebecca TABOUKOUNA";
    emailController.text = "rebe.taboukouna@mail.com";
    mobileNumberController.text = "+22897864437";
    super.initState();
  }

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
          "Modifier le profil",
          style: semibold18White,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2.0),
        children: [
          profileImage(size),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          height5Space,
          userNameField(),
          heightSpace,
          heightSpace,
          heightSpace,
          emailField(),
          heightSpace,
          heightSpace,
          heightSpace,
          mobileNumberField()
        ],
      ),
      bottomNavigationBar: updateButton(context),
    );
  }

  updateButton(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.all(fixPadding * 2.0),
          padding: const EdgeInsets.symmetric(
              vertical: fixPadding * 1.4, horizontal: fixPadding * 2.0),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: secondaryColor.withOpacity(0.1),
                blurRadius: 12.0,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Text(
            "Mettre à jour",
            style: bold18White,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  mobileNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Numero de Telephone",
          style: semibold15Black33,
        ),
        TextField(
          style: medium15Black33,
          keyboardType: TextInputType.phone,
          cursorColor: primaryColor,
          controller: mobileNumberController,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greyD4Color),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            hintText: "Entrer le numero",
            hintStyle: medium15Grey,
            contentPadding: EdgeInsets.symmetric(vertical: fixPadding),
            isDense: true,
          ),
        )
      ],
    );
  }

  emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email",
          style: semibold15Black33,
        ),
        TextField(
          style: medium15Black33,
          keyboardType: TextInputType.emailAddress,
          cursorColor: primaryColor,
          controller: emailController,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greyD4Color),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            hintText: "Entrer votre mail",
            hintStyle: medium15Grey,
            contentPadding: EdgeInsets.symmetric(vertical: fixPadding),
            isDense: true,
          ),
        )
      ],
    );
  }

  userNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Nom d'utilisateur",
          style: semibold15Black33,
        ),
        TextField(
          style: medium15Black33,
          controller: userNameController,
          keyboardType: TextInputType.name,
          cursorColor: primaryColor,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greyD4Color),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            hintText: "Entrer votre nom d'utilisateur",
            hintStyle: medium15Grey,
            contentPadding: EdgeInsets.symmetric(vertical: fixPadding),
            isDense: true,
          ),
        )
      ],
    );
  }

  profileImage(Size size) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: size.height * 0.14,
            width: size.height * 0.14,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  "assets/profile/user-image.png",
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                changeProfileBottonsheet();
              },
              child: Container(
                height: size.height * 0.048,
                width: size.height * 0.048,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF5F5F5),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  CupertinoIcons.camera,
                  size: 20.0,
                  color: secondaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  changeProfileBottonsheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return ListView(
          padding: const EdgeInsets.all(fixPadding * 2.0),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            const Text(
              "Changer l'image de profile",
              style: semibold18Black33,
            ),
            heightSpace,
            heightSpace,
            imageChangeOption(Icons.camera_alt, darkBlueColor, "Camera"),
            heightSpace,
            heightSpace,
            imageChangeOption(Icons.photo, darkGreenColor, "Gallery"),
            heightSpace,
            heightSpace,
            imageChangeOption(
                CupertinoIcons.trash_fill, darkRedColor, "Supprimer l'image"),
          ],
        );
      },
    );
  }

  imageChangeOption(IconData icon, Color color, String title) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.25),
                  blurRadius: 6.0,
                )
              ],
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              size: 23.0,
              color: color,
            ),
          ),
          widthSpace,
          width5Space,
          Expanded(
            child: Text(
              title,
              style: medium16Black33,
            ),
          ),
        ],
      ),
    );
  }
}
