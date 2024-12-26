import 'package:devoida_task/presentation/modelView/RecipeViewModel.dart';
import 'package:devoida_task/presentation/modelView/UserViewModel.dart';
import 'package:devoida_task/presentation/view/page/create.dart';
import 'package:devoida_task/presentation/view/page/login.dart';
import 'package:devoida_task/presentation/view/page/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'core/layout/layout.dart';
import 'core/utils/theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => RecipeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipe Sharing App',
        theme:lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/feed': (context) => MainScreen(),
          '/create': (context) => RecipeCreateScreen(),

        },
      ),
    );
  }
}