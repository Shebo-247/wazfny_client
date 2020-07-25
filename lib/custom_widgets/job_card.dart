import 'package:flutter/material.dart';
import 'package:wazfny_client/utils/constants.dart';

Widget jobCard(job) {
  return Card(
    elevation: 5,
    color: appTheme.primaryColor,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Text(
            job.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(job.description),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: job.status == 'Open' ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              job.status,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Budget',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '\$${job.budget}',
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Period',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    job.period,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Level',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    job.level,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
