import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class JobApplicationRepository {
  
Future<DocumentReference<Object?>> applyForJob(String userId, String jobid, Map<String, dynamic> job) async {

final CollectionReference applicationsCollection =
      FirebaseFirestore.instance.collection('applyjobcollection');
      final uuid = Uuid();
      final jobaplid = uuid.v4();
      

  try {
    DocumentReference applicationRef = await applicationsCollection.add({
      'userId': userId,
      'jobid': jobid, // Add the 'jobid' to the application data
      'jobapplicationid':jobaplid,
      'appliedDate': FieldValue.serverTimestamp(),
      
      // Add other application-related data as needed
    });
    return applicationRef;
  } catch (e) {
    print('Error applying for job: $e');
    throw e;
  }
}}
