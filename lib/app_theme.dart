import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  ///Colors
  ///
  ///Shades: Colors like grey, black, white, etc.
  ///Arranged in order of increasing darkness,
  ///from [white], [grey1], ..., [grey<N>], [black].
  static const Color white = Colors.white,
      grey1 = Color(0xFFF1F2F7),
      grey2 = Color(0xFFE5E5E5),
      grey3 = Color(0xFF7A7A7A),
      grey4 = Color(0xFF666666),
      grey5 = Color(0xFF333333),
      black = Colors.black;

  ///Colors
  ///
  ///Hues: Colors like red, blue, etc.
  ///Arranged in groups of similar colors,
  ///i.e. First all types of blues, then all types of reds, etc.
  static const Color blue = Color(0xFF2964EE),
      darkBlue = Color(0xFF2600C6),
      darkerBlue = Color(0xFF434660),
      red = Colors.red,
      gold = Colors.yellow;

  ///Styles
  ///
  ///Arranged in decreasing order of `fontSize`.
  ///Other properties are based on most common use-case.
  static TextStyle h1 = TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w700,
        color: blue,
        fontFamily: 'OpenSans',
      ),
      h2 = TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: blue,
        fontFamily: 'OpenSans',
      ),
      h3 = TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: blue,
        fontFamily: 'OpenSans',
      ),
      h4 = TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: blue,
        fontFamily: 'OpenSans',
      ),
      h5 = TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
        color: darkerBlue,
        fontFamily: 'Poppins',
      );

  ///Decorations
  static OutlineInputBorder transparentOutlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.transparent),
  );
}
