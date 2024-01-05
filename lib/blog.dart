import 'package:flutter/material.dart';
import 'package:posts_application/blog_service.dart';

class Blog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      data = ModalRoute.of(context)!.settings.arguments as Map;
    }

    BlogService bs = data["blogservice"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("O Meu Blog"),
        centerTitle: true,
        backgroundColor: Colors.lime[200],
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              dynamic result = Navigator.pushNamed(context, "/SetUser",
                  arguments: {"blogservice": bs});

              setState(() {
                data = result;
              });
            },
            child: const Text("Set User"),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: bs.posts.length,
            itemBuilder: (context, index) {
              return bs.posts[index].toCard();
            },
          ))
        ],
      ),
    );
  }
}
