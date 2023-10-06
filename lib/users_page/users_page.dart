import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/posts_page/posts_page.dart';

import 'package:task/providers/home_provider.dart';
import 'package:task/utils/AppColors.dart';
import 'package:task/utils/Style.dart';

import '../componant/user_item_view.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomePageProvider>().getUserAndPosts();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Users',
          style: AppStyle.appbarText,
        ),
        centerTitle: true,
      ),
      body: Consumer<HomePageProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }

          if (provider.usersList.isEmpty) {
            return const Center(
              child: Text('لا توجد مستخدمين'),
            );
          }
          return ListView.builder(
            itemCount: provider.usersList.length,
            itemBuilder: (context, index) {
              final user = provider.usersList.elementAt(index);
              return UserItemView(
                userName: user.name,
                postsNumber: provider.countPostsByUser(user.userId).toString(),
                userProfileImg: user.thumbnailUrl,
                onUserTapped: () {
                  FirebaseAnalytics.instance.logEvent(
                    name: 'user_clicked',
                    parameters: <String, dynamic>{
                      'user_name': user.name,
                    },
                  ).then((value) {
                    print('event log success');
                  });
                  return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostsPage(user: user),
                  ),
                );
                },
              );
            },
          );
        },
      ),
    );
  }
}
