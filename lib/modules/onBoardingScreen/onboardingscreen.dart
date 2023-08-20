import 'package:flutter/material.dart';
import 'package:marvix/modules/register/register.dart';
import '../../shared/Components/components.dart';
import '../../models/onBoardingModels/onboardingModel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:marvix/shared/network/local/cacheHelper.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}
class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boardingModelList = [
    BoardingModel(imagePath: "assets/on1.jpg", textOne: "Your Appearance",
        textTwo: "Shows Your Quality", textThree: "Change The Quality Of Your", textFour: "Appearance Using Mavix"),
    BoardingModel(imagePath: "assets/on6.jpg", textOne: "Your Cloth Liking",
        textTwo: "Is All Found Here", textThree: "Browse Various Categories Based", textFour: "on The Latest Fashion Models"),
    BoardingModel(imagePath: "assets/on3.jpg", textOne: "The Most Affordable",
        textTwo: "Prices Among All Shops", textThree: "Upgrade Your Old-Fashioned Closet", textFour: "And Replace With the Best Quality"),
  ];
  PageController boardingController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children:
      [

        // onBoardingWidget PageView
        Expanded(
          flex: 6,
          child: PageView.builder(itemBuilder: (context, index)=>onBoardingWidget(boardingModelList[index], context),
          itemCount: boardingModelList.length, controller: boardingController, onPageChanged: (index)
            {
              if(index == boardingModelList.length - 1)
              {
                CacheHelper.setData("onBoarding", true);
              }
            },),
        ),
        // page SwitchIndicator
        Expanded(
          flex: 0,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: SmoothPageIndicator(controller: boardingController, count: boardingModelList.length,
              effect: ExpandingDotsEffect(dotColor: Theme.of(context).colorScheme.secondary, dotWidth: 10, dotHeight: 5,
                  activeDotColor: Theme.of(context).colorScheme.primary, spacing: 5),),
          ),
        ),
        // register Button
        Expanded(
          flex: 1,
            child: Padding(padding: const EdgeInsets.fromLTRB(0.0, 30, 0, 25),
              child: Material(  //Wrap with Material
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30)),
                clipBehavior: Clip.antiAlias, // Add This
                child: MaterialButton(
                  minWidth: 375.0,
                  height: 20,
                  color: Theme.of(context).colorScheme.primary,
                  child: Text('Sign Up With Email',
                      style: TextStyle(fontSize: 16.0, color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    navigateEnd(context, const Register());
                  },
                ),
              ),
            ))
      ],)
    );
  }
}

