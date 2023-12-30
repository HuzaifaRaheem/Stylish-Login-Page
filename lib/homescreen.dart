import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    TextEditingController subController = TextEditingController();
    TextEditingController worController = TextEditingController();




    void saveData() {
      DatabaseReference db=FirebaseDatabase.instance.ref().child('Data');
      Map<String,String> Data={
        'Subject':subController.text,
        'Work': worController.text
      };
      db.push().set(Data);


    }
    return Scaffold(
      backgroundColor: Color(0xffF1EFEF),
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Column(


        children: [
          Container(
              height: 40,
              width: double.infinity,
              child: Center(child: Text('Wellcome',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.blueGrey),))),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: subController,
              decoration: InputDecoration(
                  fillColor: Color(0xffF8F9FA),
                  hintText: 'Subject',
                  label: Text("Subject"),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.subject, color: Color(0xff323F4B),),
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
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              maxLines: 5,
              controller: worController,
              decoration: InputDecoration(

                  fillColor: Color(0xffF8F9FA),
                  hintText: 'Work',
                  label: Text("Work"),

                  filled: true,
                  prefixIcon: Icon(
                    Icons.work, color: Color(0xff323F4B),),
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
          SizedBox(height: 20,),
          Container(
            height: 40,
            width: 170,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(11)
            ),
            child: Center(
                child: TextButton(
                  onPressed: () {
                    saveData();
                  }, child: const Text(
                    '   Save   ',
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
