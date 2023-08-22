import 'package:careerpoint2/employers/employers.dart';
import 'package:careerpoint2/emplrlogin/emplrlogin.dart';
import 'package:flutter/material.dart';
import '../repo/signupemp_repo.dart';

class EmpAccnt extends StatelessWidget {
  EmpAccnt({Key? key}) : super(key: key);

  // TextEditingController companyname = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> jobTypes = ['Any', 'Full time', 'Part time', 'Internship'];
  String? _selectedJobType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Create an Employer Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 18),
                Image.asset(
                  'assets/images/careerpoint.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'You have not posted a job before, so you will need to create an employer account.',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 18),
                // TextFormField(
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return "Please fill this field";
                //     }
                //   },
                //   keyboardType: TextInputType.name,
                //   controller: companyname,
                //   decoration: InputDecoration(
                //     labelText: 'Your Company name',
                //     border: OutlineInputBorder(),
                //     prefixIcon: Icon(
                //       Icons.home,
                //       color: Colors.black,
                //     ),
                //   ),
              //  ), 
                SizedBox(height: 35),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please fill this field";
                    }
                  },
                  keyboardType: TextInputType.name,
                  controller: name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 35),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please fill this field";
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 35),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please fill this field";
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  controller: password,
                  obscureText: true, 
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 35),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please fill this field";
                    }
                  },
                  keyboardType: TextInputType.phone,
                  controller: phone,
                  decoration: InputDecoration(
                    labelText: 'Phone number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await SignupRepo().createUser(
                          
                          name.text,
                          email.text,
                          password.text,
                          phone.text,
                          context,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Signup successful')),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => emplrlogin()),
                        );
                      }
                    },
                    child: const Text('Sign Up'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Text('or'),

                SizedBox(
                  height: 10,
                ),
                 Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => emplrlogin(),));
                        
                      }, child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )
                      ),
                      ),
                      
                  ),
                  ),
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}
