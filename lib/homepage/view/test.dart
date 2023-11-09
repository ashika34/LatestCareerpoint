// class FavoriteList extends StatefulWidget {
//   @override
//   _FavoriteListState createState() => _FavoriteListState();
// }

// class _FavoriteListState extends State<FavoriteList> {
//   List<JobDetailsCard> favoriteJobDetailsCards = [];

//   @override
//   void initState() {
//     super.initState();
//     // Get the list of favorite job details cards from the Realtime Database.
//     FirebaseFirestore.instance
//         .collection('favorites')
//         .snapshots()
//         .listen((snapshot) {
//       setState(() {
//         favoriteJobDetailsCards = snapshot.docs.map((doc) {
//           return JobDetailsCard.fromJson(doc.data());
//         }).toList();
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: favoriteJobDetailsCards.map((card) {
//         return ListTile(
//           leading: Icon(Icons.favorite),
//           title: Text(card.title),
//           onTap: () {
//             // Toggle the favorite status of the job details card.
//             setState(() {
//               card.isFavorite = !card.isFavorite;
//             });
//             // Save the changes to the favorite status in the Realtime Database.
//             FirebaseFirestore.instance
//                 .collection('favorites')
//                 .doc(card.id)
//                 .update({'isFavorite': card.isFavorite});
//           },
// //         );
// //       }).toList(),
// //     );
// //   }
// // }







// class FavoritePage extends StatelessWidget {
//   final List<JobDetailsCard> favoriteJobDetailsCards;

//   FavoritePage({Key? key, required this.favoriteJobDetailsCards}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Jobs'),
//       ),
//       body: ListView(
//         children: favoriteJobDetailsCards.map((card) {
//           return ListTile(
//             leading: Icon(Icons.favorite),
//             title: Text(card.title),
//             subtitle: Text(card.description),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
