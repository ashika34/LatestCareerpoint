
import 'package:careerpoint2/firstscreen/firstscreen.dart';
import 'package:careerpoint2/profile/profile.dart';
import 'package:careerpoint2/searchjobs/search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../favorite/favorite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController jobtitle = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Careerpoint'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: Icon(Icons.favorite),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(),
              ),
              child: TextField(
                controller: jobtitle,
                decoration: InputDecoration(
                  labelText: 'Jobtitle',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchJobs()),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CarouselWithControls(),
            SizedBox(
              height: 15,
            ),
   StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('jobcollection').snapshots(),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return Center(
        child: Text('Error: ${snapshot.error}'),
      );
    }
    if (!snapshot.hasData) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
   final jobDocs = snapshot.data!.docs as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
   return Expanded(
      child: ListView.builder(
        itemCount: jobDocs.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> jobData = jobDocs[index].data();
          return MyCard(job: jobData); 
        },
      ),
    );
  },
),],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
     color: Color(0xFF13B9FF),
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 9),
          unselectedLabelStyle: TextStyle(fontSize: 11),
          tabs: [
            Tab(
              icon: IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                icon: Icon(Icons.home),
              ),
              text: 'home',
            ),
            SizedBox(
              width: 9,
            ),
            Tab(
              icon: IconButton(
                 color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Favorite()),
                  );
                },
                icon: Icon(Icons.favorite),
              ),
              text: 'Favorite',
            ),
            SizedBox(
              width: 9,
            ),
            Tab(
              icon: IconButton(
                 color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchJobs()),
                  );
                },
                icon: Icon(Icons.search),
              ),
              text: 'Search',
            ),
            SizedBox(
              width: 9,
            ),
            Tab(
              icon: IconButton(
                 color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                icon: Icon(Icons.person),
              ),
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}


