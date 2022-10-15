import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/utilities/dialogs/error_dialog.dart';
import 'package:mynotes/views/notes/notes_view.dart';
import 'package:mynotes/views/register_view.dart';
import 'package:mynotes/views/verify_email_view.dart';
import 'package:page_transition/page_transition.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontFamily: 'PoppinsBold',
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Enter Your Email here',
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Enter Your Password here',
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                await AuthService.firebase().logIn(
                  email: email,
                  password: password,
                );

                final user = AuthService.firebase().currentUser;
                //getting the current user
                if (user?.isEmailVerified ?? false) {
                  //user's email is verified
                  Navigator.of(context).pushAndRemoveUntil(
                    PageTransition(
                      child: const NotesView(),
                      type: PageTransitionType.leftToRight,
                    ),
                    (route) => false,
                  );
                } else {
                  //user's email is not verified \
                  Navigator.of(context).pushAndRemoveUntil(
                    PageTransition(
                      child: const VerifyEmailView(),
                      type: PageTransitionType.leftToRight,
                    ),
                    (route) => false,
                  );
                }
              } on UserNotFoundAuthException {
                await showErrorDialog(
                  context,
                  'User not Found',
                );
              } on WrongPasswordAuthException {
                await showErrorDialog(
                  context,
                  'Wrong Credentials',
                );
              } on GenericAuthException {
                await showErrorDialog(
                  context,
                  'Authentication Error ',
                );
              }
            },
            child: const Text(
              'Login',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins',
                  fontSize: 20),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                PageTransition(
                  child: const RegisterView(),
                  type: PageTransitionType.leftToRight,
                ),
                (route) => false,
              );
            },
            child: const Text(
              'Not registered yet? Register here!',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Poppins',
                  fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
