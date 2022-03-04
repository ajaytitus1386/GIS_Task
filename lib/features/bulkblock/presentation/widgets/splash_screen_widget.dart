import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gis_task/features/bulkblock/presentation/animation/splash_page_route.dart';
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

class _SplashScreenWidgetState extends State<SplashScreenWidget>
    with SingleTickerProviderStateMixin {
  final lifetime = 5;
  final loaderStartTime = 4700; //milliseconds  // Less than lifetime
  final scaleDuration = 300; //milliseconds
  final rotateDuration = 1000; //milliseconds
  var loaderScale = 1.0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: rotateDuration));

    Timer(Duration(milliseconds: loaderStartTime), () {
      _controller.forward();
      setState(() {
        loaderScale = 0;
      });
    });

    Timer(Duration(seconds: lifetime), () {
      Navigator.of(context)
          .pushReplacement(splashPageBuilder(const HomePage(), context));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                  AnimatedScale(
                    scale: loaderScale,
                    duration: Duration(milliseconds: scaleDuration),
                    child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                      child: SpinKitFadingCube(
                        color: highlight,
                        size: 50.0,
                      ),
                    ),
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
