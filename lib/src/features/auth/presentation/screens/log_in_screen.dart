import 'dart:developer';

import 'package:email_validator/email_validator.dart';

import 'package:fintek/src/features/auth/data/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fintek/src/features/account/presentation/screens/home_screen.dart';

import 'package:fintek/src/features/auth/presentation/screens/register_screen.dart';
import 'package:fintek/src/features/auth/presentation/widgets/shared_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //disposing all text controllers
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  //1
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            user: user,
          ),
        ),
      );
    }
    return firebaseApp;
  }

  //submit method
  onSubmit(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      User? user = await FireAuth.signInUsingEmailPassword(
          email: emailController.text,
          password: passwordController.text,
          context: context);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen(user: user!)),
      );
    }
  }

  Future? value;
  @override
  void initState() {
    super.initState();
    value = _initializeFirebase();
  }

  @override
  build(BuildContext context) {
    var size = MediaQuery.of(context).size;
 

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                width: size.width,
                height: size.height,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50, bottom: 15),
                        child: SvgPicture.asset(
                          height: 200,
                          'asset/images/logo2.svg',
                        ),
                      ),

                      //email textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _formKey,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextFormField(
                              validator: (text) =>
                                  EmailValidator.validate(text!)
                                      ? null
                                      : "Please enter a valid email",
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  prefixIcon: Icon(Icons.email)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      //password textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.password),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      //submit button
                      GestureDetector(
                        onTap: () => onSubmit(
                            emailController.text, passwordController.text),
                        child: const SharedButton(
                          buttonText: 'Log in',
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),
                      //not a member? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Not a registered user?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const RegisterScreen();
                              },
                            )),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Color(0xFF427dde),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
