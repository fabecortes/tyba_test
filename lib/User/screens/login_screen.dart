import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tyba_test/User/screens/search_screen.dart';
import 'package:tyba_test/User/widgets/generic_button.dart';
import 'package:tyba_test/User/widgets/generic_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    final emailLoginController = TextEditingController();
    final passwordLoginController = TextEditingController();
    final firebase = FirebaseFirestore.instance;

    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Container(
            alignment: Alignment.topLeft,
            height: 40.0,
            width: 40.0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 30.0),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(
            height: 40.0,
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
              "Login to the App",
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
            "Email",
            emailLoginController,
            TextInputType.emailAddress,
            Icons.mail,
            false,
          ),
          const SizedBox(
            height: 26.0,
          ),
          GenericTextField(
            "Password",
            passwordLoginController,
            TextInputType.text,
            Icons.lock,
            true,
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Forgot password?",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(height: 36.0),
          GenericButton(
            "Login",
                () async {
              try {
                CollectionReference ref = firebase.collection('Users');
                QuerySnapshot user = await ref.get();

                if (user.docs.isNotEmpty){
                  for (var index in user.docs){
                    if (index.get('Email') == emailLoginController.text
                        && index.get('Password') == passwordLoginController.text){
                      if (!mounted) return;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const SearchScreen()
                          )
                      );
                    }
                  }
                }else{
                  print("no hay documentos en la colección");
                }

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