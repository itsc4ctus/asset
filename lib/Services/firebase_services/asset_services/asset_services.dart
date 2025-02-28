import 'package:asset/Models/asset_model/asset_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AssetServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // --------------------- CREATE ---------------------

  // Upload (add) a new asset by unique ID
  Future<bool> uploadAsset(AssetModel newAsset, String uniqueId) async {
    try {
      await _firestore
          .collection('assets')
          .doc(uniqueId)
          .set(newAsset.toMap());
      return true; // Successfully uploaded
    } catch (e) {
      print('Error uploading asset: $e');
      return false; // Failed to upload
    }
  }

  // --------------------- READ ---------------------

  // Fetch an asset by unique ID
  Future<AssetModel?> fetchAsset(String uniqueId) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('assets')
          .doc(uniqueId)
          .get();

      if (doc.exists) {
        return AssetModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        return null; // Asset not found
      }
    } catch (e) {
      print('Error fetching asset: $e');
      return null;
    }
  }

  // --------------------- UPDATE ---------------------

  // Update an asset by unique ID
  Future<bool> updateAsset(String uniqueId, AssetModel updatedAsset) async {
    try {
      await _firestore
          .collection('assets')
          .doc(uniqueId)
          .update(updatedAsset.toMap());
      return true; // Successfully updated
    } catch (e) {
      print('Error updating asset: $e');
      return false; // Failed to update
    }
  }

  // --------------------- DELETE ---------------------

  // Delete an asset by unique ID
  Future<bool> deleteAsset(String uniqueId) async {
    try {
      await _firestore
          .collection('assets')
          .doc(uniqueId)
          .delete();
      return true; // Successfully deleted
    } catch (e) {
      print('Error deleting asset: $e');
      return false; // Failed to delete
    }
  }
}