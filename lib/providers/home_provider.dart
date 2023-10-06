import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/models/post_model.dart';
import 'package:task/models/user_model.dart';
import 'package:task/services/web_service.dart';

class HomePageProvider extends ChangeNotifier {
  final List<Post> _postsList = [];
  List<Post> get postsList => _postsList;
  set postsList(List<Post> postsList) {
    _postsList.addAll(postsList);
    notifyListeners();
  }

  final List<User> _usersList = [];
  List<User> get usersList => _usersList;
  set usersList(List<User> usersList) {
    _usersList.addAll(usersList);
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> getUserAndPosts() async {
    isLoading = true;
    Response response = await DioHelper.getData(
      url: '/SharminSirajudeen/test_resources/db',
    );

    isLoading = false;

    if (response.statusCode == HttpStatus.ok) {
      final List<Post> posts = (response.data['posts'] as List)
          .map((postJson) => Post.fromJson(postJson))
          .toList();

      postsList.addAll(posts);
      final List<User> users = (response.data['users'] as List)
          .map((userJson) => User.fromJson(userJson))
          .toList();

      usersList.addAll(users);
    } else {}
  }

  int countPostsByUser(int userId) {
    return postsList.where((post) => post.userId == userId).length;
  }

  List<Post> getPostsByUser(int userId) {
    return postsList.where((post) => post.userId == userId).toList();
  }
}
