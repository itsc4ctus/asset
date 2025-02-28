import 'package:asset/Domain/constants/values.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to create or update user document
  Future<void> createOrUpdateUserDocument(User user) async {
    final DocumentReference userDoc = _firestore.collection('users').doc(user.email);

    // Check if the document exists
    final DocumentSnapshot docSnapshot = await userDoc.get();

    if (!docSnapshot.exists) {
      // Create a new document with default fields
      await userDoc.set({
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        'photoURL': user.photoURL,
        ...UserDefaults.defaultFields, // Add default fields
        'createdAt': FieldValue.serverTimestamp(),
      });
      print("New user document created for ${user.uid}");
    } else {
      print("User document already exists for ${user.uid}");
    }
  }

  // Method to update user document with new fields
  Future<void> updateUserDocument(String uid, Map<String, dynamic> newFields) async {
    final DocumentReference userDoc = _firestore.collection('users').doc(uid);
    await userDoc.update(newFields);
    print("User document updated for $uid");
  }
}