import 'package:careerpoint2/moredetails/moredetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Careerpoint',
          style: TextStyle(fontWeight: FontWeight.bold,),
        ),
      ),
      body: 
      Column(
        children: [
          Image.asset(
                  'assets/images/careerpoint.png',
                  height: 150,
                  width: 150,
                ),
          SingleChildScrollView(
          padding: const EdgeInsets.all(15.0), 
            child: Center(
              child: Card(
                elevation: 8,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8, // Adjust the width
                  padding: EdgeInsets.all(16),
                  child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    future: FirebaseFirestore.instance
                        .collection('usercollection')
                        .doc(_user.uid)
                        .get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final userData = snapshot.data?.data() ?? {};
            
                        return Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Personal Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Name: ${userData['username']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            Text('Email: ${userData['email']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            Text('Mobile: ${userData['mobile']}',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                            Text('Location: ${userData['location']}',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            Text('Experience: ${userData['experience']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            Text('Qualification: ${userData['qualification']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            SizedBox(
                            height: 20,
                            ),
                            ElevatedButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MoreDetailPage()));
                            
                            }, child: Text('Add more details')),
                           ],
                        );
                      }
                      },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}








// import 'package:careerpoint2/desiredjob/desiredjob.dart';
// import 'package:careerpoint2/education/education.dart';
// import 'package:careerpoint2/empdetails/empdetail.dart';
// import 'package:careerpoint2/firstscreen/firstscreen.dart';
// import 'package:careerpoint2/personal/personal.dart';
// import 'package:careerpoint2/worksum/worksum.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';


// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   late User _user;
//   Map<String, dynamic> _userData = {};
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         drawer: MyDrawer(),
//         appBar: AppBar(
//           title: Row(
//             children: [
//               Text(
//                 'Careerpoint',
//                 style: TextStyle(fontSize: 23),
//               ),
//               Spacer(),
//               Icon(Icons.search),
//               SizedBox(width: 10),
//               Icon(Icons.favorite),
//             ],
//           ),
//         ),
//         body:
//         Container(
//         child:  FutureBuilder(
//             future: ,
//             initialData: InitialData,
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               return ;
//             },
//           ),
//         ),
        
// //         Card(
// //   child: Container(
    
// //     width: double.infinity,
// //     height: 150,
// //     child: Padding(
// //       padding: EdgeInsets.all(9.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text('Personal Details',style: TextStyle(fontWeight: FontWeight.bold),),
// //           SizedBox(height: 10),
// //           Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text('Name:'),
// //               Text('Email: '),
// //               Text('Location:'),
// //             ],
// //           ),
// //           SizedBox(height: 10), 
// //           Row(
// //             children: [
// //               Spacer(),
// //               ElevatedButton(
// //                 onPressed: () {
                  
// //                 },
// //                 child: Text('Add more details'),
// //                 style: ElevatedButton.styleFrom(
                
// //                   shape: RoundedRectangleBorder(
                    
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     ),
// //   ),
// // )

//         //  SingleChildScrollView(
//         //   child: Padding(
//         //     padding: const EdgeInsets.all(12),
//         //     child: Column(
//         //       children: [
//         //         Card(
//         //           elevation: 3,
//         //           child: Container(
//         //             width: double.infinity,
//         //             height: 85,
//         //             child: Padding(
//         //               padding: const EdgeInsets.all(9.0),
//         //               child: Column(
//         //                 crossAxisAlignment: CrossAxisAlignment.start,
//         //                 children: [
//         //                   Row(
//         //                     children: [
//         //                       Text(
//         //                         'Personal Details',
//         //                         style: TextStyle(
//         //                             fontWeight: FontWeight.bold, fontSize: 19),
//         //                       ),
//         //                       Spacer(),
//         //                       IconButton(
//         //                         onPressed: () {
//         //                           Navigator.push(
//         //                             context,
//         //                             MaterialPageRoute(
//         //                               builder: (context) => PersonalDetails(),
//         //                             ),
//         //                           );
//         //                         },
//         //                         icon: Icon(Icons.edit),
//         //                       ),
//         //                     ],
//         //                   ),
//         //                   SizedBox(height: 11),
//         //                   // Align(
//         //                   //   alignment: Alignment.centerLeft,
//         //                   //   child: Text(
//         //                   //     'Email id:',
//         //                   //     style: TextStyle(
//         //                   //         fontWeight: FontWeight.bold, fontSize: 15),
//         //                   //   ),
//         //                   // ),
//         //                   // SizedBox(height: 11),
                          
//         //                 ],
//         //               ),
//         //             ),
//         //           ),
//         //         ),
//         //         SizedBox(
//         //           height: 20,
//         //         ),
//         //         Card(
//         //           child: Container(
//         //             width: double.infinity,
//         //             height: 85,
//         //             padding: EdgeInsets.all(9.0),
//         //             child: Column(
//         //               crossAxisAlignment: CrossAxisAlignment.start,
//         //               children: [
//         //                 Row(
//         //                   children: [
//         //                     Text(
//         //                       'Work Summary',
//         //                       style: TextStyle(
//         //                           fontSize: 19, fontWeight: FontWeight.bold),
//         //                     ),
//         //                     Spacer(),
//         //                     IconButton(
//         //                         onPressed: () {
//         //                           Navigator.push(
//         //                               context,
//         //                               MaterialPageRoute(
//         //                                 builder: (context) => WorkSum(),
//         //                               ));
//         //                         },
//         //                         icon: Icon(Icons.edit))
//         //                   ],
//         //                 ),
//         //                 SizedBox(
//         //                   height: 11,
//         //                 ),
//         //                 ],
//         //             ),
//         //           ),
//         //         ),
//         //         SizedBox(
//         //           height: 20,
//         //         ),
//         //         Card(
//         //           child: Container(
//         //             width: double.infinity,
//         //             height: 85,
//         //             child: Row(
//         //               children: [
//         //                 Padding(
//         //                   padding: EdgeInsets.all(9.0),
//         //                 ),
//         //                 Text(
//         //                   'Job Details',
//         //                   style: TextStyle(
//         //                       fontWeight: FontWeight.bold, fontSize: 19),
//         //                 ),
//         //                 Spacer(),
//         //                 IconButton(
//         //                     onPressed: () {
//         //                       Navigator.push(
//         //                           context,
//         //                           MaterialPageRoute(
//         //                             builder: (context) => empDetails(),
//         //                           ));
//         //                     },
//         //                     icon: Icon(Icons.edit)),
//         //               ],
//         //             ),
//         //           ),
//         //         ),
//         //         Card(
//         //           child: Container(
//         //             width: double.infinity,
//         //             height: 85,
//         //             child: Row(
//         //               children: [
//         //                 Padding(
//         //                   padding: EdgeInsets.all(9.0),
//         //                 ),
//         //                 Text(
//         //                   'Education',
//         //                   style: TextStyle(
//         //                       fontWeight: FontWeight.bold, fontSize: 19),
//         //                 ),
//         //                 Spacer(),
//         //                 IconButton(
//         //                     onPressed: () {
//         //                       Navigator.push(
//         //                           context,
//         //                           MaterialPageRoute(
//         //                             builder: (context) => Education(),
//         //                           ));
//         //                     },
//         //                     icon: Icon(Icons.edit))
//         //               ],
//         //             ),
//         //           ),
//         //         ),
//         //         Card(
//         //           child: Container(
//         //             width: double.infinity,
//         //             height: 85,
//         //             child: Row(
//         //               children: [
//         //                 Padding(
//         //                   padding: EdgeInsets.all(9.0),
//         //                 ),
//         //                 Text(
//         //                   'Desired Job',
//         //                   style: TextStyle(
//         //                       fontSize: 19, fontWeight: FontWeight.bold),
//         //                 ),
//         //                 Spacer(),
//         //                 IconButton(
//         //                     onPressed: () {
//         //                       Navigator.push(
//         //                           context,
//         //                           MaterialPageRoute(
//         //                             builder: (context) => DesiredJob(),
//         //                           ));
//         //                     },
//         //                     icon: Icon(Icons.edit))
//         //               ],
//         //             ),
//         //           ),
//         //         ),
//         //         Card(
//         //           child: Container(
//         //           width: double.infinity,
//         //             height: 85,
//         //             child: Row(
//         //               children: [
//         //                 Padding(padding: EdgeInsets.all(9.0)),
//         //                 Text(
//         //                   'Resume',
//         //                   style:
//         //                       TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
//         //                       Spacer(),
//         //                       ElevatedButton(onPressed: () {
//         //                         Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
//         //                       }, 
//         //                     child: Text('Add'),
//         //                     style: ElevatedButton.styleFrom(
                                
//         //                       shape: RoundedRectangleBorder(
//         //                         borderRadius: BorderRadius.circular(4),
                                
//         //                       )
//         //                        ),),
//         //                 ],
//         //             ),
                    
//         //           ),
                  
//         //         )
//         //       ],
//         //     ),
//         //   ),
//         // )
//         );
//   }
// }