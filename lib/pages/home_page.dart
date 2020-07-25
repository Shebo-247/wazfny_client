import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wazfny_client/custom_widgets/bottom_nav_item.dart';
import 'package:wazfny_client/models/navigation.dart';
import 'package:wazfny_client/pages/chat_page.dart';
import 'package:wazfny_client/pages/my_jobs_page.dart';
import 'package:wazfny_client/pages/notifications_page.dart';
import 'package:wazfny_client/pages/profile_page.dart';
import 'package:wazfny_client/utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth;
  FirebaseUser loggedUser;

  List<Widget> navWidgets = [
    MyJobsPage(),
    ChatPage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  int selectedNavBar = 0;

  List<Navigation> bottomNavList = [
    Navigation(
        title: Text("My Jobs".toUpperCase()), icon: Icon(Icons.card_travel)),
    Navigation(
        title: Text("Chats".toUpperCase()),
        icon: Icon(Icons.chat_bubble_outline)),
    Navigation(
        title: Text("Alerts".toUpperCase()),
        icon: Icon(Icons.notifications_none)),
    Navigation(
        title: Text("Profile".toUpperCase()), icon: Icon(Icons.person_outline)),
  ];

  void checkLoggedUser() async {
    try {
      final user = await auth.currentUser();
      if (user != null) {
        loggedUser = user;
      } else {
        Navigator.pop(context);
        Navigator.pushNamed(context, splashPage);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    auth = FirebaseAuth.instance;
    checkLoggedUser();
  }

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<FirebaseUser>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Wazfny Client"),
      ),
      drawer: _appDrawer(),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 65,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: bottomNavList.map((navItem) {
            int currentNavBar = bottomNavList.indexOf(navItem);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedNavBar = currentNavBar;
                });
              },
              child: BottomNavItem(navItem, selectedNavBar == currentNavBar),
            );
          }).toList(),
        ),
      ),
      body: loggedUser != null ? navWidgets[selectedNavBar] : Container(),
    );
  }

  Widget _appDrawer() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.70,
        height: MediaQuery.of(context).size.height,
        color: appTheme.primaryColorDark,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundColor: appTheme.primaryColor,
              radius: 75,
            ),
            Divider(
              color: appTheme.accentColor,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.work,
                    color: appTheme.primaryColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Browse Projects',
                    style: TextStyle(fontSize: 18, color: appTheme.accentColor),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                FirebaseAuth auth = FirebaseAuth.instance;
                await auth.signOut();
                Navigator.pop(context);
                Navigator.pushNamed(context, splashPage);
              },
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: appTheme.accentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
