import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/componant/post_item_view.dart';
import 'package:task/models/user_model.dart';
import 'package:task/providers/home_provider.dart';

import '../utils/AppColors.dart';

class PostsPage extends StatefulWidget {
  final User user;
  const PostsPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    final posts =
        context.read<HomePageProvider>().getPostsByUser(widget.user.userId);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.network(
                  widget.user.url,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts.elementAt(index);
                return PostItemView(
                  title: post.title,
                  body: post.body,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
