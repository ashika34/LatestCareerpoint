import 'package:careerpoint2/firstscreen/view/widgets/card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}); 
  @override
  State<Favorite> createState() => _FavoriteState();
}
class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My jobs'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('favcollection').snapshots(), 
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final favDocs = snapshot.data!.docs as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
          return Expanded(
            child: ListView.builder(
              itemCount: favDocs.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> favData = favDocs[index].data();
                return Card(
                  child: Text(favData[0].toString()),
                ); 
              },
            ),
          );
        },
      ),
    );
  }
}
