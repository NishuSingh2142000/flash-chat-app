import 'package:flash_chat_app/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_app/constant.dart';
import 'package:flash_chat_app/components/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                    child: Hero(
                      tag: 'pic',
                      child: SizedBox(
                        height: 200.0,
                        child: Image.asset('images/pic.png'),
                      ),
                    ),

                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },

                  decoration:  passwordTextField.copyWith(hintText: 'Enter your email'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: passwordTextField.copyWith(hintText: 'Enter your password'),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                RoundButton(title: 'Log In', colour: Colors.lightBlueAccent, onPressed: () async{
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email!, password: password!);
                    if(user != null){
                      Navigator.pushNamed(context, ChatScreen.id);
                  }
                    setState(() {
                      showSpinner = false;
                    });
                  }catch (e){
                    print(e);
                  }

                },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}