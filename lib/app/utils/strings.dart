
import 'package:flutter/material.dart';

import 'colors.dart';
import 'sizes.dart';

class TextStyles {
  static final TextStyle superSmall07 = TextStyle(
    fontSize: superSmall,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato',
  );

  static final TextStyle superSmall07Blue = superSmall07.copyWith(
    color: blue0C6395,
  );

  static final TextStyle superSmall07WhiteBold = superSmall07.copyWith(
    color: white,
    fontWeight: FontWeight.bold,
  );

  // Extra Small
  static final TextStyle extraExtraSmall09 = TextStyle(
    fontSize: extraExtraSmall,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato',
  );

  static final TextStyle extraExtraSmall09Black4E = extraExtraSmall09.copyWith(
    color: black4E,
  );

  static final TextStyle extraExtraSmall09BlackBold =
      extraExtraSmall09.copyWith(
    color: black4E,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle extraExtraSmall09Blue = extraExtraSmall09.copyWith(
    color: blue0C6395,
  );

  static final extraExtraSmall09WhiteBold = extraExtraSmall09.copyWith(
    color: white,
    fontWeight: FontWeight.w800,
    fontSize: 20,
  );
  static final extraExtraSmall09WhiteBoldBangla = extraExtraSmall09.copyWith(
    color: white,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    fontFamily: 'Kalpurush',

  );
  // Extra Small
  static final TextStyle extraSmall12 = TextStyle(
    fontSize: extraSmall,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato',
  );

  static final TextStyle extraSmall12Black =
      extraSmall12.copyWith(color: black, fontWeight: FontWeight.w800);

  // Small
  static final TextStyle small14 = TextStyle(
    fontSize: small,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato',
  );

  static final TextStyle small14BoldBlack29 =
      small14.copyWith(color: black29, fontWeight: FontWeight.w800);
  static final TextStyle small14BoldBlack29Bangla = small14.copyWith(
    color: black29,
    fontWeight: FontWeight.w800,
    fontFamily: 'Kalpurush',
  );

  static final small14Blue = small14.copyWith(color: blue0C6395);
  static final small14BlueBold = small14.copyWith(
    color: blue0C6395,
    fontWeight: FontWeight.bold,
  );
  static final small14BlueBoldBangla = small14.copyWith(
    color: blue0C6395,
    fontWeight: FontWeight.bold,
    fontFamily: 'Kalpurush',

  );

  static final small14GreenBold = small14.copyWith(
    color: green016E69,
    fontWeight: FontWeight.w700,
  );

  static final base14BoldWhite70 = small14.copyWith(
    color: white70,
    fontWeight: FontWeight.bold,
  );

  // Base
  static TextStyle base16 = TextStyle(
    fontSize: base,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato',
  );

  // Large
  static TextStyle large18 = TextStyle(
    fontSize: large,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato',
  );

  // Extra Large
  static TextStyle extraLarge20 = TextStyle(
    fontSize: extraLarge,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato',
  );

  // Double Extra Large
  static TextStyle doubleExtraLarge24 = TextStyle(
    fontSize: doubleExtraLarge,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato',
  );

  // Triple Extra Large
  static TextStyle tripleExtraLarge30 = TextStyle(
    fontSize: tripleExtraLarge,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato',
  );

  // Quadruple Extra Large
  static TextStyle quadrupleExtraLarge36 = TextStyle(
    fontSize: quadrupleExtraLarge,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato',
  );

  // Quintuple Extra Large
  static TextStyle quintupleExtraLarge48 = TextStyle(
    fontSize: quintupleExtraLarge,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato',
  );
}
