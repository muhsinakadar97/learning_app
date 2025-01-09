import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learningapp/src/presentation/screens/home/widgets/plist.dart';

import '../../../config/theme/colors.dart';
import '../../controllers/home_controller.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/featured_courses_header.dart';
import 'widgets/featured_courses_list.dart';
import 'widgets/purchased_courses_header.dart';
import 'widgets/sliver_appbar_widget.dart';
import 'widgets/user_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return WillPopScope(
      onWillPop: () => homeController.onWillPop(context),
      child: const SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: AppColors.whiteColor,
          body: Stack(
            children: [
              Column(
                children: [
                  CustomAppbar(),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverAppbarWidget(),
                        // SliverToBoxAdapter(child: PurchasedCoursesHeader()),
                        SliverToBoxAdapter(
                          child: PurchasedCoursesHeader(),
                        ),
                        // Wrap the Plist widget in a SliverToBoxAdapter
                        SliverToBoxAdapter(
                          child: Plist(),
                        ),
                        SliverToBoxAdapter(
                          child: FeaturedCoursesHeader(),
                        ),
                        FeaturedCoursesList(),
                      ],
                    ),
                  ),
                ],
              ),
              UserWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
