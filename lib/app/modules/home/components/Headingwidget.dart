import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/AllStrings.dart';
import '../../../utils/ThemeTextStyles.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({Key? key, this.totalCount}) : super(key: key);
  final String? totalCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GreetingsRichText(),
         SizedBox(
          height: 10.h,
        ),
        listHeadingDetails(),
      ],
    );
  }

  Row listHeadingDetails() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
           Text(
             AllStrings.listHeadingName,
            style: ThemeTextStyles.listHeadingTextStyle,
          ),
          Text(
            totalCount!,
            style:  ThemeTextStyles.TotalTextStyle,
          ),
        ],
      );
  }

  RichText GreetingsRichText() {
    return RichText(
        text:  TextSpan(
          text: AllStrings.HelloRichText,
          style: ThemeTextStyles.HomeRichText2Style,
          children: const [
            TextSpan(
              text:AllStrings.AdminText,
              style: ThemeTextStyles.HomeRichTextStyle,
            ),
            TextSpan(
              text: AllStrings.WelcomeBack,
            ),
          ],
        ),
      );
  }
}
