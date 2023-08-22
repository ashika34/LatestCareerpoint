
import 'package:careerpoint2/login/login.dart';
import 'package:careerpoint2/signup/repo/signup_repo.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  // const SignUp({Key? key}) : super(key: key);
    SignUp({super.key});

//   State<SignUp> createState() => _SignUpState();
  
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

// class _SignUpState extends State<SignUp> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController experience= TextEditingController();
  final TextEditingController qualification= TextEditingController();
   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/careerpoint.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: 40),
                Text('Apply to jobs from Indias No.1 Job Site',style: TextStyle(fontWeight: FontWeight.bold,fontSize:17),),
                SizedBox(
                  height: 55,
                ),
                Container(
               child:  TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please fill this field";
                    }
                  },
                  controller: name,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.person, color: Colors.black),
                  ),
                ),
            ),
                SizedBox(
                  height: 25,
                ),
                Container(
                child:TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please fill this field";
                    }
                  },
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.email, color: Colors.black),
                  ),
                ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                child:TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please fill this field";
                    }
                  },
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.password, color: Colors.black),
                  ),
                ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                child:TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please fill this field";
                    }
                  },
                  controller: phoneNumber,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Mobile phone',
                    border: OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.phone, color: Colors.black),
                  ),
                ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                child:TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please fill this field";
                    }
                  },
                  controller: location,
                  keyboardType:TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.pin_drop,color: Colors.black),
                  ),
                  ),
                ),
                  SizedBox(
                    height: 25
                  ),
                  Container(
                  child:TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please fill this field";
                      }
                    },
                  controller: experience,
                  keyboardType:TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Experience',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.work_history,color: Colors.black),
                  ),
                  ),
                  ),
                  SizedBox(
                    height: 25
                  ),
                  Container(
                  child:TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please fill this field";
                      }
                    },
                  controller: qualification,
                  keyboardType:TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Qualification',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.school,color: Colors.black),
                  ),
                  ),
                  ),
                  // SizedBox(
                  //   height: 25
                  // ),
                  // ElevatedButton(onPressed: () {
                    
                  // }, child: Text('Upload Resume'),
                  // style:ElevatedButton.styleFrom(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20)
                  //   )
                  // ),
                  // ),
                  SizedBox(
                  height: 20,

                  ),

                  Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) 
                        await SignupRepo().createUser(
                        name.text,
                       email.text,
                       password.text,
                         phoneNumber.text,
                          location.text,
                          experience.text,
                           qualification.text, context);
                           ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Signup successful'),
                            ),);
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text('Sign Up'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Already a member',style: TextStyle(fontWeight: FontWeight.bold),),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                }, child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold),)),
                 ],
            ),
          ),
        ),
      ),
    );
  }
}



