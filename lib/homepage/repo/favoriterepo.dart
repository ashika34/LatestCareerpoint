import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FavRepository {
  
Future<DocumentReference<Object?>> favJob(String userId, String jobid, Map<String, dynamic> job) async {

final CollectionReference favoriteCollection =
      FirebaseFirestore.instance.collection('favcollection');
      final uuid = Uuid();
      final favid = uuid.v4();
      try {
    DocumentReference favRef = await favoriteCollection.add({
      'userId': userId,
      'jobid': jobid, 
      'favouritesid':favid,
     });
    return favRef;
  } catch (e) {
    print('something went wrong: $e');
    throw e;
  }
}}




