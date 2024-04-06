import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Components/color.dart';
import '../../generated/assets.dart';
import '../home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin:const  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
         child: Column(
           children: [
             Material(
               elevation: 3.0,
               borderRadius: BorderRadius.circular(20.0),
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(20.0),
                 child: Image.asset(Assets.assetsNews,
                   height: MediaQuery.of(context).size.height / 1.7,
                   width: MediaQuery.of(context).size.width,
                   fit: BoxFit.cover,
                 ),
               ),
             ),
             const SizedBox(height: 20.0,),
             const Text("Explorez les mystères de l'univers ",
               style: TextStyle(color: AppColors.primaryColor, fontWeight:   FontWeight.bold, fontSize: 26),
             ),
             const SizedBox(height: 20.0,),
             const Text("Découvrez les clés du succès et explorez les stratégies innovantes qui façonnent le monde des affaires d'aujourd'hui.",
               style: TextStyle(color: AppColors.textColor, fontWeight:   FontWeight.w500, fontSize: 18),
             ),
             const SizedBox(height: 50.0,),
             GestureDetector(
               onTap: () => Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) =>   HomePage())),
               child: Container(
                 width: MediaQuery.of(context).size.width /1.2,
                 child: Material(
                   elevation: 8.0,
                     borderRadius: BorderRadius.circular(20),
                   child: Container(
               
                     padding: const EdgeInsets.symmetric(vertical: 15.0),
                     decoration: BoxDecoration(
                       color: AppColors.primaryColor,
                       borderRadius: BorderRadius.circular(20)
                     ),
                   child:const Center(
                     child:  Text("commencer",
                       style: TextStyle(color: AppColors.secondaryColor, fontWeight:   FontWeight.w500, fontSize: 20),
                     ),
                   ),
                   ),
                 ),
               ),
             ),
           ],
         ),
      ),
    );
  }
}
