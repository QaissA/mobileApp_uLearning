import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appColors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/home/controller/home_notifier.dart';

Widget banner({required WidgetRef ref, required PageController controller}) {
  return Column(
    children: [
      SizedBox(
        width: 325.w,
        height: 160.h,
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
          },
          children: [
            bannerContainer(imagePath: ImageRes.banner1),
            bannerContainer(imagePath: ImageRes.banner2),
            bannerContainer(imagePath: ImageRes.banner3),
          ],
        ),
      ),
      //dots
      SizedBox(
        height: 5.h,
      ),
      DotsIndicator(
        position: ref.watch(homeScreenBannerDotsProvider),
        dotsCount: 3,
        decorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(24.0, 8.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    ],
  );
}

Widget bannerContainer({String imagePath = "assets/icons/Art.png"}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5.w),
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill)),
  );
}

Widget userName() {
  return Container(
    child: Text24Normal(
        text: Global.storageService.getUserProfile().name!,
        weight: FontWeight.bold),
  );
}

Widget helloText() {
  return Container(
    child: Text24Normal(
        text: "hello,",
        color: AppColors.primaryThreeElementText,
        weight: FontWeight.bold),
  );
}
