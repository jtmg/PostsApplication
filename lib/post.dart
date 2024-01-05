// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Post {
  int id;
  int userId;
  String title;
  String body;
  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  Card toCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              body,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
