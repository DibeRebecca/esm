import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esm/theme/theme.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final id = data['id'];

    return WillPopScope(
      onWillPop: () async => onWillpop(),
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
          body: Column(
            children: [
              successContent(size, id),
              backToHomeButton(context),
            ],
          ),
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
        "Retour à l'accueil",
        style: semibold16Primary,
      ),
    );
  }

  successContent(Size size, id) {
    return Expanded(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(fixPadding * 2.0),
          children: [
            Center(
              child: Image.asset(
                "assets/success/driving-pana.png",
                height: size.height * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            heightSpace,
            heightSpace,
            const Text(
              "Felicitations",
              style: semibold18Black33,
              textAlign: TextAlign.center,
            ),
            heightSpace,
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width * 0.56),
                child: Text(
                  id == 1
                      ? "Votre course a ete crée avec succes"
                      : "Votre Co-voiturage a éte accepté",
                  style: semibold14Grey,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onWillpop() {
    Navigator.pushNamed(context, '/bottomBar');
  }
}
