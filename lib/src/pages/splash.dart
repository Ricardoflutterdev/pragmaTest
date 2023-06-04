import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:test_pragma/src/environment/environment.dart';
import 'package:test_pragma/src/widgets/widgets.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamed("landing");
    });
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blancoColor,
      body: SizedBox(
        width: media.width,
        height: media.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FadeInLeft(
              delay: const Duration(milliseconds: 200),
              child: TextWidget(
                  text: "Catbreeds",
                  font: "Poppins",
                  size: 40,
                  color: negroColor,
                  textalign: TextAlign.center,
                  textDecoration: TextDecoration.none),
            ),
            const SpaceVer(heightSpace: 20),
            FadeInLeft(
              delay: const Duration(milliseconds: 400),
              child: const Logo(
                  logo: "assets/images/logo.jpg", widthLogo: 100, heightLogo: 50),
            )
          ],
        ),
      ),
    );
  }
}
