import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'base_view.dart';
import 'package:borderhacks_client/ui/components/bottom_appbar.dart';
import 'package:borderhacks_client/ui/components/search_field.dart';
import 'package:borderhacks_client/ui/components/doctor_tile.dart';
import 'package:borderhacks_client/ui/view/myappointment_view.dart';
import 'package:borderhacks_client/viewmodels/landing_viewmodel.dart';
import 'package:borderhacks_client/app_theme.dart';

class LandingView extends StatefulWidget {
  @override
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LandingViewModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: _buildAppBar(model),
        body: _buildBody(model),
        bottomNavigationBar: BottomAppbar(),
      );
    });
  }

  AppBar _buildAppBar(LandingViewModel model) {
    return AppBar(
      title:
          (model.selectedIndex == 1) ? Text('My Appointments') : Text('Home'),
      backgroundColor: AppTheme.blue,
    );
  }

  Widget _buildBody(LandingViewModel model) {
    if (model.selectedIndex == 1) {
      return MyAppointmentView();
    }

    //ELSE
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Column(
        children: [
          SearchField(),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            children: List<Widget>.generate(
              2,
              (_) => DoctorTile(model.getDummyData()),
            ),
          ),
        ],
      ),
    );
  }
}
