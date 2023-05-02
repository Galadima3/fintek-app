import 'package:email_validator/email_validator.dart';
import 'package:fintek/src/features/account/presentation/screens/home_screen.dart';
import 'package:fintek/src/features/auth/data/auth_repository.dart';
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
  //submit method
  onSubmit(WidgetRef ref, String email, String password) {
    if (_formKey.currentState!.validate()) {
      return ref
          .read(authRepositoryProvider)
          .signInWithEmailAndPassword(email, password)
          .then((value) => Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen(
                   
                  );
                },
              )));
    }
  }

  @override
  build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    //disposing all text controllers

    return SafeArea(
      child: Scaffold(
        body: Container(
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
                    'asset/images/logo.svg',
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
                        validator: (text) => EmailValidator.validate(text!)
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
                    child: TextField(
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
                      ref, emailController.text, passwordController.text),
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
                      onTap: () => Navigator.push(context, MaterialPageRoute(
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
        ),
      ),
    );
  }
}
