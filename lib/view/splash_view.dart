import 'package:flutter/material.dart';

import '../view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://play-lh.googleusercontent.com/qNHWVaUmi0tvGyHZ-gzrnKVAh2JU29YaWkQUY_MTHgJj0dKceIa66-Tzux6Wgj04lKYR', // Replace with your image path
              width: 150,
              height: 150,
              // You can customize other properties like width, height, etc.
            ),
          ],
        ),
      ),
    );
  }
}
