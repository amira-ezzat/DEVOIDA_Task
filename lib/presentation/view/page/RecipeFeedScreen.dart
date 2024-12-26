import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_icons.dart';
import '../../modelView/RecipeViewModel.dart';
import 'create.dart';

class RecipeFeedScreen extends StatefulWidget {
  @override
  _RecipeFeedScreenState createState() => _RecipeFeedScreenState();
}

class _RecipeFeedScreenState extends State<RecipeFeedScreen> {
  @override
  void initState() {
    super.initState();
    final recipeViewModel = Provider.of<RecipeViewModel>(context, listen: false);
    recipeViewModel.fetchRecipes(); // Fetch recipes when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Feed'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipeCreateScreen()),
              ).then((_) {
                recipeViewModel.fetchRecipes(); // Fetch recipes after returning
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: recipeViewModel.recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipeViewModel.recipes[index];

          // للتحقق مما إذا كانت الوصفة مفضلة
          bool isFavorite = recipeViewModel.favoriteRecipes.any((fav) => fav['id'] == recipe['id']);

          return Card(
            color: Colors.white,
            margin: const EdgeInsets.all(10),
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
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    recipe['description'] ?? 'Short description of the recipe.',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up_alt_outlined, color:  Colors.grey),
                      onPressed: () {
                        recipeViewModel.likeRecipe(recipe['id']);
                      },
                    ),
                    IconButton(
                      icon: const Icon(IconBroken.Chat,
                          color:  Colors.grey),
                      onPressed: () {
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        IconBroken.Heart,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        if (isFavorite) {
                          recipeViewModel.favoriteRecipes.removeWhere((fav) => fav['id'] == recipe['id']);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Removed from favorites!')),
                          );
                        } else {
                          recipeViewModel.addToFavorites(recipe);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to favorites!')),
                          );
                        }
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}