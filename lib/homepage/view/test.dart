// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class JobCollectionScreen extends StatelessWidget {

  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Job Collection'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: jobRef.snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator(); // Display loading indicator
//           }

//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
//             return Text('No data available.');
//           }

//           return ListView.builder(
//             itemCount: snapshot.data.docs.length,
//             itemBuilder: (BuildContext context, int index) {
//               DocumentSnapshot document = snapshot.data.docs[index];
//               Map<String, dynamic> jobData = document.data() as Map<String, dynamic>;

//               return ListTile(
//                 title: Text(jobData['title']),
//                 subtitle: Text(jobData['description']),
//                 // Add more widgets to display other job details
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(home: JobCollectionScreen()));
// }
