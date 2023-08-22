import 'package:careerpoint2/contactus/contactus.dart';
import 'package:careerpoint2/empaccount/empaccnt.dart';
import 'package:careerpoint2/employers/employers.dart';
import 'package:careerpoint2/firstscreen/firstscreen.dart';
import 'package:careerpoint2/firstscreen/view/aboutus.dart';
import 'package:careerpoint2/login/login.dart';
import 'package:careerpoint2/searchjobs/search.dart';
import 'package:careerpoint2/signup/signup.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  
  void handleDrawerItemTap(BuildContext context) {
    // Handle drawer item tap here
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Build your profile',
            ),
            accountEmail:
                Text('Job opportunities waiting for you at Careerpoint'),

            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avathar.png'),
            ),
            
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text('Login'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: const Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),

          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchJobs(),
                        ));
                  },
                  child: Text(
                    'Search jobs',
                    style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          const SizedBox(
            height: 15,
          ),

          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>EmpAccnt(),));
                  },
                  child: Text(
                    'Employers',
                    style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutUs(),
                        ));
                  },
                  child: Text(
                    'About Us',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
            ],
          ),

          const SizedBox(height: 15),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FAQ(),
                        ));
                  },
                  child: Text(
                    'FAQ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          const SizedBox(height: 15),

          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactUs(),
                        ));
                  },
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
