import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

List<PageViewModel> pages = [
  PageViewModel(
    title: "QuoteGen",
    body:
        "Introducing \"QuoteGen\" - a mobile app that helps you generate a random quote from a wide variety of categories, save your favorite quotes, and receive daily notifications to inspire and motivate you!",
    image: Image.asset(
      'assets/images/reading.png',
      height: 55.sp,
    ),
  ),
  PageViewModel(
    title: "Category",
    body:
        "Select a category that resonates with you, such as love, success, happiness, or friendship, and the app will generate a random quote for you within that category.",
    image: Image.asset(
      'assets/images/book.png',
      height: 55.sp,
    ),
  ),
  PageViewModel(
    title: "Saving",
    body:
        "With a simple click of a button, you can add a quote to your favorites list and easily access it later when you need a dose of inspiration or motivation.",
    image: Image.asset(
      'assets/images/save.png',
      height: 55.sp,
    ),
  ),
  PageViewModel(
    title: "Notification",
    body:
        "You can turn on daily notifications and receive a new quote every day to start your day off right. You can even choose what time of day you want to receive the notification to make sure it fits your schedule perfectly.",
    image: Image.asset(
      'assets/images/notification.png',
      height: 55.sp,
    ),
  ),
  PageViewModel(
    title: "Settings",
    body: "Choose between dark and light mode for optimal viewing experience",
    image: Image.asset(
      'assets/images/matter.png',
      height: 55.sp,
    ),
  )
];
