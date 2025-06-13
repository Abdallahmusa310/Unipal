import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unipal/constans/colors.dart';
import 'package:unipal/constans/strings.dart';
import 'package:unipal/widgets/coustm_boutton.dart';
import 'package:unipal/widgets/coustm_text.dart';
import 'package:unipal/widgets/coustm_text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isPasswordVisible = true;
  String? email, password;
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
                      text: 'Welcome to',
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
                      text: 'Log in your campus companion',
                      textsize: 16,
                      color: Colors.white70,
                    ),
                    SizedBox(height: 36),
                    CoustmTextField(
                      onChanged: (data) {
                        email = data;
                      },
                      obscureText: false,
                      text: 'e_mail',

                      icon: Icons.email,
                    ),
                    const SizedBox(height: 16),
                    CoustmTextField(
                      onChanged: (data) {
                        password = data;
                      },
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, forgetpassword);
                        },
                        child: CoustmText(
                          text: 'Forget password ?',
                          color: Colors.white70,
                          textsize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CoustmBoutton(
                        text: 'Log in',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                    email: email!,
                                    password: password!,
                                  );
                              Navigator.pushNamed(context, homeScreen);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'No user found for that email.',
                                    ),
                                  ),
                                );
                              } else if (e.code == 'invalid-credential') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Wrong password provided for that user.',
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'An error occurred: ${e.message}',
                                    ),
                                  ),
                                );
                                print(e.toString());
                              }
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CoustmText(
                          text: 'Dont have Account?',
                          color: Colors.white70,
                          textsize: 14,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, signupscreen);
                          },
                          child: CoustmText(
                            text: 'Sign up',
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
