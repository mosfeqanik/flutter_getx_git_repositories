import 'package:flutter/material.dart';

class headingWidget extends StatelessWidget {
  const headingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            text: "Hello ",
            style: TextStyle(color: Colors.black54, fontSize: 18),
            children: [
              TextSpan(
                text: "BRUNO",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
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
          children: const [
            Text(
              "Flutter Repository",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "View All",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
