import 'package:devoida_task/presentation/view/pages/auth/login_page.dart';
import 'package:devoida_task/presentation/view/pages/auth/register_page.dart';
import 'package:devoida_task/presentation/viewModel/auth/auth_viewmodel.dart';
import 'package:devoida_task/presentation/viewModel/recipe_feed_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/repositories/auth_repository.dart';
import 'domain/repositories/recipe_repository.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(AuthRepository()),
        ),
        BlocProvider(
          create: (_) => RecipeViewModel(recipeService: RecipeService()),
        ),

      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );

  }
}

