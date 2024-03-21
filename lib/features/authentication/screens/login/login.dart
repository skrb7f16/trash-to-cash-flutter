import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trash_to_cash_flutter/features/authentication/screens/signup/signup.dart';
import 'package:trash_to_cash_flutter/features/home/home.dart';
import 'package:trash_to_cash_flutter/utils/constants/style_constants.dart';
import 'package:trash_to_cash_flutter/utils/constants/text_constants.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
   return _Login();

  }
}

class _Login extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;
  Future<void> submit() async {
    setState(() {
      loading = true;
    });
    final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    final user = credentials.user;
    if(user != null) {
      setState(() {
        loading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    }

  }

  void goToSignup() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>new Signup()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
          child: Container(
            height: 300,
            margin: const EdgeInsets.all(20),
          
          
            child: DecoratedBox(
              decoration: const BoxDecoration(boxShadow: [BoxShadow(
                color: Colors.grey,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                )], borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: !loading ? Column(
                  children: [
                    const Text(TextConstants.loginPageHeading, style: StyleConstants.heading,),
                    TextFormField(style: const TextStyle(color: Colors.black),decoration: const InputDecoration(hintText: TextConstants.emailPlaceHolder), controller: emailController,),
                    TextFormField(decoration: const InputDecoration(hintText: TextConstants.passwordPlaceHolder), controller: passwordController,),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed:submit , style: StyleConstants.primaryButton, child: Text('Login'),),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('New here? '),
                        TextButton(onPressed: goToSignup, child: const Text('Register here'))
                      ],
                    )
                  ],
                ): Text("Loggin in.."),
              ),
            ),
          ),
        ),
    );
  }

}
