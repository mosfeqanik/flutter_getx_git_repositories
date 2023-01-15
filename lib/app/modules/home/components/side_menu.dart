import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../../utils/assets_strings.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 80,
            child: DrawerHeader(
                child: Lottie.asset(
              AssetStrings.LottieGithub,
            )),
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.home_2,
            title: "Overview",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.menu,
            title: "Issues",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.folder,
            title: "Repository",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.chat,
            title: "Message",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.settings,
            title: "Settings",
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            AssetStrings.helpImage,
            height: 150,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Color(0xffEBF6FF),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Upgrade your plan",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Go to Pro",
                        style: TextStyle(color: Color(0xff369FFF))),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff369FFF)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.keyboard_double_arrow_right_rounded,
                          color: Color(0xff369FFF),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: Colors.grey,
        size: 18,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
