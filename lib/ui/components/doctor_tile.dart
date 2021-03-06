import 'package:borderhacks_client/app_theme.dart';
import 'package:borderhacks_client/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorTile extends StatelessWidget {
  final Doctor doctor;

  const DoctorTile(this.doctor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/appointment', arguments: doctor);
      },
      child: Card(
        color: AppTheme.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 8.h,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: const AssetImage('assets/images/default.png'),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                width: 30.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    doctor.name,
                    style: AppTheme.h3.copyWith(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: AppTheme.darkerBlue,
                    ),
                  ),
                  Text(
                    doctor.qualifications,
                    style: AppTheme.h4.copyWith(
                      fontSize: 10.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: AppTheme.darkerBlue,
                    ),
                  ),
                  Text(
                    doctor.specialization,
                    style: AppTheme.h4.copyWith(
                      fontSize: 10.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: AppTheme.darkerBlue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
