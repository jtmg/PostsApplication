import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:posts_application/blog_service.dart';

class Loading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    setupBlogService();
  }

  void setupBlogService() async {
    BlogService bs = BlogService();

    await bs.getPosts();
    await bs.getUsers();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, "/Blog",
          arguments: {"blogservice": bs});
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitRipple(
          color: Colors.lime,
          size: 200,
        ),
      ),
    );
  }
}
