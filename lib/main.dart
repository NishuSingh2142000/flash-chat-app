// @dart=2.9
import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}
class FlashChat extends StatefulWidget {
  @override
  State<FlashChat> createState() => _FlashChatState();
}

class _FlashChatState extends State<FlashChat> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context) =>  WelcomeScreen(),
        LoginScreen.id : (context) =>  LoginScreen(),
        RegistrationScreen.id : (context) => const RegistrationScreen(),
        ChatScreen.id : (context) =>  ChatScreen(),

      },
    );
  }
}