import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../viewModel/recipe_feed_viewmodel.dart';
import '../../../viewModel/state.dart';
import '../../widget/recipe_card.dart';

class RecipeFeedPage extends StatefulWidget {
  @override
  _RecipeFeedPageState createState() => _RecipeFeedPageState();
}

class _RecipeFeedPageState extends State<RecipeFeedPage> {
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    // جلب الوصفات عند تحميل الصفحة
    context.read<RecipeViewModel>().fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Feed'),
        actions: [
          DropdownButton<String>(
            value: selectedCategory,
            items: ['All', 'Vegan', 'Dessert', 'Gluten-Free']
                .map((category) => DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value!;
              });
              // جلب الوصفات حسب التصنيف المحدد
              if (selectedCategory == 'All') {
                context.read<RecipeViewModel>().fetchRecipes();
              } else {
                context.read<RecipeViewModel>().fetchRecipesByCategory(selectedCategory);
              }
            },
          ),
        ],
      ),
      body: BlocConsumer<RecipeViewModel, RecipeState>(
        listener: (context, state) {
          if (state is RecipeError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          if (state is RecipeLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is RecipeLoaded) {
            final recipes = state.recipes;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return RecipeCard(recipe: recipe);
              },
            );
          }
          return Center(child: Text('No recipes available.'));
        },
      ),
    );
  }
}
