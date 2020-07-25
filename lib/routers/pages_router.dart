import 'package:flutter/material.dart';
import 'package:wazfny_client/pages/chat_page.dart';
import 'package:wazfny_client/pages/home_page.dart';
import 'package:wazfny_client/pages/job_review_page.dart';
import 'package:wazfny_client/pages/login_page.dart';
import 'package:wazfny_client/pages/my_jobs_page.dart';
import 'package:wazfny_client/pages/not_exist_page.dart';
import 'package:wazfny_client/pages/notifications_page.dart';
import 'package:wazfny_client/pages/profile_editing_page.dart';
import 'package:wazfny_client/pages/profile_page.dart';
import 'package:wazfny_client/pages/signup_page.dart';
import 'package:wazfny_client/pages/splash_page.dart';
import 'package:wazfny_client/utils/constants.dart';

class PagesRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => HomePage());
        break;
      case loginPage:
        return MaterialPageRoute(builder: (context) => LoginPage());
        break;
      case signUpPage:
        return MaterialPageRoute(builder: (context) => SignUpPage());
        break;
      case myJobsPage:
        return MaterialPageRoute(builder: (context) => MyJobsPage());
        break;
      case chatPage:
        return MaterialPageRoute(builder: (context) => ChatPage());
        break;
      case notificationsPage:
        return MaterialPageRoute(builder: (context) => NotificationsPage());
        break;
      case profilePage:
        return MaterialPageRoute(builder: (context) => ProfilePage());
        break;
      case profileEditingPage:
        return MaterialPageRoute(builder: (context) => ProfileEditingPage());
        break;
      case splashPage:
        return MaterialPageRoute(builder: (context) => SplashPage());
        break;
    }

    return MaterialPageRoute(builder: (context) => NotExistPage());
  }
}
