import 'package:flutter/material.dart';
import 'package:task/utils/AppColors.dart';
import 'package:task/utils/padding.dart';

import '../utils/Style.dart';

class UserItemView extends StatelessWidget {
  final String userName;
  final String userProfileImg;
  final String postsNumber;
  final Function() onUserTapped;
  const UserItemView({
    Key? key,
    required this.userName,
    required this.onUserTapped,
    required this.postsNumber,
    required this.userProfileImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grayDarkColor.withOpacity(.35),
          ),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: onUserTapped,
        contentPadding: EdgeInsets.zero,
        title: Text(
          userName,
          style: AppStyle.titleText.copyWith(fontSize: 18),
        ),
        trailing: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: AppColors.grayLiteColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_forward,
              size: 15,
              color: AppColors.whiteColor,
            )),
        subtitle: Text(
          '$postsNumber Post',
          style: AppStyle.cardText,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(userProfileImg),
        ),
      ),
    ).addPaddingHorizontalVertical(vertical: 5, horizontal: 16);
  }
}
