
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Components/color.dart';
import '../Views/home.dart';
import '../generated/assets.dart';

Widget buildImage(BuildContext context,String urlImage, int index, String name ) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Stack(
      children:[ ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          urlImage,
          height: 250,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Image.asset(
              Assets.assetsNews, // Chemin de votre image de substitution ou image par défaut
              height: 250,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            );
          },
        ),
        // Image.asset(
        //   urlImage,
        //   height: 250,
        //   fit: BoxFit.cover,
        //   width: MediaQuery.of(context).size.width,
        // ),
      ),
        Container(
          height: 250,
          padding:const  EdgeInsets.only(left: 10.0),
          margin: const  EdgeInsets.only(top: 170.0),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            color: Colors.black26,
          ),
          child: Text(
            maxLines: 2,
            name,
            style: const TextStyle(color: AppColors.secondaryColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )
      ],)
);

Widget buildIndicatorSlider(BuildContext context, activeIndex,slider) => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
  // count: 5,
  count: slider,
  effect: const SlideEffect(
  activeDotColor: AppColors.primaryColor
),);


Widget getStarted(BuildContext context, mounted) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.black,
    ),
    width: MediaQuery.of(context).size.width * 0.9,
    height: 55,
    child: TextButton(
      onPressed: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('onboarding', true);

        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const  HomePage()),
        );
      },
      child: const Text(
        'Commencer',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}