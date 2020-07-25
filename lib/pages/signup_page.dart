import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wazfny_client/models/client_model.dart';
import 'package:wazfny_client/utils/constants.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController,
      passwordController,
      firstNameController,
      lastNameController,
      addressController;

  FirebaseAuth auth;

  void initializeUserInfo(clientID) {
    Client client = Client(
      id: clientID,
      firstName: firstNameController.value.text,
      lastName: lastNameController.value.text,
      address: addressController.value.text,
      image: '',
    );

    Firestore.instance
        .collection("Clients")
        .document(clientID)
        .setData(client.toJson())
        .whenComplete(() => print('User added Successfully !'));
  }

  void signUp() {
    var email = emailController.value.text;
    var password = passwordController.value.text;
    if (email != null || password != null) {
      auth
          .createUserWithEmailAndPassword(
              email: emailController.value.text, password: password)
          .whenComplete(() async {
        String userID;
        final user = await auth.currentUser();
        user != null ? userID = user.uid : "";

        initializeUserInfo(userID);
        Navigator.pop(context);
        Navigator.pushNamed(context, homePage);
      });
    } else {
      print('Please fProvide valid email and password');
    }
  }

  @override
  void initState() {
    super.initState();

    auth = FirebaseAuth.instance;

    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    addressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: appTheme.primaryColor,
        ),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 100,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: appTheme.primaryColorDark,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(150))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 80,
                        margin: EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Wazafny-Logo-white.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        decoration:
                            kInputDecoration(Icons.email, "Email Address"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        decoration: kInputDecoration(Icons.lock, "Password"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: firstNameController,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        decoration:
                            kInputDecoration(Icons.person, "First Name"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: lastNameController,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        decoration: kInputDecoration(Icons.person, "Last Name"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: addressController,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        decoration:
                            kInputDecoration(Icons.location_on, "Address"),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          signUp();
                        },
                        child: Container(
                          height: 65,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: appTheme.primaryColor,
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
