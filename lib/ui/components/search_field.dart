import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:borderhacks_client/app_theme.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.h,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.r),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 17.w, top: 10.h),
            border: AppTheme.transparentOutlineBorder,
            enabledBorder: AppTheme.transparentOutlineBorder,
            focusedBorder: AppTheme.transparentOutlineBorder,
            hintText: 'Search',
            hintStyle: AppTheme.h3.copyWith(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: AppTheme.darkerBlue,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
