import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gis_task/features/bulkblock/presentation/pages/home_page.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/color_palettes.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/responsive_size.dart';

class SplashScreenWidget extends StatefulWidget {
  final MaterialPageRoute nextRoute;
  const SplashScreenWidget({Key? key, required this.nextRoute})
      : super(key: key);

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(context, widget.nextRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(gradient: splashScreenGradient),
            child: SizedBox(
              height: SizeConfig.screenHeight / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SpinKitFadingCube(
                    color: highlight,
                    size: 50.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
