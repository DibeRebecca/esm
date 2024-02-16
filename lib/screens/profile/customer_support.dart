import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({super.key});

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
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
          "Customer support",
          style: semibold18White,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(fixPadding * 2.0),
        physics: const BouncingScrollPhysics(),
        children: [
          heightSpace,
          Image.asset(
            "assets/customerSupport/customer-service.png",
            height: size.height * 0.11,
          ),
          heightSpace,
          heightSpace,
          const Text(
            "Get in touch",
            style: semibold18Black33,
            textAlign: TextAlign.center,
          ),
          heightSpace,
          heightSpace,
          height5Space,
          contactDetail(size),
          heightSpace,
          heightSpace,
          height5Space,
          nameField(),
          heightSpace,
          heightSpace,
          emailField(),
          heightSpace,
          heightSpace,
          messageField(size)
        ],
      ),
      bottomNavigationBar: submitButton(context),
    );
  }

  contactDetail(Size size) {
    return Row(
      children: [
        contactWidget(size, CupertinoIcons.phone, "Call us"),
        widthSpace,
        widthSpace,
        contactWidget(size, CupertinoIcons.mail, "Mail us"),
      ],
    );
  }

  submitButton(BuildContext context) {
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
            "Submit",
            style: bold18White,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  messageField(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Message",
          style: semibold15Black33,
        ),
        heightSpace,
        Container(
          height: size.height * 0.16,
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
          child: const TextField(
            expands: true,
            maxLines: null,
            minLines: null,
            style: semibold15Black33,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  vertical: fixPadding * 1.4, horizontal: fixPadding),
              hintText: "Write your message",
              hintStyle: medium15Grey,
            ),
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
          "Email address",
          style: semibold15Black33,
        ),
        heightSpace,
        Container(
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
          child: const TextField(
            style: semibold15Black33,
            cursorColor: primaryColor,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  vertical: fixPadding * 1.4, horizontal: fixPadding),
              hintText: "Enter your email address",
              hintStyle: medium15Grey,
            ),
          ),
        )
      ],
    );
  }

  nameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Name",
          style: semibold15Black33,
        ),
        heightSpace,
        Container(
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
          child: const TextField(
            style: semibold15Black33,
            cursorColor: primaryColor,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  vertical: fixPadding * 1.4, horizontal: fixPadding),
              hintText: "Enter your name",
              hintStyle: medium15Grey,
            ),
          ),
        )
      ],
    );
  }

  contactWidget(Size size, IconData icon, String title) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: fixPadding * 1.5, horizontal: fixPadding),
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
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20.0,
              color: primaryColor,
            ),
            widthSpace,
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.25,
              ),
              child: Text(
                title,
                style: semibold16Primary,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
