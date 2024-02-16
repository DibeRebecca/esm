import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';

class EndRideScreen extends StatefulWidget {
  const EndRideScreen({super.key});

  @override
  State<EndRideScreen> createState() => _EndRideScreenState();
}

class _EndRideScreenState extends State<EndRideScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => onWillpop(),
      child: Scaffold(
        body: Column(
          children: [
            rideEndContent(size),
            backToHomeButton(context),
          ],
        ),
      ),
    );
  }

  rideEndContent(Size size) {
    return Expanded(
      child: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(fixPadding * 2.0),
          shrinkWrap: true,
          children: [
            Image.asset(
              "assets/endRide/end-ride.png",
              height: size.height * 0.2,
            ),
            heightSpace,
            heightSpace,
            const Text(
              "Ride Ended",
              style: semibold18Black33,
              textAlign: TextAlign.center,
            ),
            heightSpace,
            const Text(
              "Hope  you have a great car pooing experience You have earn \$50.00 from this ride",
              style: semibold14Grey,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  backToHomeButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/bottomBar');
      },
      child: const Text(
        "Back to home",
        style: semibold16Primary,
      ),
    );
  }

  onWillpop() {
    Navigator.pushNamed(context, '/bottomBar');
  }
}
