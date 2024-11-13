// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sample/model/post_model.dart';
import 'package:sample/services/data_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 245, 146, 115),
          title: const Text('Posts'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: _buildUI(),
        ),
      ),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: _postList(),
    );
  }

  Widget _postList() {
    return FutureBuilder<Posts>(
      future: DataService().getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Unable to load data."));
        }

        if (!snapshot.hasData || snapshot.data!.posts.isEmpty) {
          return const Center(child: Text("No post found."));
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.posts.length,
          itemBuilder: (context, postIndex) {
            Post post = snapshot.data!.posts[postIndex];

            return ListTile(
              contentPadding: const EdgeInsets.only(top: 20.0),
              isThreeLine: true,
              subtitle: Text(
                post.body,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
              ),
              title: Text(
                post.title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            );
          },
        );
      },
    );
  }
}
