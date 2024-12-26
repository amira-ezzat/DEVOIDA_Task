import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> _recipes = [];
  List<Map<String, dynamic>> _favoriteRecipes = [];

  List<Map<String, dynamic>> get recipes => _recipes;
  List<Map<String, dynamic>> get favoriteRecipes => _favoriteRecipes;

  void addToFavorites(Map<String, dynamic> recipe) {
    if (!_favoriteRecipes.any((fav) => fav['id'] == recipe['id'])) {
      _favoriteRecipes.add(recipe);
      notifyListeners();
    }
  }
  Future<String> uploadImage(File image) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('recipes/${DateTime.now().millisecondsSinceEpoch}.png');
      await storageRef.putFile(image);
      return await storageRef.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      throw e; // إعادة طرح الخطأ لتتمكن من التعامل معه في مكان آخر
    }
  }
  Future<void> fetchRecipes() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('recipes').get();
      _recipes = snapshot.docs.map((doc) => {
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>
      }).toList();
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> createRecipe(Map<String, dynamic> recipeData) async {
    try {
      await _firestore.collection('recipes').add(recipeData);
      await fetchRecipes(); // Ensure to await fetch to update recipes
    } catch (e) {
      throw e;
    }
  }

  Future<void> likeRecipe(String recipeId) async {
    DocumentReference docRef = _firestore.collection('recipes').doc(recipeId);
    await docRef.update({
      'likes': FieldValue.increment(1),
    });
  }
}