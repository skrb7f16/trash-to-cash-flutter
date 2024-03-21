import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trash_to_cash_flutter/features/authentication/screens/login/login.dart';

class OnboardingController {
  OnboardingController();
  var pageNumber = 0;
  static const maxPage = 3;
  PageController pageController = PageController(initialPage: 0);
  void incrementPage(BuildContext context) {
    if(pageNumber == maxPage-1){
      goToLogin(context);
      return;
    }
    pageNumber = pageNumber + 1;
    pageController.jumpToPage(pageNumber);
  }
  void decrementPage() {
    if(pageNumber == 0){
      return;
    }
    pageNumber = pageNumber - 1;
    pageController.jumpToPage(pageNumber);

  }

  void pageChange(int num) {
    pageNumber = num;
  }

  void goToLogin(BuildContext context) {
    log('message');
    Navigator.push(context, MaterialPageRoute(builder: (context)=>new Login()));
  }
}