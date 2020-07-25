import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wazfny_client/models/freelancer.dart';
import 'package:wazfny_client/utils/constants.dart';

Widget userInfo(freelancerID) {
  return StreamBuilder(
    stream: Firestore.instance
        .collection("Users")
        .document(freelancerID)
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return Container();

      // get info of jobOwner
      Freelancer user = Freelancer.fromJson(snapshot.data.data);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: appTheme.primaryColor,
                radius: 25,
                child: Center(
                  child: Text(
                    user.firstName.substring(0, 1),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: appTheme.primaryColor,
                    ),
                  ),
                  Text(
                    user.jobTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    user.address,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          //savedJobIcon(jobID, loggedUserID),
        ],
      );
    },
  );
}
