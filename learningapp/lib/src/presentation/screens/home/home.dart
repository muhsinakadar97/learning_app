import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/featured_courses_header.dart';
import 'widgets/featured_courses_list.dart';
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
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                children: [
                  CustomAppbar(),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverAppbarWidget(),
                        // SliverToBoxAdapter(
                        //   child: PurchasedCoursesWidget(),
                        // ),
                        SliverToBoxAdapter(
                          child: FeaturedCoursesHeader(),
                        ),
                        FeaturedCoursesList()
                      ],
                    ),
                  ),
                ],
              ),
              UserWidget()
            ],
          ),
        ),
      ),
    );
  }
}
