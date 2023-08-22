import 'package:careerpoint2/empjobdetail/empjobdetail.dart';
import 'package:careerpoint2/employers/repo/jobreq_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// class Employers extends StatefulWidget {
//   Employers({Key? key}) : super(key: key);

//   @override
//   _EmployersState createState() => _EmployersState();
// }

// class empjobdetail extends StatelessWidget {
//   final String jobTitle;

//   empjobdetail(this.jobTitle);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Please Review'),
//       ),
//     );
//   }
// }

// class _EmployersState extends State<Employers> {
//   TextEditingController jobtitle = TextEditingController();
//   TextEditingController qualification = TextEditingController();
//   TextEditingController jobtype = TextEditingController();
//   TextEditingController joblocation = TextEditingController();
//   TextEditingController monthlysalary = TextEditingController();
//   TextEditingController hiringprocess = TextEditingController();
//   TextEditingController jobdescription = TextEditingController();

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   late CollectionReference _jobRef;
//   late FirebaseStorage _storage;

//   final _formKey = GlobalKey<FormState>();

//   @override
//   List<String> jobTypes = ['Any', 'Full time', 'Part time', 'internship'];
//   String? _selectedJobType;

//   @override
//   void initState() {
//     super.initState();
//     _jobRef = _firestore.collection('add job');
//     _storage = FirebaseStorage.instance;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: Text('Post your Job'),
//           leading: GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: Icon(Icons.arrow_back, color: Colors.white),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
//             child: Form(
//                 key: _formKey,
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'assets/images/careerpoint.png',
//                         height: 150,
//                         width: 150,
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       Text(
//                         'Add Job Basics',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18),
//                       ),
//                       SizedBox(
//                         height: 55,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.name,
//                         controller: jobtitle,
//                         decoration: InputDecoration(
//                           labelText: 'Job Title',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a job title';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 55,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.name,
//                         controller: qualification,
//                         decoration: InputDecoration(
//                           labelText: 'Qualification',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter the qualification';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 55,
//                       ),
//                       DropdownButtonFormField<String>(
//                         value: _selectedJobType,
//                         onChanged: (newValue) {
//                           setState(() {
//                             _selectedJobType = newValue;
//                           });
//                         },
//                         items: jobTypes.map((type) {
//                           return DropdownMenuItem<String>(
//                             value: type,
//                             child: Text(type),
//                           );
//                         }).toList(),
//                         decoration: InputDecoration(
//                           labelText: 'Job type',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please select a job type';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 55,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         controller: joblocation,
//                         decoration: InputDecoration(
//                           labelText: 'Job Location',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter the job location';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 55,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         controller: monthlysalary,
//                         decoration: InputDecoration(
//                           labelText: 'Monthly Salary',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter the monthly salary';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 55,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         controller: hiringprocess,
//                         decoration: InputDecoration(
//                           labelText: 'Hiring Process',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter the hiring process';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 55,
//                       ),
//                       TextFormField(
//                         maxLines: 5,
//                         keyboardType: TextInputType.text,
//                         controller: jobdescription,
//                         decoration: InputDecoration(
//                           labelText: 'Job Description',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter the job description';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 55,
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 50,
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             if (_formKey.currentState!.validate()) {
//                               await _jobRef.add({
//                                 'jobtitle': jobtitle.text,
//                                 'qualification': qualification.text,
//                                 'jobtype': _selectedJobType,
//                                 'joblocation': joblocation.text,
//                                 'monthlysalary': monthlysalary.text,
//                                 'hiringprocess': hiringprocess.text,
//                                 'jobdescription': jobdescription.text,
//                                 'userid': _auth.currentUser!.uid,
//                               });
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                       content: Text('Added Successfully')));
//                               jobtitle.clear();
//                               qualification.clear();
//                               _selectedJobType = null;
//                               joblocation.clear();
//                               monthlysalary.clear();
//                               hiringprocess.clear();
//                               jobdescription.clear();

//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       empjobdetail(jobtitle.text),
//                                 ),
//                               );
//                             }
//                           },
//                           child: Text('Post Job'),
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                           ),
//                         ),
//                       ),

//           ])),
//           ),
//         ));

//   }
// }

class Employers extends StatefulWidget {
  Employers({Key? key}) : super(key: key);

  @override
  _EmployersState createState() => _EmployersState();
}

class empjobdetail extends StatelessWidget {
  final String companyname;
  final String jobTitle;
  final String qualification;
  final String jobType;
  final String jobLocation;
  final String monthlySalary;
  final String hiringProcess;
  final String jobdescription;

  empjobdetail({
    required this.companyname,
    required this.jobTitle,
    required this.qualification,
    required this.jobType,
    required this.jobLocation,
    required this.monthlySalary,
    required this.hiringProcess,
    required this.jobdescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Job Details',
            style: TextStyle(fontSize: 21),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/careerpoint.png',
                  height: 150,
                  width: 150,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Job Title: $jobTitle',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Qualification: $qualification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Job Type: $jobType',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Job Location: $jobLocation',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Monthly Salary: $monthlySalary',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hiring Process: $hiringProcess',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Job Description: $jobdescription',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ));
  }
}

class _EmployersState extends State<Employers> {
  TextEditingController companyname =TextEditingController();
  TextEditingController jobtitle = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController joblocation = TextEditingController();
  TextEditingController jobtype = TextEditingController();
  TextEditingController monthlysalary = TextEditingController();
  TextEditingController hiringprocess = TextEditingController();
  TextEditingController jobdescription = TextEditingController();

  List<String> jobTypes = ['Any', 'Full time', 'Part time', 'internship'];
  String? _selectedJobType;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Post your Job'),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
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
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Add Job Basics',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 55,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: companyname,
                  decoration: InputDecoration(
                    labelText: 'Companyname',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Companyname';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 55,
                ),
                
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: jobtitle,
                  decoration: InputDecoration(
                    labelText: 'Jobtitle',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a job title';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 55,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: qualification,
                  decoration: InputDecoration(
                    labelText: 'Qualification',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the qualification';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 55,
                ),
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
                    labelText: 'Jobtype',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a job type';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 55,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: joblocation,
                  decoration: InputDecoration(
                    labelText: 'Joblocation',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the job location';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 55,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: monthlysalary,
                  decoration: InputDecoration(
                    labelText: 'Monthlysalary',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the monthly salary';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 55,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: hiringprocess,
                  decoration: InputDecoration(
                    labelText: 'Hiringprocess',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the hiring process';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 55,
                ),
                TextFormField(
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  controller: jobdescription,
                  decoration: InputDecoration(
                    labelText: 'Jobdescription',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the job description';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployerJd(
                              companyname:companyname,
                                    jobTitle: jobtitle,
                                    qualification: qualification,
                                    jobType: jobtype,
                                    jobLocation: joblocation,
                                    monthlySalary: monthlysalary,
                                    hiringProcess: hiringprocess,
                                    jobdescription: jobdescription,
                                     )),
                        );
                      }
                    },
                    child: Text('Post Job'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
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
