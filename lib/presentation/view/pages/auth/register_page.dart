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
import 'login_page.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final authCubit = BlocProvider.of<AuthCubit>(context);

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
                  text: 'Sign Up',
                  fontSize: width / 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 28),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Full Name field
                    CustomTextFormField(
                      hintText: 'Full Name',
                      controller: authCubit.nameController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      prefixIcon: CustomIconButton(
                        icon: const Icon(Icons.perm_identity),
                        padding: const EdgeInsets.only(left: 23, right: 23),
                        onPressed: () {},
                      ),
                      validate: (name) {
                        if (name!.isEmpty) {
                          return 'Name must not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.03),
                    // Email field
                    CustomTextFormField(
                      hintText: 'Enter your email',
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
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.03),
                    // Password field
                    CustomTextFormField(
                      hintText: 'Password',
                      controller: authCubit.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: obscurePassword,
                      prefixIcon: CustomIconButton(
                        icon: const Icon(Icons.lock_outline_rounded),
                        padding: const EdgeInsets.only(left: 23, right: 23),
                        onPressed: () {},
                      ),
                      suffixIcon: CustomIconButton(
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColor.kPrimaryColor1,
                        ),
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Password must not be empty';
                        } else if (value.length < 7) {
                          return 'Enter a valid password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.03),
                    // Confirm Password field
                    CustomTextFormField(
                      hintText: 'Confirm Password',
                      controller: authCubit.passwordConfirmController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: obscureConfirmPassword,
                      prefixIcon: CustomIconButton(
                        icon: const Icon(Icons.lock_outline_rounded),
                        padding: const EdgeInsets.only(left: 23, right: 23),
                        onPressed: () {},
                      ),
                      suffixIcon: CustomIconButton(
                        icon: Icon(
                          obscureConfirmPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColor.kPrimaryColor1,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureConfirmPassword = !obscureConfirmPassword;
                          });
                        },
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Password must not be empty';
                        } else if (value != authCubit.passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),

              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is RegisterSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.message!,
                          style: TextStyle(color: Colors.green),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    );
                  } else if (state is RegisterError) {
                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.error!,
                          style: TextStyle(color: Colors.red),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    );
                    navigateTo(context, RecipeFeedPage());

                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    height: height * 0.08,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await authCubit.signUp(
                            authCubit.nameController.text,
                            authCubit.emailController.text,
                            authCubit.passwordController.text,
                            authCubit.passwordConfirmController.text,
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
                      child: state is AuthLoading
                          ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(AppColor.kPrimaryColor1),
                      )
                          : CustomText(
                        text: 'Sign Up',
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
                    text: 'Have an account? ',
                    colorText: AppColor.kText2,
                    fontSize: width / 24,
                    fontWeight: FontWeight.w400,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateTo(context, const LoginScreen());
                    },
                    child: CustomText(
                      text: 'Login',
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
