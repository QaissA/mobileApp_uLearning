import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/appColors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

AppBar buildAppbar({String title="title"}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        height: 1,
      ),
    ),
    centerTitle: true,
    title: Text16Normal(text: title, color: AppColors.primaryText),
  );
}