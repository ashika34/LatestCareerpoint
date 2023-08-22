import 'package:careerpoint2/jobdetails/jobdetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../homepage/repo/applyjobrepo.dart';

class MyCard extends StatelessWidget {
  MyCard({
    Key? key,
    required this.job,
  }) : super(key: key);
  final Map<String, dynamic> job;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job['job title'].toString(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    job['companyname'].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              child: Row(
                children: [
                  Text(
                    job['qualification'].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    job['monthly salary'].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    job['jobtype'].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Row(
                children: [
                   Text(
                    job['joblocation'].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                   ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Row(
                children: [
                   Text(
                    job['hiring process'].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                   ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
        child:Row(
        children: [
       Text(
      job['jobdescription'].toString(),
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
    ),
  ],
) ,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                   try {
                    
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        
        String userId = user.uid;

        
        await JobApplicationRepository().applyForJob(userId, job);

        
      } else {
        
      }
                   } catch (e) {
                      print('Error applying for job: $e');
                   }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Applied Succesfully')));
                  },
                   child: Column(
                    children: [
                      Text(
                        'Apply',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
