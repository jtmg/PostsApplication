import 'package:flutter/material.dart';
import 'package:posts_application/blog_service.dart';
import 'package:posts_application/user.dart';

class SetUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SetUserState();
}

class _SetUserState extends State<SetUser> {
  Map data = {};

  Future<void> updateUserId(BlogService bs, aUserId) async {
    await bs.updatePosts(aUserId);
    Navigator.pop(context, {"blogservice": bs});
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;

    BlogService bs = data["blogservice"];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set User"),
        centerTitle: true,
        backgroundColor: Colors.lime[200],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: bs.users.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return User.getAllUsersCard(update: () {
                        updateUserId(bs, 0);
                      });
                    } else {
                      return bs.users[index - 1].toCard(update: () {
                        updateUserId(bs, bs.users[index - 1].id);
                      });
                    }
                  }))
        ],
      ),
    );
  }
}
