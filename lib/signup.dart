import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailtakenController = TextEditingController();
    TextEditingController pwtakenController = TextEditingController();
    Future<void> register() async {
      String email=emailtakenController.text;
      String pw=pwtakenController.text;
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pw,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Column(
        children: [
          Center(
              child: Text('Register',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'Rubik Regular',color: Color(0xff6499E9)),)
          ),
          SizedBox(
            height: 15,
          ),
          Center(
              child: Text('Register yourself with us',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,fontFamily: 'Rubik Regular',color: Color(0xff6499E9)),)
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 30,
          ),

          Padding(
            padding: EdgeInsets.only(left: 20,right: 20,top: 10),
            child: TextFormField(
                controller: emailtakenController,
              decoration: InputDecoration(

                  fillColor: Color(0xffF8F9FA),
                  hintText: 'Email',
                  filled: true,
                  prefixIcon: Icon(Icons.alternate_email,color: Color(0xff323F4B),),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xffE4E7EB))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xffE4E7EB))
                  )
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: TextFormField(
              controller: pwtakenController,
              decoration: InputDecoration(
                  fillColor: Color(0xffF8F9FA),
                  hintText: 'Password',
                  filled: true,
                  prefixIcon: Icon(Icons.lock_open,color: Color(0xff323F4B),),
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xffE4E7EB))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xffE4E7EB))
                  )
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: 170,
            decoration: BoxDecoration(
                color: Color(0xffF9703B),
                borderRadius: BorderRadius.circular(11)
            ),
            child: Center(
                child: TextButton(
                  onPressed: () {
                    register();
                    Navigator.pop(context);
                  }, child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Rubik Regular',
                        color: Colors.white)
                ),)),
          ),
        ],
      ),
    );
  }
}
