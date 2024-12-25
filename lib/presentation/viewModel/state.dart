import '../../domain/model/recipe_model.dart';

abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<Recipe> recipes;

  // Remove 'const' if the parent class is not const
  RecipeLoaded({required this.recipes});

  @override
  List<Object> get props => [recipes];
}

class RecipeError extends RecipeState {
  final String message;

  RecipeError({required this.message});

  @override
  List<Object> get props => [message];
}
