import 'package:careerpoint2/employers/employers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class emplrlogin extends StatefulWidget {
  const emplrlogin({super.key});

  @override
  State<emplrlogin> createState() => _emplrloginState();
}

class _emplrloginState extends State<emplrlogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Hello Again'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60)),
            Image.asset('assets/images/careerpoint.png',
                height: 150, width: 150),
            SizedBox(height: 30),
            Column(
              children: [
                Text(
                  'Empower Your Hiring Journey',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                SizedBox(height: 10),
                Text(
                  'Log in to find the perfect candidates for your team.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Email ',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    )),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password))),
            ),
            SizedBox(height: 30),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final _auth = FirebaseAuth.instance;
                        final userRef = await _auth.signInWithEmailAndPassword(
                            email: email.text, password: password.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Employers(),
                            ));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Invalid username or password')));
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
