import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/componant/appBar.dart';
import '../../../core/componant/custom_field.dart';
import '../../../core/componant/custom_icon.dart';
import '../../../core/componant/custom_text.dart';
import '../../../core/utils/colors.dart';
import '../../modelView/UserViewModel.dart';



class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomApp(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomText(
                    text: 'Sign in',
                    fontSize: width / 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 22,),
                CustomTextFormField(
                  hintText: 'Email',
                  controller: emailController,
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
                  controller:passwordController,
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
                SizedBox(height: 20),
          
                SizedBox(
                  height: height * 0.08,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        await userViewModel.signIn(
                          emailController.text,
                          passwordController.text,
                        );
                        Navigator.pushReplacementNamed(context, '/feed');
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
                        Navigator.pushNamed(context, '/signup');
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
      ),
    );
  }
}
