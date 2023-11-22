import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appColors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/home/controller/home_notifier.dart';

class BannerHome extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const BannerHome({super.key, required this.controller, required this.ref});

  @override
  Widget build(BuildContext context) {
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

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text24Normal(
          text: Global.storageService.getUserProfile().name!,
          weight: FontWeight.bold),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text24Normal(
          text: "hello,",
          color: AppColors.primaryThreeElementText,
          weight: FontWeight.bold),
    );
  }
}

AppBar homeAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(width: 18.w, height: 18.w, imagePath: ImageRes.menu),
          GestureDetector(child: const AppBoxDecorationImage())
        ],
      ),
    ),
  );
}

class MenuBarHome extends StatelessWidget {
  const MenuBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text16Normal(
                text: "Choose your course",
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: const Text12Normal(
                  text: "See all",
                  color: AppColors.primarySecondaryElementText,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                decoration: appBoxShadow(BrRaduis: 5),
                child: const Text12Normal(
                  text: "All",
                  color: AppColors.primaryBackground,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15.w),
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                decoration: appBoxShadow(
                    color: AppColors.primaryBackground, BrRaduis: 5),
                child: const Text12Normal(
                  text: "popular",
                  color: AppColors.primarySecondaryElementText,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15.w),
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                decoration: appBoxShadow(
                    color: AppColors.primaryBackground, BrRaduis: 5),
                child: const Text12Normal(
                  text: "News",
                  color: AppColors.primarySecondaryElementText,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  const CourseItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40
              ),
          itemCount: 6,
          itemBuilder: (_, int index) {
            return appImage();
          }),
    );
  }
}
