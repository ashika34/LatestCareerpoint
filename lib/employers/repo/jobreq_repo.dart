// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
// class JobreqRepo {
//   final _auth = FirebaseAuth.instance;
//     final CollectionReference _jobRef =
//         FirebaseFirestore.instance.collection('jobcollection');
//   Future<void> addJob(String jobtitle, 
//   String qualification, 
//   String jobtype,
//   String joblocation,
//   String monthlysalary,
//   String hiringprocess,
//   String jobdescription,
//       BuildContext context) async {
//     final uuid = Uuid();
//     final jid = uuid.v4();
//     try {
//     await _jobRef.doc(jid).set({
//         'userid': _auth.currentUser!.uid,
//         'job title': jobtitle,
//         'qualification': qualification,
//         'jobtype': jobtype,
//         'joblocation':joblocation,
//         'monthly salary':monthlysalary,
//         'hiring process':hiringprocess,
//         'jobdescription':jobdescription,
//         'jobid': jid,
//         });
//     } on FirebaseException catch (e) {
//       var statusCode = e.code.toString();
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(statusCode)));
//     }
//   }
// }










