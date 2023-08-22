
import 'package:careerpoint2/firstscreen/firstscreen.dart';
import 'package:careerpoint2/firstscreen/view/aboutus.dart';
import 'package:flutter/material.dart';


class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('FAQ'),
        leadingWidth: 80,
leading: Builder(
          builder: (BuildContext context) {
            return Row(
              children: [

                GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ],
            );
          },
        ),
),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              ''' * Does it cost anything to me?
              Candidate registration on Shine.com is free of cost.
                  * Do I need a valid email id for registration?
              Yes, you need a valid email id to register on Shine.com. The same email id will be used to communicate with you in the future. We value your privacy, and we hate spam as much as you do. We are not going to spam or sell your email address to any third party. We still need your email account to be able to provide you with your Job related information or for any other career related notifications you may choose.
                  * What is Career Info Section?
              Career Info section aims at providing the relevant industry and company information, updated industry and company specific news, featured articles by industry and in house experts. This will provide a job-seeker with enough information about an Industry/ Company/ Job role to be able to take career related decisions like whether to apply for a job in a certain industry/ company, to accept an offer, etc.
                  * What is Shine Learning section?
              This section aims at providing a candidate with information and advice to build a career within his/her own company in a specific function/area of expertise. This section involves features by experts (respected in Industry/Academic credentials) about various aspects of career building.To access this section click on the Shine Learning section in the top navigation.
                  * Can I apply again for the same job posting?
              No, if you have already applied to a job posting, you can not apply for the same again.
                  * How do I access Home?
              Log in to your account by clicking on the log in link at the right hand side of the header of the homepage. Once you have logged in, click on the "Home "section.''',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
