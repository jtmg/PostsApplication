import 'dart:js';

import 'package:flutter/material.dart';
import 'package:posts_application/blog.dart';
import 'package:posts_application/loading.dart';
import 'package:posts_application/set_user.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Loading(),
      "/Blog": (context) => Blog(),
      "/SetUser": (context) => SetUser()
    },
  ));
}
