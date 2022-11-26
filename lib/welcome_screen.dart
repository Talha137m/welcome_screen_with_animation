import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'button.dart';
import 'google_sign_widget.dart';

List<Color> colors = const [
  Colors.yellowAccent,
  Colors.red,
  Colors.blueAccent,
  Colors.green,
  Colors.purple,
  Colors.teal
];

TextStyle style = const TextStyle(
    fontSize: 45, fontFamily: 'Acme', fontWeight: FontWeight.bold);

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var minimumValue = min(screenWidth, screenHeight);
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/welcome.webp'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedTextKit(
                pause: const Duration(seconds: 2),
                animatedTexts: [
                  ColorizeAnimatedText('Welcome',
                      textStyle: style, colors: colors),
                  ColorizeAnimatedText('Duck Store',
                      textStyle: style, colors: colors),
                ],
                repeatForever: true,
              ),
              SizedBox(
                width: screenWidth * 0.4,
                height: screenHeight * 0.2,
                child: const Image(image: AssetImage('assets/images/ball.png')),
              ),
              SizedBox(
                width: screenWidth,
                height: screenHeight * 0.07,
                child: DefaultTextStyle(
                  style: TextStyle(
                      fontSize: minimumValue * 0.1,
                      fontWeight: FontWeight.w700,
                      color: Colors.lightBlueAccent,
                      overflow: TextOverflow.ellipsis),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText('Shop'),
                      RotateAnimatedText('Duck Store'),
                      RotateAnimatedText('Buy'),
                    ],
                  ),
                ),
              ),
              // Text(
              //   'SHOP',
              //   style: TextStyle(
              //       fontSize: minimumValue * 0.07, color: Colors.white),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'Suppliers only',
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: minimumValue * 0.06,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(0, screenHeight * 0.02, 0, 0),
                        child: Container(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.07,
                          decoration: const BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnimatedBuilder(
                                animation: _controller.view,
                                builder: ((context, child) {
                                  return Transform.rotate(
                                    angle: _controller.value * 2 * pi,
                                    child: child,
                                  );
                                }),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.07),
                                  child: Image.asset(
                                    'assets/images/ball.png',
                                    height: screenHeight * 0.04,
                                  ),
                                ),
                              ),
                              Button(
                                minimumValue: minimumValue * 0.05,
                                label: 'Login',
                                width: screenWidth * 0.3,
                                height: screenHeight * 0.05,
                                onPressed: () {},
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: screenWidth * 0.04),
                                child: Button(
                                  minimumValue: minimumValue * 0.05,
                                  label: 'Sign up',
                                  width: screenWidth * 0.3,
                                  height: screenHeight * 0.05,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.07,
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.02),
                          child: Button(
                            minimumValue: minimumValue * 0.05,
                            label: 'Login',
                            width: screenWidth * 0.3,
                            height: screenHeight * 0.05,
                            onPressed: () {},
                          ),
                        ),
                        Button(
                          minimumValue: minimumValue * 0.05,
                          label: 'Sign up',
                          width: screenWidth * 0.3,
                          height: screenHeight * 0.05,
                          onPressed: () {},
                        ),
                        AnimatedBuilder(
                          animation: _controller.view,
                          builder: ((context, child) {
                            return Transform.rotate(
                              angle: _controller.value * 2 * pi,
                              child: child,
                            );
                          }),
                          child: Padding(
                            padding: EdgeInsets.only(right: screenWidth * 0.07),
                            child: Image.asset(
                              'assets/images/ball.png',
                              height: screenHeight * 0.04,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white38.withOpacity(0.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GoogleSignIn(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.07,
                          label: 'Google',
                          child: Image.asset('assets/images/google.png'),
                          onPressed: () {}),
                      GoogleSignIn(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.07,
                          label: 'Facebook',
                          child: Image.asset('assets/images/facebook.png'),
                          onPressed: () {}),
                      GoogleSignIn(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.07,
                          label: 'Guest',
                          child: Image.asset('assets/images/person.png'),
                          onPressed: () {}),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
