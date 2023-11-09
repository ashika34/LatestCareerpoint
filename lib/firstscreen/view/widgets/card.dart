import 'dart:math';
import 'package:careerpoint2/homepage/repo/favoriterepo.dart';
import 'package:careerpoint2/jobdetails/jobdetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../homepage/repo/applyjobrepo.dart';
 // Update the import path as needed


class MyCard extends StatefulWidget {
  MyCard({
    Key? key,
    required this.job,
  }) : super(key: key);
  final Map<String, dynamic> job;

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool isFavorite = false; 
  
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
              widget.job['job title'].toString(),
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
                    widget.job['companyname'].toString(),
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
                    widget.job['qualification'].toString(),
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
                    widget.job['monthly salary'].toString(),
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
                    widget.job['jobtype'].toString(),
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
                    widget.job['joblocation'].toString(),
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
                    widget.job['hiring process'].toString(),
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
      widget.job['jobdescription'].toString(),
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
    ),
  ],
) ,
),
SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              IconButton(
  onPressed: () async {
    setState(() {
      isFavorite = !isFavorite;
    });
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;
        String jobid = widget.job['jobid'].toString();
        await FavRepository().favJob(userId, jobid, widget.job);

         ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added Successfully')),
    );
      } else {
        
        print('User is not logged in.');
      }
    } catch (e) {
      print('Something went wrong: $e');
    }
   
  },icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.blue : null,
        ),
  // ...
),

                SizedBox(width: 8.0),
                ElevatedButton(
  onPressed: () async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userId = user.uid;
        String jobid = widget.job['jobid'].toString();
     
        await JobApplicationRepository().applyForJob(userId, jobid, widget.job);
      } else {
        
      }
    } catch (e) {
      print('Error applying for job: $e');
    }
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Applied Successfully')));
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
