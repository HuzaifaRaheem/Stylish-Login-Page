import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:lgoin_ui/homescreen.dart';

import 'package:lgoin_ui/signup.dart';

import 'firebase_options.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController pwController = TextEditingController();
    void forHom2(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    }
    Future<void> forHome() async {

      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: pwController.text,
        );
        forHom2();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }

    }

    return Scaffold(
      backgroundColor: Color(0xffF1EFEF),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image(
                    height: 50,
                    width: 50,
                    image: AssetImage('images/logo.png')
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Maintenance', style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Rubik Medium',
                        color: Colors.black),),
                    Text('Box', style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Rubik Regular',
                        color: Color(0xffF9703B)),),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Center(
                child: Text('Login', style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Rubik Regular',
                    color: Color(0xff6499E9)),)
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Text('Contrary to popular belief.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Rubik Regular',
                      color: Color(0xff6499E9)),)
            ),
            SizedBox(
              height: 15,
            ),


            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    fillColor: Color(0xffF8F9FA),
                    hintText: 'Email',
                    filled: true,
                    prefixIcon: Icon(
                      Icons.alternate_email, color: Color(0xff323F4B),),
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

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                controller: pwController,
                decoration: InputDecoration(
                    fillColor: Color(0xffF8F9FA),
                    hintText: 'Password',
                    filled: true,
                    prefixIcon: Icon(
                      Icons.lock_open, color: Color(0xff323F4B),),
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
            const SizedBox(
              height: 15,
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
                      forHome();
                    }, child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Rubik Regular',
                          color: Colors.white)
                  ),)),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?", style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Rubik Medium',
                    color: Colors.black),),
                TextButton(
                  child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Rubik Regular',
                          color: Color(0xffF9703B))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },),

              ],
            )
          ],
        ),
      ),
    );
  }


}