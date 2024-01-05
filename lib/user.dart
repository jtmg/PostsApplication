// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class User {
  int id;
  String name;
  String username;
  String email;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  static Card getAllUsersCard({required Function() update}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: update,
          title: const Text(
            "All Users",
            style: TextStyle(
                fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          leading: const Icon(Icons.people),
        ),
      ),
    );
  }

  Card toCard({required Function() update}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: update,
          title: Text(
            "$name ($email)",
            style: const TextStyle(
                fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          leading: const Icon(Icons.person),
        ),
      ),
    );
  }
}
