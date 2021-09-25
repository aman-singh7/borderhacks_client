import 'package:borderhacks_client/app_theme.dart';
import 'package:borderhacks_client/viewmodels/landing_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BottomAppbar extends StatefulWidget {
  const BottomAppbar({Key? key}) : super(key: key);

  @override
  _BottomAppbarState createState() => _BottomAppbarState();
}

class _BottomAppbarState extends State<BottomAppbar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppTheme.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTabItem(
            0,
            'Home',
          ),
          _buildTabItem(
            1,
            'My Appointments',
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String text) {
    return Consumer<LandingViewModel>(
      builder: (context, model, child) {
        var _selected = model.selectedIndex == index;

        return MaterialButton(
          minWidth: 152.w,
          onPressed: () => model.selectedIndex = index,
          child: Text(
            text,
            style: AppTheme.h4.copyWith(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: _selected ? AppTheme.white : AppTheme.darkerBlue,
            ),
          ),
        );
      },
    );
  }
}
