// // filepath: d:\Study\MAD\LAB\project\ahaar_project\lib\view\firebase\firebase_data_screen.dart
// import 'package:ahaar_project/common_widget/view_all_title_row.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirebaseDataScreen extends StatelessWidget {
//   const FirebaseDataScreen({super.key});

//   Future<List<Map<String, dynamic>>> fetchData() async {
//     try {
//       final snapshot = await FirebaseFirestore.instance.collection('items').get();
//       return snapshot.docs.map((doc) => doc.data()).toList();
//     } catch (e) {
//       print("Error fetching data: $e");
//       return [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Firebase Data")),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: fetchData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("No data available"));
//           } else {
//             final data = snapshot.data!;
//             return ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 final item = data[index];
//                 return ListTile(
//                   title: Text(item['name'] ?? 'Unnamed Item'),
//                   subtitle: Text(item['description'] ?? 'No description'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class ExampleScreen extends StatelessWidget {
//   const ExampleScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Example Screen")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ViewAllTitleRow(
//               title: "Recent Items",
//               onView: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const FirebaseDataScreen()),
//                 );
//               },
//             ),
//             // Add other widgets here
//           ],
//         ),
//       ),
//     );
//   }
// }