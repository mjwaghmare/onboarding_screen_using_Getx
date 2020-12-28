import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:onboarding_screen/models/onboarding_info_model.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();

  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;

  nextPage() {
    if (isLastPage) {
      //go to hoepage
    }
    {
      pageController.nextPage(
          duration: 300.milliseconds, curve: Curves.easeInCubic);
    }
  }

  List<OnboardingInfoModel> onBoardingPages = [
    OnboardingInfoModel('assets/order.png', 'Order Your Food',
        'Now you can order food any time  right from your mobile.'),
    OnboardingInfoModel('assets/cook.png', 'Cooking Safe Food',
        'We are maintain safety and We keep clean while making food.'),
    OnboardingInfoModel('assets/deliver.png', 'Quick Delivery',
        'Orders your favorite meals will be  immediately deliver')
  ];
}
