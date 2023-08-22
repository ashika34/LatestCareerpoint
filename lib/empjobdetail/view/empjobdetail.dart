import 'package:careerpoint2/empjobdetail/repo/empjobdetailrepo.dart';
import 'package:careerpoint2/employers/employers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class EmployerJd extends StatelessWidget {
  final TextEditingController companyname;
  final TextEditingController jobTitle;
  final TextEditingController qualification;
  final TextEditingController jobType;
  final TextEditingController jobLocation;
  final TextEditingController monthlySalary;
  final TextEditingController hiringProcess;
  final TextEditingController jobdescription;

 EmployerJd({
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
          'Please Review',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                height: 28,
              ),
              ListTile(
                title: Text('Companyname'),
                subtitle: Text(companyname.text),
                trailing: IconButton(onPressed: () {
                  showDialog(context: context,
                   builder: (BuildContext context)
                  {
                    return AlertDialog(
                      title: Text('Edit'),
                      content: Column(
                      children: [
                        TextField(
                          controller: companyname,
                          decoration: InputDecoration(
                            hintText: 'companyname',
                          ),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        ElevatedButton(onPressed: () {
                          
                        }, child: Text('Done')),
                      ],
                      ),
                    );
                  });
                },  icon: Icon(Icons.edit), ), ),
              
              SizedBox(
                height: 20,
              ),

              ListTile(
                title: Text('Job Title'),
                subtitle: Text(jobTitle.text),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Edit'),
                            content: Column(
                              children: [
                                TextField(
                                  controller: jobTitle,
                                  decoration: InputDecoration(
                                    hintText: 'jobtitle',
                                  ),
                                ),
                                SizedBox(
                                  height: 23,
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Text('Done')),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit)),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text('Qualification'),
                subtitle: Text(qualification.text),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Edit'),
                            content: Column(
                              children: [
                                TextField(
                                  controller: qualification,
                                  decoration: InputDecoration(
                                    hintText: 'Qualification',
                                  ),
                                ),
                                SizedBox(
                                  height: 23,
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Text('Done'))
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit)),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text('Job Type'),
                subtitle: Text(jobType.text),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Edit'),
                            content: Column(
                              children: [
                                TextField(
                                  controller: jobType,
                                  decoration: InputDecoration(
                                    hintText: 'jobtype',
                                  ),
                                ),
                                SizedBox(
                                  height: 23,
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Text('Done')),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit)),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text('Joblocation'),
                subtitle: Text(qualification.text),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Edit'),
                            content: Column(
                              children: [
                                TextField(
                                  controller: jobLocation,
                                  decoration: InputDecoration(
                                    hintText: 'joblocation',
                                  ),
                                ),
                                SizedBox(
                                  height: 23,
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Text('Done'))
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit)),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text('Monthlysalary'),
                subtitle: Text(monthlySalary.text),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Edit'),
                            content: Column(
                              children: [
                                TextField(
                                  controller: monthlySalary,
                                  decoration: InputDecoration(
                                    hintText: 'monthlysalary',
                                  ),
                                ),
                                SizedBox(
                                  height: 23,
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Text('Done')),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit)),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text('Hiringprocess'),
                subtitle: Text(hiringProcess.text),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Edit'),
                            content: Column(
                              children: [
                                TextField(
                                  controller: hiringProcess,
                                  decoration: InputDecoration(
                                    hintText: 'hiringprocess',
                                  ),
                                ),
                                SizedBox(
                                  height: 23,
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Text('Done')),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit)),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text('Job Description'),
                subtitle: Text(jobdescription.text),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Edit'),
                            content: Column(
                              children: [
                                TextField(
                                  controller: jobdescription,
                                  decoration: InputDecoration(
                                    hintText: 'jobdescription',
                                  ),
                                ),
                                SizedBox(
                                  height: 23,
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Text('Done')),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(onPressed: () async{
                 await JobRepo().addJob(
                 companyname.text,
                 jobTitle.text,
                 qualification.text,
                 jobType.text,
                 jobLocation.text,
                 monthlySalary.text,
                 hiringProcess.text,
                jobdescription.text,
                context, 
                  );
                 ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Added successfully')),);
                  companyname.clear();
                 jobTitle.clear();
                 qualification.clear();
                 jobType.clear();
                 jobLocation.clear();
                 monthlySalary.clear();
                 hiringProcess.clear();
                 jobdescription.clear();
                 }, 
                 child: Text('Confirm'),
                 style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )
                 )
                 ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
