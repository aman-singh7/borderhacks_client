import 'base_view.dart';
import 'package:borderhacks_client/app_theme.dart';
import 'package:borderhacks_client/models/doctor_model.dart';
import 'package:borderhacks_client/viewmodels/landing_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  _AppointmentViewState createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  @override
  Widget _buildCoverImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/doctor-background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage(String name, String qual, String spec) {
    return Positioned(
      bottom: -106.h,
      child: Column(
        children: [
          CircleAvatar(
            radius: 60.r,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 58.r,
              backgroundImage: const AssetImage('assets/images/default.png'),
            ),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            qual,
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            spec,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String name, String qual, String spec) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        _buildCoverImage(),
        _buildProfileImage(name, qual, spec),
      ],
    );
  }

  Widget _buildInfo(IconData leading, String field, String value) {
    return ListTile(
      leading: Icon(
        leading,
        color: AppTheme.blue,
      ),
      title: Text('$field : $value'),
    );
  }

  Widget _buildProfileInfo(String address, String time, String fee) {
    return ListView(
      children: [
        _buildInfo(Icons.timer, 'Timing', time),
        _buildInfo(Icons.money, 'Appointment fees', fee),
        _buildInfo(Icons.location_city, 'Address', address),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Doctor doctor = Get.arguments;
    return BaseView<LandingViewModel>(
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: _buildHeader(
                  doctor.name, doctor.qualifications, doctor.specialization),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 120.h),
                child: _buildProfileInfo(doctor.clinicAddress,
                    doctor.clinicTime, doctor.appointmentFee),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50.h),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Book Appointment',
                  style: AppTheme.h2.copyWith(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
