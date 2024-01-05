import 'dart:convert';

import 'package:posts_application/post.dart';
import 'package:posts_application/user.dart';
import 'package:http/http.dart' as http;

class BlogService {
  List<Post> posts = [];
  List<User> users = [];
  final String _url = "https://jsonplaceholder.typicode.com/";
  int userId = 0;

  Future<void> updatePosts(int aUserId) async {
    userId = aUserId;
    await getPosts();
  }

  Future<void> getPosts() async {
    var url;
    if (userId == 0) {
      url = Uri.parse("$_url/posts");
    } else {
      url = Uri.parse("$_url/users/$userId/posts");
    }

    var response = await http.get(url);

    List<dynamic> data = jsonDecode(response.body);
    posts.clear();
    for (int i = 0; i < data.length; i++) {
      Post post = Post(
          id: data[i]["id"],
          userId: data[i]["userId"],
          title: data[i]["title"],
          body: data[i]["body"]);
      posts.add(post);
    }
  }

  Future<void> getUsers() async {
    var url = Uri.parse("$_url/users");
    var response = await http.get(url);

    List<dynamic> data = jsonDecode(response.body);
    for (int i = 0; i < data.length; i++) {
      User user = User(
          id: data[i]["id"],
          name: data[i]["name"],
          username: data[i]["username"],
          email: data[i]["email"]);
      users.add(user);
    }
  }
}
