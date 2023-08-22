import 'package:careerpoint2/searchjobs/search.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController emailid = TextEditingController();
  TextEditingController mobileno = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();
  
  int _selectedGender = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        
        title: Row(
          children: [
            Text(
              'Personal Details',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchJobs(),
                  ),
                );
              },
              icon: Icon(Icons.search),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalDetails(),
                  ),
                );
              },
              icon: Icon(Icons.favorite),
            ),
          ],
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(14.0),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 14.0)),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 13),
              TextFormField(
                controller: emailid,
                decoration: InputDecoration(
                  labelText: 'Email id',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13),
              TextFormField(
                controller: mobileno,
                decoration: InputDecoration(
                  labelText: 'Mobile no',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13),
              TextFormField(
                controller: location,
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13),
              TextFormField(
                controller: dateofbirth,
                decoration: InputDecoration(
                  labelText: 'Date of birth',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Gender:',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                ],
              ),
               SizedBox(height: 12),
              ListTile(
                title: Text('Male'),
                leading: Radio(
                  value: 0,
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Female'),
                leading: Radio(
                  value: 1,
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Other'),
                leading: Radio(
                  value: 2,
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Prefer not to say'),
                leading: Radio(value: 3, groupValue: _selectedGender, onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  }); 
                },),
              ),
              SizedBox(
                height: 17,
              ),
             
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalDetails(),));
              }, child: Text('Save',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),
              ),
              style:ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                )
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
