import 'package:flutter/material.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  TextEditingController highest=TextEditingController();
    TextEditingController insname=TextEditingController();
      TextEditingController passoutyear=TextEditingController();
      int _selectedCourse = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('Education',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 19)),
        
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:EdgeInsets.all(14.0),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 14)),
              TextFormField(
              controller: highest,
              decoration: InputDecoration(
                labelText: 'Highest qualification',
                border: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black,
                )
                )
              ),
              ),
               SizedBox(height: 13),
              Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 14)), 
                  TextFormField(
                    controller: insname,
                    decoration: InputDecoration(
                      labelText: 'Institute name',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        )
                      )
                    ),
                  ),
                   SizedBox(height: 13),
                   Column(
                     children: [
                       Padding(padding: EdgeInsets.symmetric(horizontal: 14)),
                       TextFormField(
                        controller: insname,
                        decoration: InputDecoration(
                          labelText: 'Passout Year',
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.black,
                            )
                          )
                        ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text('Course type',style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                     ],
                   ),
                   ListTile(
                    title: Text('Full time'),
                    leading: Radio(value: 0, groupValue: _selectedCourse, onChanged: (value) {
                      setState(() {
                        _selectedCourse = value!;
                      });
                    },),
                   ),
                   ListTile(
                    title: Text('Part time'),
                    leading: Radio(value: 1, groupValue: _selectedCourse, onChanged: (value) {
                      setState(() {
                        _selectedCourse = value!;
                      
                      });
                    },),
                   ),
                   ListTile(
                    title: Text('Correspondence'),
                    leading: Radio(value: 2, groupValue: _selectedCourse, onChanged: (value) {
                      setState(() {
                        _selectedCourse = value!;
                      });
                    },),
                   ),
                    SizedBox(
                height: 17,
              ),
], ),
ElevatedButton(onPressed: () {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Education(),));
}, child: Text('Save'),
style: ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(6),
  ),
),
),
            ],
          ),
        ),
      ),
    );

  }
}
