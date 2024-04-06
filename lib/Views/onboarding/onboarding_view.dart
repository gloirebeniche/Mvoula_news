import 'package:flutter/material.dart';
import 'package:mvoula/services/onboarding_items.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Widgets/Widgets.dart';


class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Container(
        color: Colors.white,
        padding: const  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: isLastPage ? getStarted(context, mounted) :   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: ()=> pageController.jumpToPage(controller.items.length-1),
                child: const Text('Passé', style: TextStyle(fontSize: 20, color: Colors.black),)),
            SmoothPageIndicator(
                controller: pageController,
                count: controller.items.length,
                onDotClicked: (index) => pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300), curve: Curves.easeIn),
                effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.black
                ),
            ),
            TextButton(onPressed: () => pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn),
                child: const Text('Suivant',style: TextStyle(fontSize: 20, color: Colors.black),))
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          onPageChanged: (index) => setState(() => isLastPage = controller.items.length-1 == index),
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context, index){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(controller.items[index].images),
                  const SizedBox(height: 15,),
                  Text(controller.items[index].titre, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 15,),
                  Text(controller.items[index].description, style : const TextStyle(fontSize: 20, color: Colors.grey), textAlign: TextAlign.center,)
                ],
              );
            }
        ),
      )
    );
  }





}
