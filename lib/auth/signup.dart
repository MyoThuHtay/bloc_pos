import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/auth/login.dart';
import 'package:pos/bloc/auth/auth_bloc.dart';
import 'package:pos/constant/dimension.dart';
import 'package:pos/homepage.dart';
import 'package:pos/widgets/button.dart';
import 'package:pos/widgets/customText.dart';
import 'package:pos/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController repeatpasswordcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    repeatpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: const [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.green[200]!,
            Colors.blue[400]!,
            Colors.white,
            Colors.green[400]!,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
            if (state is AuthSuccess) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(
                      uid: state.uid,
                    ),
                  ),
                  (route) => false);
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              // if (state is AuthLoading) {
              //   return Center(
              //     child: CircularProgressIndicator(
              //         valueColor: animationController.drive(ColorTween(
              //             begin: Colors.blueAccent, end: Colors.red))),
              //   );
              // }
              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimensions.height15,
                        ),
                        Center(
                            child: GradientText(
                          'Welcome',
                          style: const TextStyle(fontSize: 30),
                          gradient: LinearGradient(colors: [
                            Colors.blue.shade400,
                            const Color.fromARGB(255, 80, 161, 13),
                          ]),
                        )),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        CustomTextField(
                          controller: emailcontroller,
                          hintText: 'Email',
                          isPassword: false,
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        CustomTextField(
                          controller: passwordcontroller,
                          hintText: 'Password',
                          isPassword: true,
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        CustomTextField(
                          controller: repeatpasswordcontroller,
                          hintText: 'Password',
                          isPassword: true,
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        CustomButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                    EmailSignUpRequested(
                                      email: emailcontroller.text.trim(),
                                      password: passwordcontroller.text.trim(),
                                      rePassword:
                                          repeatpasswordcontroller.text.trim(),
                                    ),
                                  );
                            },
                            text: 'Sign Up'),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: const Divider(
                                    color: Colors.black,
                                    height: 36,
                                  )),
                            ),
                            const Text('Or'),
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 10.0),
                                  child: const Divider(
                                    color: Colors.black,
                                    height: 36,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        SocialLoginButton(
                          buttonType: SocialLoginButtonType.google,
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(GoogleLoginRequested());
                          },
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        SocialLoginButton(
                          buttonType: SocialLoginButtonType.facebook,
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(FacebookLoginRequested());
                          },
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ));
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
