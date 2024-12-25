import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/componant/appBar.dart';
import '../../../../core/componant/custom_field.dart';
import '../../../../core/componant/custom_icon.dart';
import '../../../../core/componant/custom_text.dart';
import '../../../../core/componant/navigateTo.dart';
import '../../../../core/utils/colors.dart';
import '../../../viewModel/auth/auth_viewmodel.dart';
import '../../../viewModel/auth/states.dart';
import '../recipe_feed/recipe_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomApp(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.08),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomText(
                  text: 'Sign in',
                  fontSize: width / 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 28),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Email',
                      controller: authCubit.emailController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      prefixIcon: CustomIconButton(
                        icon: const Icon(Icons.email_outlined),
                        padding: const EdgeInsets.only(left: 23, right: 23),
                        onPressed: () {},
                      ),
                      validate: (email) {
                        if (email!.isEmpty) {
                          return 'Email must not be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: height * 0.03),
                    CustomTextFormField(
                      hintText: 'Password',
                      controller: authCubit.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: obscureText,
                      prefixIcon: CustomIconButton(
                        icon: const Icon(Icons.lock_outline_rounded),
                        padding: const EdgeInsets.only(left: 23, right: 23),
                        onPressed: () {},
                      ),
                      suffixIcon: CustomIconButton(
                        icon: Icon(
                          obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColor.kPrimaryColor1,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Password must not be empty';
                        } else if (value.length < 7) {
                          return 'Enter a valid password';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // navigateTo(context, ForgotPasswordScreen());
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColor.kPrimaryColor1,
                        fontSize: width / 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoginError) {
                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.error, // Access the 'error' field here
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else if (state is LoginSuccess) {

                     navigateTo(context, RecipeFeedPage());
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(AppColor.kPrimaryColor1),
                      ),
                    );
                  }
                  return SizedBox(
                    height: height * 0.08,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authCubit.login(
                            authCubit.emailController.text,
                            authCubit.passwordController.text,
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(13),
                        backgroundColor: AppColor.kPrimaryColor1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: CustomText(
                        text: 'Login',
                        colorText: Colors.white,
                        fontSize: width / 20.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Don’t have an account? ',
                    colorText: AppColor.kText2,
                    fontSize: width / 24,
                    fontWeight: FontWeight.w400,
                  ),
                  GestureDetector(
                    onTap: () {
                      //navigateTo(context, const ChooseLogin());
                    },
                    child: CustomText(
                      text: 'Sign Up',
                      colorText: AppColor.kPrimaryColor1,
                      fontSize: width / 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
