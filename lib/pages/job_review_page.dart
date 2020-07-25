import 'package:flutter/material.dart';
import 'package:wazfny_client/custom_widgets/user_info.dart';
import 'package:wazfny_client/models/freelancer.dart';
import 'package:wazfny_client/models/job_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wazfny_client/utils/constants.dart';

class JobReviewPage extends StatefulWidget {
  final Job job;

  JobReviewPage({this.job});

  @override
  _JobReviewPageState createState() => _JobReviewPageState();
}

class _JobReviewPageState extends State<JobReviewPage> {
  String getPostTime(Timestamp postTime) {
    DateTime dateTime = postTime.toDate();
    return '${dateTime.day}-${dateTime.month}-${dateTime.year} at ${dateTime.hour}:${dateTime.minute}';
  }

  List<dynamic> skills = [];
  List<dynamic> proposals = [];

  @override
  void initState() {
    super.initState();
    skills = widget.job.skills;
    proposals = widget.job.proposals;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Review'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.job.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10),
            Divider(height: 1, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              getPostTime(widget.job.postTime),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Divider(height: 1, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              widget.job.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Divider(height: 1, color: Colors.grey),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Budget',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\$${widget.job.budget}',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Level',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${widget.job.level}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(height: 1, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              'Skills and Expertise',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              children: skills.map((skill) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: EdgeInsets.only(right: 10, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    skill,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Divider(height: 1, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              'Proposals',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: proposals.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    color: appTheme.primaryColorDark,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          userInfo(proposals[index]['freelancerId']),
                          SizedBox(height: 10),
                          Text(
                            'Cover Letter',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            proposals[index]['coverLetter'],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: FlatButton(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  onPressed: () {},
                                  color: appTheme.primaryColor,
                                  child: Text('Message'),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: FlatButton(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  onPressed: () {},
                                  color: appTheme.primaryColor,
                                  child: Text('Hire'),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
