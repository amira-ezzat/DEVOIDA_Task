import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/recipe_model.dart';

class RecipeService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // دالة للحصول على الوصفات من Firestore
  Stream<List<Recipe>> getRecipes() {
    return _db.collection('recipes').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Recipe.fromMap(doc.data());
      }).toList();
    });
  }

  // دالة للحصول على الوصفات حسب التصنيف
  Stream<List<Recipe>> getRecipesByCategory(String category) {
    return _db
        .collection('recipes')
        .where('category', isEqualTo: category)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Recipe.fromMap(doc.data());
      }).toList();
    });
  }
}
