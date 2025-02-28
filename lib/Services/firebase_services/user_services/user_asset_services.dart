import 'package:asset/Models/asset_model/asset_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show FieldValue, FirebaseFirestore;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, User;

class UserAssetServices {
  User user = FirebaseAuth.instance.currentUser!;

  // Function to add an asset to the assetsFREE array
  Future<void> addToAssetsFree(AssetModel asset) async {
    final userDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(user.email); // Use the user's email as the document ID

    await userDoc.update({
      'assetsFREE': FieldValue.arrayUnion([asset.toMap()]), // Add the asset to the array
    });
  }

  // Function to add an asset to the assetsPURCHASED array
  Future<void> addToAssetsPurchased(AssetModel asset) async {
    final userDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(user.email); // Use the user's email as the document ID

    await userDoc.update({
      'assetsPURCHASED': FieldValue.arrayUnion([asset.toMap()]), // Add the asset to the array
    });
  }

  // Function to fetch the assetsFREE list
  Future<List<AssetModel>> fetchAssetsFree() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.email)
        .get();

    final List<dynamic> assetsFreeData = userDoc['assetsFREE'] ?? [];
    return assetsFreeData.map((item) => AssetModel.fromMap(item)).toList();
  }

  // Function to fetch the assetsPURCHASED list
  Future<List<AssetModel>> fetchAssetsPurchased() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.email)
        .get();

    final List<dynamic> assetsPurchasedData = userDoc['assetsPURCHASED'] ?? [];
    return assetsPurchasedData.map((item) => AssetModel.fromMap(item)).toList();
  }
}