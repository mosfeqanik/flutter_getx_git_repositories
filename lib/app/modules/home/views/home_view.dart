import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/network_image_strings.dart';
import '../components/Headingwidget.dart';
import '../components/side_menu.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const headingWidget(),
      ),
      Container(
        height: 530,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
            itemCount: 8,
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 16 / 4, crossAxisCount: 1, mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return Container(
                // color: Colors.grey,
                decoration: BoxDecoration(
                    color: const Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(10)),
                            height: 55,
                            width: 55,
                            child: Icon(Icons.ice_skating),
                          )
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "planing[index].heading",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * 0.035,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            "laning[index].subHeading",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: MediaQuery.of(context).size.width * 0.03,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      )
        ],
      ),
    );
  }
}
