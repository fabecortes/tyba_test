import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tyba_test/User/screens/login_screen.dart';
import 'package:tyba_test/User/widgets/generic_button.dart';
import 'package:tyba_test/User/widgets/generic_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State createState() {
    return _RegisterScreen();
  }
}

class _RegisterScreen extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {

    final userRegisterController = TextEditingController();
    final emailRegisterController = TextEditingController();
    final passwordRegisterController = TextEditingController();
    final firebase = FirebaseFirestore.instance;

    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 100.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Restaurant App",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.8,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Register to the App",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40.4,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 44.0,
          ),
          GenericTextField(
            "User",
            userRegisterController,
            TextInputType.text,
            Icons.person,
            false,
          ),
          const SizedBox(
            height: 26.0,
          ),
          GenericTextField(
            "Email",
            emailRegisterController,
            TextInputType.emailAddress,
            Icons.mail,
            false,
          ),
          const SizedBox(
            height: 26.0,
          ),
          GenericTextField(
            "Password",
            passwordRegisterController,
            TextInputType.text,
            Icons.lock,
            true,
          ),
          const SizedBox(
            height: 12.0,
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    //fontStyle: FontStyle.italic
                ),
                children: <TextSpan> [
                  const TextSpan(text: 'Already have an account? '),
                  TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()
                          )
                        );
                      }
                  ),
                ]
              ),
            )
          ),
          const SizedBox(height: 36.0),
          GenericButton(
            "Register",
            () async {
              try {
                await firebase.collection('Users').doc().set({
                  "Name": userRegisterController.text,
                  "Email": emailRegisterController.text,
                  "Password": passwordRegisterController.text,
                });
              } catch (exception) {
                print(exception);
              }
            },
          ),
          const SizedBox(height: 66.0)
        ],
      ),
    );
  }
}

