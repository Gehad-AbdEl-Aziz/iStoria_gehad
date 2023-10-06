import 'package:flutter/material.dart';
import 'package:task/utils/AppColors.dart';
import 'package:task/utils/Style.dart';
import 'package:task/utils/padding.dart';

class PostItemView extends StatelessWidget {
  final String title;
  final String body;
  const PostItemView({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grayDarkColor.withOpacity(.35),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: AppStyle.titleText,
        ),
        subtitle: Text(
          body,
          style: AppStyle.cardText,
        ),
      ),
    ).addPaddingHorizontalVertical(
      vertical: 8,
      horizontal: 16,
    );
  }
}
