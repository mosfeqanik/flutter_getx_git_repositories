import 'package:flutter/material.dart';
import 'package:flutter_getx_git_repositories/app/modules/home/views/repo_detail_view.dart';
import 'package:flutter_getx_git_repositories/app/utils/AllStrings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../components/Headingwidget.dart';
import '../components/ListTileWidget.dart';
import '../components/side_menu.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());

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
        ],
      ),
      drawer: const SideMenu(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: HeadingWidget(
                totalCount:
                    controller.getGitRepositories.value.totalCount.toString()),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.sortByDate();
                    },
                    child: const Text(AllStrings.SortbyDate)),
                ElevatedButton(
                    onPressed: () {
                      controller.sortByStar();
                    },
                    child: const Text(AllStrings.SortbyStar))
              ],
            ),
          ),
          listViewContainer(),
        ],
      ),
    );
  }

  Container listViewContainer() {
    return Container(
      height: 500.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Obx(() {
        return ListView.builder(
            itemCount: controller.ExampleitemsListsLength.value,
            controller: controller.scrollController,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index < controller.ExampleitemsListsLength.value) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => RepoDetailView(
                          items: controller.itemsList[index],
                        ));
                  },
                  child: Obx(() => ListTileWidget(
                        imgUrl: controller.itemsList[index].owner?.avatarUrl,
                        repositoryName: controller.itemsList[index].name!,
                        stargazersCount: controller
                            .itemsList[index].stargazersCount
                            .toString(),
                        ownersName: controller.itemsList[index].owner?.login,
                        watchers: controller.itemsList[index].watchersCount
                            .toString(),
                      )),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            });
      }),
    );
  }
}
