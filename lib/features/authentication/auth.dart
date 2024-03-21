import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:trash_to_cash_flutter/features/authentication/screens/login/login.dart';
import 'package:trash_to_cash_flutter/features/authentication/screens/onboarding/onboarding.dart';
import 'package:trash_to_cash_flutter/features/home/home.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});
  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  void initState() {
    super.initState();

    setState(() {
      isAuthenticated = FirebaseAuth.instance.currentUser != null;
    });
  }
  bool isAuthenticated = false;
  bool firstTime = false;
  @override
  Widget build(BuildContext context) {
    return firstTime? const Onboarding() : isAuthenticated? const Home() : const Login();
  }
}
