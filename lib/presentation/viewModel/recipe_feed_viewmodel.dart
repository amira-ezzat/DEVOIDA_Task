import 'package:bloc/bloc.dart';
import 'package:devoida_task/presentation/viewModel/state.dart';

import '../../domain/repositories/recipe_repository.dart';

class RecipeViewModel extends Cubit<RecipeState> {
  final RecipeService recipeService;

  RecipeViewModel({required this.recipeService}) : super(RecipeInitial());

  // Fetch recipes
  void fetchRecipes() {
    emit(RecipeLoading());
    recipeService.getRecipes().listen(
          (recipes) {
        emit(RecipeLoaded(recipes: recipes));
      },
      onError: (error) {
        emit(RecipeError(message: error.toString()));
      },
    );
  }

  // Fetch recipes by category
  void fetchRecipesByCategory(String category) {
    emit(RecipeLoading());
    recipeService.getRecipesByCategory(category).listen(
          (recipes) {
        emit(RecipeLoaded(recipes: recipes));
      },
      onError: (error) {
        emit(RecipeError(message: error.toString()));
      },
    );
  }
}
