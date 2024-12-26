import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/componant/appBar.dart';
import '../../modelView/RecipeViewModel.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);
    final favoriteRecipes = recipeViewModel.favoriteRecipes;

    return Scaffold(
      appBar: const CustomApp(title: 'Favorite',),
      body: favoriteRecipes.isEmpty
          ? const Center(child: Text('No favorite recipes yet.'))
          : ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          final recipe = favoriteRecipes[index];
          return Card(
            color: Colors.white,
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  recipe['imageUrl'] ?? 'https://via.placeholder.com/150',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    recipe['title'] ?? 'Recipe Title',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
