import 'package:flutter/material.dart';
import 'package:borderhacks_client/app_theme.dart';
import 'base_view.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:borderhacks_client/models/doctor_model.dart';

class AppointmentView extends StatefulWidget {
  @override
  _AppointmentViewState createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  @override
  Widget build(BuildContext context) {
    final Doctor doctor = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.blue,
        title: Text('Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h, right: 10.w),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                        backgroundImage:
                            AssetImage('assets/images/default.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      Text(
                        'Name- ${doctor.name}',
                        style: AppTheme.h2.copyWith(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: AppTheme.darkerBlue,
                        ),
                      ),
                      Text(
                        'Qualifications- ${doctor.qualifications}',
                        style: AppTheme.h2.copyWith(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: AppTheme.darkerBlue,
                        ),
                      ),
                      Text(
                        'Specialization- ${doctor.specialization}',
                        style: AppTheme.h2.copyWith(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: AppTheme.darkerBlue,
                        ),
                      ),
                      Text(
                        'Clinic Address- ${doctor.clinicAddress}',
                        style: AppTheme.h2.copyWith(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: AppTheme.darkerBlue,
                        ),
                      ),
                      Text(
                        'Clinic Time- ${doctor.clinicTime}',
                        style: AppTheme.h2.copyWith(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: AppTheme.darkerBlue,
                        ),
                      ),
                      Text(
                        'Appointment Fees- ${doctor.appointmentFee}',
                        style: AppTheme.h2.copyWith(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: AppTheme.darkerBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  'Book Appointment',
                  style: AppTheme.h2.copyWith(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
