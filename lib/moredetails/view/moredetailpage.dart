import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import '../repo/moredetailsrepo.dart';

class MoreDetailPage extends StatefulWidget {
  const MoreDetailPage({super.key});

  @override
  State<MoreDetailPage> createState() => MoreDetailPageState();
}

class MoreDetailPageState extends State<MoreDetailPage> {

  final TextEditingController dob = TextEditingController();
  final TextEditingController institutename = TextEditingController();
  final TextEditingController passoutyear = TextEditingController();
  final TextEditingController jobtype = TextEditingController();
  final TextEditingController skills = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();

  List<String> jobTypes = ['Any', 'Full time', 'Part time', 'internship'];
  String? _selectedJobType;

  List<PlatformFile> pdfFiles = [];
  Future<void> pickPDF() async {
    final pickedPDFs = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    setState(() {
      pdfFiles = pickedPDFs?.files ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personaldetails'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child:Form(
           key: _formKey,
          child:Column(
          children: [
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                              if(value!.isEmpty){
                                return "Please fill this field";
                              }
                            },
                      controller: dob,
                      decoration: InputDecoration(
                        labelText: 'DOB',
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
                      validator: (value) {
                              if(value!.isEmpty){
                                return "Please fill this field";
                              }
                            },
                      controller: institutename,
                      decoration: InputDecoration(
                        labelText: 'Institute Name',
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
                      validator: (value) {
                              if(value!.isEmpty){
                                return "Please fill this field";
                              }
                            },
                      controller: passoutyear,
                      decoration: InputDecoration(
                        labelText: 'PassoutYear',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 13),
                    DropdownButtonFormField<String>(
                      validator: (value) {
                              if(value!.isEmpty){
                                return "Please fill this field";
                              }
                            },
                      value: _selectedJobType,
                      decoration: InputDecoration(
                        labelText: 'Job Type',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedJobType = newValue!;
                        });
                      },
                      items: jobTypes
                          .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 13),
                    TextFormField(
                      validator: (value) {
                              if(value!.isEmpty){
                                return "Please fill this field";
                              }
                            },
                      controller: skills,
                      decoration: InputDecoration(
                        labelText: 'Skills',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 13),
                    ElevatedButton(
                      onPressed: () {
                        pickPDF();
                      },
                      child: Text('Upload Resume'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                    if(_formKey.currentState!.validate())
                  await PersonalRepo().addPersonal(
                    dob.text,
                    institutename.text,
                    passoutyear.text,
                    _selectedJobType ?? 'Any',
                    skills.text,
                    pdfFiles,
                    context,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Updated Successfully')),
                  );
                  dob.clear();
                  institutename.clear();
                  passoutyear.clear();
                  jobtype.clear();
                  skills.clear();
                },
                child: Text('Save'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
