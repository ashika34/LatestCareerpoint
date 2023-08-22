import 'package:flutter/material.dart';

class DesiredJob extends StatefulWidget {
  const DesiredJob({super.key});

  @override
  State<DesiredJob> createState() => _DesiredJobState();
}

class _DesiredJobState extends State<DesiredJob> {
  TextEditingController desiredjobroles = TextEditingController();
  TextEditingController desiredjobloc = TextEditingController();
  TextEditingController desiredjobindus = TextEditingController();
  TextEditingController desiredjobsala = TextEditingController();
  TextEditingController desiredjobtype = TextEditingController();
  TextEditingController desiredjobshiftyp = TextEditingController();
  int _selectedshifttype = 0;
  List<String> jobTypes = ['Any', 'Full time', 'Part time','internship']; 
  String? _selectedJobType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desired Job'),
       
      ),
      body: SingleChildScrollView(
       child: Container(
        padding:EdgeInsets.all(14.0),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 14)),
            TextFormField(
              controller: desiredjobroles,
              decoration: InputDecoration(
                labelText: 'Desired job roles',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height:13 ,
            ),
            Column(
              children: [
                TextFormField(
          controller: desiredjobloc,
          decoration: InputDecoration(
            labelText: 'Desired job location',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height:13 ,
            ),
            Column(
              children: [
                TextFormField(
          controller: desiredjobindus,
          decoration: InputDecoration(
            labelText: 'Desired job industry',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height:13 ,
            ),
            
            Column(
              children: [
                TextFormField(
          controller: desiredjobsala,
          decoration: InputDecoration(
            labelText: 'Desired job annual salary',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                ],
            ),
            SizedBox(
              height:13 ,
            ),
            Row(
              children: [
                Text('Desired job type',style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(
              height:10 ,
            ),
            ListTile(
              title: Row(
                children: [
                  Text('No'),
                ],
              ),
              leading: Radio(value: 0, groupValue: _selectedshifttype, onChanged: (value) {
                setState(() {
                  _selectedshifttype = value!;
                });
              }, ),),
              ListTile(
                title: Text('Yes'),
                leading: Radio(value: 1, groupValue: _selectedshifttype, onChanged: (value) {
                  setState(() {
                    _selectedshifttype = value!;
                  });
                },),),
             DropdownButtonFormField<String>(
                value: _selectedJobType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedJobType = newValue;
                  });
                },
                items: jobTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Desired job type',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            SizedBox(
              height:13 ,
            ),
          Column(
              children: [
                TextFormField(
          controller: desiredjobshiftyp,
          decoration: InputDecoration(
            labelText: 'Desired shift type',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height:13 ,
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DesiredJob()));
            }, child: Text('Save')),
            ], ),
            
       ),
       
        ),
    );
  }
}