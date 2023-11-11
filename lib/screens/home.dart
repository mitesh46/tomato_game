// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Tomato Math Game',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Map<String, dynamic>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final data = snapshot.data!;
                  final question = data['question'];
                  final solution = data['solution'];

                  return Column(
                    children: <Widget>[
                      Image.network(question),
                      Text('Solution: $solution'),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('Game ID: 12345'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/profile_picture.png'), // Replace with your image
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.black, // Set the icon color to black
            ),
            title: Text('Settings'),
            onTap: () {
              // Handle Settings action
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.black, // Set the icon color to black
            ),
            title: Text('Logout'),
            onTap: () {
              // Handle Logout action
            },
          ),
        ],
      ),
    );
  }
}

Future<Map<String, dynamic>> fetchData() async {
  final response = await http.get(
    Uri.parse("http://marcconrad.com/uob/tomato/api.php?out=json&base64=no"),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}
