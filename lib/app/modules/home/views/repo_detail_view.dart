import 'package:flutter/material.dart';
import 'package:flutter_getx_git_repositories/app/utils/ThemeTextStyles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/AllStrings.dart';
import '../../splash/get_git_repositories_model.dart';
import '../controllers/home_controller.dart';

class RepoDetailView extends GetView<HomeController> {
  const RepoDetailView({Key? key, this.items}) : super(key: key);
  final Items? items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
          ),
        ),
        title: const Text(
          AllStrings.RepositoryDetail,
          style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  repositoryIntro(),
                  SizedBox(
                    height: 20.h,
                  ),
                  repositoryDescription(),
                  const SizedBox(
                    height: 20,
                  ),
                  dateDetails()
                ],
              ),
            ),
            bottomPart(context)
          ],
        ),
      ),
    );
  }

  SizedBox bottomPart(BuildContext context) {
    return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 25.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${items!.stargazersCount} ⭐",
                      style: ThemeTextStyles.DetailsPatTextStyle,
                    ),
                    Text(
                      "${items!.openIssuesCount} 👁️‍",

                      style: ThemeTextStyles.DetailsPatTextStyle,
                    ),
                    Text(
                      "${items!.score}🏁",
                      style: ThemeTextStyles.DetailsPatTextStyle,
                    ),
                  ]),
            ),
          );
  }

  Column dateDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AllStrings.Information,
          style: ThemeTextStyles.RespositoryNameTextStyle,
        ),
        const Text("UpdatedAt", style: ThemeTextStyles.HeadingTextStyle),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              controller.commonfunc.dateformaterFuncDate(
                  inputString: items!.updatedAt ?? ""),
              overflow: TextOverflow.ellipsis,
              style: ThemeTextStyles.DateTextStyle,
            )
          ],
        )
      ],
    );
  }

  Column repositoryDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AllStrings.RepositoryDescription,
          style: ThemeTextStyles.RespositoryNameTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "${items!.description}",
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: ThemeTextStyles.RespositoryDescriptionTextStyle,
              ),
            ),
            Row(),
          ],
        ),
      ],
    );
  }

  Row repositoryIntro() {
    return Row(
      children: [
        const Flexible(
          child: Text(
            AllStrings.RepositoryName,
            style: ThemeTextStyles.RespositoryNameTextStyle,
          ),
        ),
        Text(
          "   ${items!.name}",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: ThemeTextStyles.RespositoryNameTextStyle,
        ),
      ],
    );
  }

  Padding image() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 150.w,
        height: 200.h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("${items!.owner?.avatarUrl}"),
                fit: BoxFit.fitHeight)),
      ),
    );
  }
}
