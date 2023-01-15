

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../utils/network_image_strings.dart';
import '../components/Headingwidget.dart';
import '../components/ListTileWidget.dart';
import '../components/side_menu.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.loadGitDetailsData();
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, right: 16, bottom: 5),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(NetworkImageStrings.userImage),
            ),
          )
        ],
      ),
      drawer: const SideMenu(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child:  HeadingWidget(
                totalCount:
                    controller.getGitRepositories.value.totalCount.toString()),
          ),
          gitRepositoryListView()
        ],
      ),
    );
  }

  Container gitRepositoryListView() {
    return Container(
      height: 550.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: GridView.builder(
          itemCount: controller.getGitRepositories.value.items?.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 16 / 4, crossAxisCount: 1, mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return ListTileWidget(
              imgUrl: controller
                  .getGitRepositories.value.items![index].owner?.avatarUrl,
              repositoryName:
                  controller.getGitRepositories.value.items![index].name!,
              stargazersCount: controller
                  .getGitRepositories.value.items![index].stargazersCount
                  .toString(),
              ownersName: controller
                  .getGitRepositories.value.items![index].owner?.login,
              watchers: controller
                  .getGitRepositories.value.items![index].watchersCount
                  .toString(),
            );
          }),
    );
  }
}
