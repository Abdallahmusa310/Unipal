import 'package:flutter/material.dart';
import 'package:unipal/constans/colors.dart';
import 'package:unipal/constans/strings.dart';
import 'package:unipal/widgets/coustm_boutton.dart';
import 'package:unipal/widgets/coustm_text.dart';
import 'package:unipal/widgets/coustm_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = true;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0073C6), Color.fromARGB(255, 48, 180, 236)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/white_logo.png', height: 150),
                    CoustmText(
                      text: 'Lets get started!',
                      color: Appcolors.whitecolor,
                      textsize: 18,
                    ),
                    CoustmText(
                      text: 'UniPal',
                      color: Appcolors.whitecolor,
                      textsize: 48,
                    ),
                    Divider(indent: 70, endIndent: 70, height: 2, thickness: 1),
                    SizedBox(height: 20),
                    CoustmText(
                      text: 'Sign up and start your campus journey',
                      textsize: 14,
                      color: Colors.white70,
                    ),
                    SizedBox(height: 24),
                    CoustmTextField(
                      obscureText: false,
                      text: 'First Name',
                      icon: Icons.abc,
                    ),
                    const SizedBox(height: 16),
                    CoustmTextField(
                      obscureText: false,
                      text: 'e_mail',
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 16),
                    CoustmTextField(
                      controller: passwordController,
                      obscureText: isPasswordVisible,
                      text: 'password',
                      icon: Icons.key,
                      iconbt: IconButton(
                        color: Appcolors.whitecolor,
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CoustmTextField(
                      controller: confirmpasswordController,
                      obscureText: isPasswordVisible,
                      text: 'Confirm password',
                      icon: Icons.key,
                      iconbt: IconButton(
                        color: Appcolors.whitecolor,
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      child: CoustmBoutton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final password = passwordController.text.trim();
                            final confirmPassword =
                                confirmpasswordController.text.trim();
                            if (password != confirmPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Passwords do not match"),
                                ),
                              );
                            } else {
                              Navigator.pushNamed(context, homeScreen);
                            }
                          }
                        },
                        text: 'Sign Up',
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CoustmText(
                          text: 'Alredy have Account?',
                          color: Colors.white70,
                          textsize: 14,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, loginscreen);
                          },
                          child: CoustmText(
                            text: 'Log in',
                            color: Appcolors.whitecolor,
                            textsize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
