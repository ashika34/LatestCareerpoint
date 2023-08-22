import 'package:flutter/material.dart';

class empDetails extends StatefulWidget {
  const empDetails({super.key});

  @override
  State<empDetails> createState() => _empDetailsState();
}

class _empDetailsState extends State<empDetails> {
  TextEditingController jobtitle=TextEditingController();
  TextEditingController companyname = TextEditingController();
  TextEditingController industry = TextEditingController();
  TextEditingController exp = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Employment Details',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
       
      ),
      body:SingleChildScrollView( 
        child:Container(
      child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 14.0)),
              TextFormField(
                controller: jobtitle,
                decoration:InputDecoration(
                  labelText: 'Job title',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    )
                  )
                  )
                   ),
                   SizedBox(height: 13),
                   Column(
                     children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 14.0)),
                       TextFormField(
                        controller: companyname,
                        decoration: InputDecoration(
                          labelText: 'Company name',
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
                          Padding(padding: EdgeInsets.symmetric(horizontal: 14.0)),
                           TextFormField(
                            controller: industry,
                            decoration: InputDecoration(
                              labelText: 'Desired job industry',
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black,
                               )
                              ),
                            ),
                           ),
                           SizedBox(height: 13),
                           Column(
                             children: [
                               TextFormField(
                                controller: industry,
                                decoration: InputDecoration(
                                  labelText: 'Experience',
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                   )
                                  ),
                                ),
                               ),
                               SizedBox(
                                height: 13,
                               ),
                                ElevatedButton(onPressed: () {
                                  }, child: Text('Save',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),
                               ),
                               style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                )
                               ),
                               ),
                             ],
                           ),
                            ],
                       )
                     ],
                   ),])))));
 }
}