import 'package:cloud_firestore/cloud_firestore.dart';

class JobApplicationRepository {
  final CollectionReference applicationsCollection =
      FirebaseFirestore.instance.collection('applyjobcollection');

  Future<DocumentReference<Object?>> applyForJob(String userId, Map<String, dynamic> job) async {
    try {
     
      DocumentReference applicationRef = await applicationsCollection.add({
        'userId': userId,
        'appliedDate': FieldValue.serverTimestamp(), 
      
      });
    return applicationRef;
    } catch (e) {
      print('Error applying for job: $e');
      throw e;
    }
  }
}
