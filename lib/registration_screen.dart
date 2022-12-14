import 'package:flash_chat_app/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_app/components/round_button.dart';
import 'package:flash_chat_app/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  const RegistrationScreen({super.key});


  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'pic',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/pic.png'),
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
                  decoration: passwordTextField.copyWith(hintText: 'Enter your email'),
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
                  decoration:  passwordTextField.copyWith(hintText: 'Enter your password'),
                ),
                const SizedBox(height: 24.0),

                RoundButton(title: 'Register', colour: Colors.lightBlueAccent, onPressed: () async{
                  setState(() {
                    showSpinner = true;
                  });
                  try{
                  final newUser = await _auth.createUserWithEmailAndPassword(email: email!, password: password!);
                  // print(newUser.user.email);
                  if(newUser != null){
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