import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class PersonalRepo {
  Future<void> addPersonal(
    String dob,
    String institutename,
    String passoutyear,
    String jobtype,
    String skills,
    List<PlatformFile> pdfFiles,
    BuildContext context,
  ) async {
    final uuid = Uuid();
    final pid = uuid.v4();
    List<String> resume = [];

    final _auth = FirebaseAuth.instance;
    final CollectionReference _personalRef =
        FirebaseFirestore.instance.collection('personalcollection');

    try {
      for (final file in pdfFiles) {
        final reference = FirebaseStorage.instance.ref().child('resume').child(file.name);
        final fileBytes = file.bytes;
        await reference.putData(fileBytes!);
        final pdfUrl = await reference.getDownloadURL();
        resume.add(pdfUrl);
      }
      await _personalRef.doc(pid).set({
        'userid': _auth.currentUser!.uid,
        'dob': dob,
        'institutename': institutename,
        'passoutyear': passoutyear,
        'jobtype': jobtype,
        'skills': skills,
        'personalid': pid,
        'resume': resume,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Updated Successfully')),
      );
    } on FirebaseException catch (e) {
      var statusCode = e.code.toString();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(statusCode)),
      );
    }
  }
}

// The MoreDetailPage class and build method remain unchanged.



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

// class PersonalRepo {
//   Future<void> addPersonal(
//     String dob,
//     String institutename,
//     String passoutyear,
//     String jobtype,
//     String skills,
//     List<PlatformFile> pdfFiles,
//     BuildContext context,
//   ) async {
//     final uuid = Uuid();
//     final pid = uuid.v4();
//     List<String>? resume = []; 

//     final _auth = FirebaseAuth.instance;
//     final CollectionReference _personalRef =
//         FirebaseFirestore.instance.collection('personalcollection');
//     try {
//       for (final file in pdfFiles) {
//         final reference = FirebaseStorage.instance
//             .ref()
//             .child('personalPDFs')
//             .child(file.name);
           
//          final fileBytes = file.bytes; 
//         await reference.putData(fileBytes!);
//         final pdfUrl = await reference.getDownloadURL();
//         resume.add(pdfUrl);
//       }
//       await _personalRef.doc(pid).set({
//         'userid': _auth.currentUser!.uid,
//         'dob': dob,
//         'institutename': institutename,
//         'passoutyear': passoutyear,
//         'jobtype': jobtype,
//         'skills': skills,
//         'personalid': pid,
//         'pdfs': resume,
//       });
//     } on FirebaseException catch (e) {
//       var statusCode = e.code.toString();
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(statusCode)));
//     }
//   }
// }
