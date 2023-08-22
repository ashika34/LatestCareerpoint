
// import 'package:careerpoint2/contactus/contactus.dart';
// import 'package:careerpoint2/employers/employers.dart';
// import 'package:careerpoint2/firstscreen/firstscreen.dart';
// import 'package:careerpoint2/login/login.dart';
// import 'package:careerpoint2/searchjobs/search.dart';
// import 'package:careerpoint2/signup/signup.dart';
// import 'package:flutter/material.dart';

// Container drawerWidget(BuildContext context) {
//   return Container(
//     width: MediaQuery.of(context).size.width * 0.80,
//     color: Colors.white,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         UserAccountsDrawerHeader(
//           accountName: const Text(
//             'Build your profile',
//           ),
//           accountEmail: const Text(
//             'Job opportunities waiting for you',
//             style: TextStyle(fontSize: 10),
//           ),
//           currentAccountPicture: CircleAvatar(
//             backgroundImage: AssetImage('assets/images/avathar.png'),
//           ),
//         ),
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => const LoginPage()));
//                 },
//                 child: const Text('Login'),
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 30,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const SignUp()),
//                 );
//               },
//               child: const Text('Sign Up'),
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 25,
//         ),
//         Row(
//           children: [
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SearchJobs()),
//                 );
//               },
//               child: Text(
//                 'Search jobs',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Row(
//           children: [
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) =>Employers()),
//                 );
//               },
//               child: Text(
//                 'Employers',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Row(
//           children: [
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const AboutUs()),
//                 );
//               },
//               child: Text(
//                 'About Us',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Row(
//           children: [
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const FAQ()),
//                 );
//               },
//               child: Text(
//                 'FAQ',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Row(
//           children: [
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const ContactUs()),
//                 );
//               },
//               child: Text(
//                 'Contact Us',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Row(
//           children: [
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const FirstScreen()),
//                 );
//               },
//               child: Text(
//                 'Saved Jobs',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         ],
//     ),
//   );
// }



