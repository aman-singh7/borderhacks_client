import 'base_view.dart';
import 'package:borderhacks_client/ui/components/appointments_tile.dart';
import 'package:borderhacks_client/viewmodels/myappointment_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentView extends StatefulWidget {
  const MyAppointmentView({Key? key}) : super(key: key);

  @override
  _MyAppointmentViewState createState() => _MyAppointmentViewState();
}

class _MyAppointmentViewState extends State<MyAppointmentView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MyAppointmentViewModel>(builder: (context, model, child) {
      return Scaffold(
        body: _buildBody(model),
      );
    });
  }

  Widget _buildBody(MyAppointmentViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            children: List<Widget>.generate(
              2,
              (_) => AppointmentTile(model.getDummyData()),
            ),
          ),
        ],
      ),
    );
  }
}
