
import 'package:careerpoint2/personal/personal.dart';
import 'package:careerpoint2/searchjobs/search.dart';
import 'package:flutter/material.dart';

class WorkSum extends StatefulWidget {
  const WorkSum({super.key});

  @override
  State<WorkSum> createState() => _WorkSumState();
}
class _WorkSumState extends State<WorkSum> {
  TextEditingController profiletitle = TextEditingController();
  TextEditingController profilesummary = TextEditingController();
  TextEditingController annualsalary = TextEditingController();
  TextEditingController totalexp = TextEditingController();
  TextEditingController largestteamhandled = TextEditingController();
  TextEditingController noticeperiod= TextEditingController();
  List<String> jobTypes = ['Team size handled','0', '1', '2+','5+','10+','20+','50+','100+','200+','500+','1000+']; 
  String? _largestTeamhandled;
  List<String> noticePeriod = ['Select Notice period','15 days','1 month','2 months','2 months +','Serving Notice Period'];
  String? _noticePeriod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: Row(
          children: [
          Text('Work Summary',style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
          Spacer(),
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchJobs(),));

            }, icon: Icon(Icons.search)),
            Spacer(),
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => WorkSum(), ));
            
            }, icon: Icon(Icons.favorite)),
          ],
        ),

       leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back),
       ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
               padding: EdgeInsets.all(14.0),
               child: Column(
                 children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 14.0)),
                   TextFormField(
                    controller: profiletitle,
                    decoration: InputDecoration(
                      labelText: 'Profile Title',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        )
                      )
                    ),
                   ),
                 ],
               ),
               ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextFormField(
                controller: profilesummary,
                decoration: InputDecoration(
                  labelText:'Profile summary',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    )
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextFormField(
                controller:annualsalary,
                decoration: InputDecoration(
                  labelText: 'Annual Salary',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    )
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextFormField(
                controller:totalexp,
                decoration: InputDecoration(
                  labelText: 'Total Experience',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    )
                  )
                ),
              ),
            ),
          
            DropdownButtonFormField<String>(
              padding: const EdgeInsets.all(14.0),
                value: _largestTeamhandled,
                onChanged: (newValue) {
                  setState(() {
                    _largestTeamhandled = newValue;
                  });
                },
                items: jobTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Largest team handled',
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
            DropdownButtonFormField<String>(
              padding: const EdgeInsets.all(14.0),
                value: _noticePeriod,
                onChanged: (newValue) {
                  setState(() {
                    _noticePeriod = newValue;
                  });
                },
                items: noticePeriod.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Notice period',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
          
            SizedBox(
              height: 19),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalDetails(),));
              }, child: Text('Save',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white)
              ),
              style:ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              )
              )
              ),
              ],
             ),
         ),);
}
}