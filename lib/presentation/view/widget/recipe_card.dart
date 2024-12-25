import 'package:flutter/material.dart';

import '../../../domain/model/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(recipe.title),
        subtitle: Text(recipe.category),
        trailing: Icon(Icons.favorite),
        onTap: () {
          // تنفيذ بعض الإجراءات عند الضغط على الوصفة
        },
      ),
    );
  }
}
