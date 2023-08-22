

import 'package:careerpoint2/firstscreen/firstscreen.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
   TextEditingController _nameController = TextEditingController();
   TextEditingController _emailController = TextEditingController();
   TextEditingController _mobileController = TextEditingController();
   TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Contact Us'),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back,color: Colors.white,),
           ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Phone: 815-684-1505\n\nEmail: contactus@careerpoint.com\n\nGive feedback or report an issue',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: UnderlineInputBorder(),
              ),
              
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: UnderlineInputBorder(),
              ),
              
            ), SizedBox(height: 20),
            TextFormField(
              controller: _mobileController,
              decoration: InputDecoration(
                labelText: 'Mobile No',
                border: UnderlineInputBorder(),
              ),
               ), 
               SizedBox(height: 20),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: UnderlineInputBorder(),
              ),
                ), 
                SizedBox(
                  height: 25,
                ),
                Container(
                  width:MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FirstScreen(),));
                  }, child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )

                  ),
                  ),

                ),
            ],
        ),

      ),
    );
  }
}

