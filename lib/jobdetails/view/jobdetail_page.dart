import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JobDetail extends StatefulWidget {
  const JobDetail({Key? key}) : super(key: key);

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  final CollectionReference applicationsCollection =
      FirebaseFirestore.instance.collection('applications');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'Senior Flutter Developer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'Camerinfolks Pvt Ltd',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 4.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Icon(Icons.work_history),
                    Text(
                      '3 to 8 Yrs',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              children: [
                Text(
                  'Job Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Column(
              children: [
                Text(
                  'As a Flutter Developer, you will be in charge of reviewing the software specifications and UI mockups, developing a cross-browser mobile application from scratch, and leading the application testing effort. You will work alongside a backend developer, as well as a UI designer to ensure you create high-performing application with a a smooth user experience.',
                ),
                SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Roles and Responsibilities',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    '* Designing, developing, testing, maintaining, and deploying software in the Flutter framework and Dart language.',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    '* Developing user interface components and implementing them by following well-known Flutter / Dart workflows and practices.',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    '(* Communicating with product and engineering leads to implement business and project objectives.',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    '* Code review of team members commits as part of CI/CD cycle.',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    '* Participate in testing, quality assurance and bug fixes as part of the CI/CD cycle.',
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            ' Qualifications and Requirements',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      Text(
                        '* 2 to 5 years of experience developing mobile apps natively in iOS and/or Android.',
                      ),
                      Text(
                        '* 2 years of commercial experience developing and delivering Flutter based apps.',
                      ),
                      Text(
                        '* Good understanding of state management, Flutter flavors and app architecture.',
                      ),
                      Text(
                        '* Strong communications and consultative skills. Self-initiated and proactive.',
                      ),
                      Text(
                        '* Experience with building apps and software for consumer goods is a bonus.',
                      ),
                      Text(
                        '* Degree in software engineering, computer science, or software development is a plus.',
                      ),
                      SizedBox(
                         height: 17,
                      ),
                      Row(
                        children: [
                          Text('Skills',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Row(
                        children: [
                          Text('* Dart'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('* Flutter'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('* Android'),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text('* iOS'),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('* Git'),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
  onPressed: ()async{
    String userId = 'your_user_id_here';
    await applicationsCollection.add(({
      'userId': userId,
      'jobTitle': 'Senior Flutter Developer',
      'timestamp': FieldValue.serverTimestamp(),

    }));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Application Submitted')));

  },
  child: Text('Apply Now'),
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    fixedSize: Size(310, 45), 
  ),
)

          ],
        ),
        
      ),    );
  }
}