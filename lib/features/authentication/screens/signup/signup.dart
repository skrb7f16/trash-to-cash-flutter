import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trash_to_cash_flutter/features/authentication/screens/login/login.dart';

import '../../../../utils/constants/style_constants.dart';
import '../../../../utils/constants/text_constants.dart';
import '../../../home/home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController =TextEditingController();
  Future<void> submit() async {
    final credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    final user = credentials.user;
    if(user != null) {
        user.updateDisplayName(nameController.text);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Home()));
    }
  }
  void goToLogin()  {

    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
  }

  void googleSignin() {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          margin: const EdgeInsets.all(20),


          child: DecoratedBox(
            decoration: const BoxDecoration(boxShadow: [BoxShadow(
              color: Colors.grey,
              offset: Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              )], borderRadius: BorderRadius.all(Radius.circular(10)), ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(TextConstants.loginPageHeading, style: StyleConstants.heading,),
                  TextFormField(style: const TextStyle(color: Colors.black),decoration: const InputDecoration(hintText: TextConstants.emailPlaceHolder), controller: emailController,),
                  TextFormField(style: const TextStyle(color: Colors.black),decoration: const InputDecoration(hintText: TextConstants.namePlaceholder), controller: nameController,),
                  TextFormField(decoration: const InputDecoration(hintText: TextConstants.passwordPlaceHolder), controller: passwordController,),
                  TextFormField(decoration: const InputDecoration(hintText: TextConstants.confirmPasswordPlaceHolder), controller: confirmPasswordController,),

                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed:submit , style: StyleConstants.primaryButton, child: const Text('Submit'),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Text('Already Registered? '),
                      TextButton(onPressed: (){goToLogin();}, child: const Text('Login here'))
                    ],
                  ),
                  ElevatedButton(onPressed: googleSignin, child: Text('Continue with google'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
