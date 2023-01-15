import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({Key? key, this.totalCount}) : super(key: key);
  final String? totalCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            text: "Hello ",
            style: TextStyle(color: kDarkBlue, fontSize: 18),
            children: [
              TextSpan(
                text: "BRUNO",
                style: TextStyle(color: kDarkBlue, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ", welcome back!",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const Text(
              "Flutter Repository",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              totalCount!,
              style: const TextStyle(color: kDarkBlue),
            ),
          ],
        ),
      ],
    );
  }
}
