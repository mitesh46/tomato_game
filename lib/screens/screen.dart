// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class HomeScreen extends StatelessWidget {
//   List<dynamic> users = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Rest API Call')),
//       ),
//       body: ListView.builder(
//           itemCount: users.length,
//           itemBuilder: (context, index) {
//             final user = users[index];
//             final question = user['question'];
//             return ListTile(
//               title: Text(question),
//             );
//           }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: fetchUsers,
//       ),
//     );
//   }

//   void fetchUsers() async {
//     print('fetchUsers called');
//     const url = 'https://marcconrad.com/uob/tomato/api.php?out=json';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     final body = response.body;
//     final json = jsonDecode(body);
//     SetState(
//       () {
//         users = json['results'];
//       },
//     );
//     print('fetchUsers completed');
//   }
// }

// void SetState(Null Function() param0) {}
