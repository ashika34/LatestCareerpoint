import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchJobs extends StatefulWidget {
  @override
  State<SearchJobs> createState() => _SearchJobsState();
}

class _SearchJobsState extends State<SearchJobs> {
  TextEditingController jobTitle = TextEditingController();
  TextEditingController location = TextEditingController();
  List<DocumentSnapshot> jobResults = [];

  Future<void> _searchJobs() async {
    final title = jobTitle.text.trim();
    final loc = location.text.trim();

    if (title.isNotEmpty && loc.isNotEmpty) {
      final results = await searchJobs(title, loc);
      setState(() {
        jobResults = results;
      });
    }
  }

  Future<List<DocumentSnapshot>> searchJobs(String jobTitle, String location) async {
    final CollectionReference jobsCollection =
        FirebaseFirestore.instance.collection('jobcollection');

    QuerySnapshot querySnapshot = await jobsCollection
        .where('job title', isEqualTo: jobTitle)
        .where('joblocation', isEqualTo: location)
        .get();

    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Jobs'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: jobTitle,
              decoration: InputDecoration(
                labelText: 'Job Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: location,
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchJobs,
              child: Text('Search Jobs'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: jobResults.length,
                itemBuilder: (context, index) {
                  var job = jobResults[index].data() as Map<String, dynamic>?;

                  if (job != null) {
                    final companyName = job['companyname'] as String?;
                    final qualification = job['qualification'] as String?;
                    final jobDescription = job['jobdescription'] as String?;
                    final jobType = job['jobtype'] as String?;

                    final defaultCompanyName = 'Company Name Not Available';
                    final defaultQualification = 'Qualification Not Available';
                    final defaultJobDescription = 'Job Description Not Available';
                    final defaultJobType = 'Job Type Not Available';

                    return Card(
                      child: ListTile(
                        title: Text(companyName ?? defaultCompanyName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(qualification ?? defaultQualification),
                            Text(jobDescription ?? defaultJobDescription),
                            Text(jobType ?? defaultJobType),
                            // Add more fields as needed
                          ],
                        ),
                      ),
                    );
                  } else {
                    return ListTile(
                      title: Text('Data not available'),
                      // You can provide a default message or handle this case as needed
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}




