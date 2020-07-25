import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wazfny_client/custom_widgets/job_card.dart';
import 'package:wazfny_client/models/job_model.dart';
import 'package:wazfny_client/pages/job_review_page.dart';
import 'package:wazfny_client/utils/constants.dart';

class MyJobsPage extends StatefulWidget {
  @override
  _MyJobsPageState createState() => _MyJobsPageState();
}

class _MyJobsPageState extends State<MyJobsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<FirebaseUser>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        backgroundColor: appTheme.primaryColorDark,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: Firestore.instance.collection("Jobs").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Container(
                child: Center(
                  child: Text('Loading ...'),
                ),
              );

            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                if (!snapshot.hasData) return Container();
                var data = snapshot.data.documents[index].data;

                Job job = Job.fromJson(data);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobReviewPage(
                          job: job,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: job.clientID == loggedUser.uid
                        ? jobCard(job)
                        : Container(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
