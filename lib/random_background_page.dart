import 'dart:math';
import 'package:flutter/material.dart';

class RandomBackgroundPage extends StatefulWidget {
  const RandomBackgroundPage({super.key});

  @override
  State<RandomBackgroundPage> createState() => _RandomBackgroundPageState();
}

class _RandomBackgroundPageState extends State<RandomBackgroundPage> {
  Color backgroundColor = Colors.blue;
  String? currentImage;

  final List<String> imageList = [
    'assets/images/img_1.jpg',
    'assets/images/img_2.jpg',
    'assets/images/img_3.jpg',
    'assets/images/img_4.jpg',
    'assets/images/img_5.jpg',
    'assets/images/img_6.jpg',
    'assets/images/img_7.jpg',
    'assets/images/img_8.jpg',
    'assets/images/img_9.jpg',
    'assets/images/img_10.jpg',
  ];

  int randomInt(int max) => Random().nextInt(max);

  bool showImage = false;

  int maxColorValue = 256;
  int opacityValue = 255;

  void setRandomColor() {
    backgroundColor = Color.fromARGB(
      opacityValue,
      randomInt(maxColorValue),
      randomInt(maxColorValue),
      randomInt(maxColorValue),
    );
  }

  void setRandomImage() {
    currentImage = imageList[randomInt(imageList.length)];
  }

  void changeBackground() {
    setState(() {
      showImage = Random().nextBool();
      showImage ? setRandomImage() : setRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: changeBackground,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: showImage ? null : backgroundColor,
            image: showImage
                ? DecorationImage(
                    // ignore: avoid_non_null_assertion
                    image: AssetImage(currentImage!),
                    fit: BoxFit.fitHeight,
                  )
                : null,
          ),
          child: const Center(
            child: Text(
              'Hello there',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
