import 'package:flutter/material.dart';

const String homePage = "/";
const String loginPage = "loginPage";
const String signUpPage = "signUpPage";
const String myJobsPage = "jobsPage";
const String chatPage = "chatPage";
const String notificationsPage = "notificationsPage";
const String profilePage = "profilePage";
const String profileEditingPage = "profileEditingPage";
const String splashPage = "splashPage";
const String jobReviewPage = "jobReviewPage";

ThemeData appTheme = ThemeData(
    primaryColor: Color(0xFFE8E80F),
    primaryColorDark: Color(0xFF4C4C4C),
    accentColor: Color(0xFFFFFFFF));

InputDecoration kInputDecoration(iconData, hintText) {
  return InputDecoration(
    prefixIcon: Icon(
      iconData,
      color: appTheme.primaryColor,
    ),
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.white38,
      fontSize: 18,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: appTheme.primaryColor,
        width: 3,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: appTheme.primaryColor,
        width: 3,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: appTheme.primaryColor,
        width: 3,
      ),
    ),
  );
}
