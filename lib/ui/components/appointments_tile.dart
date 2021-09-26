import 'package:borderhacks_client/app_theme.dart';
import 'package:borderhacks_client/models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentTile extends StatelessWidget {
  final Patient patient;

  const AppointmentTile(this.patient, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 8.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  patient.patientName,
                  style: AppTheme.h3.copyWith(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: AppTheme.darkerBlue,
                  ),
                ),
                Text(
                  patient.patientAge,
                  style: AppTheme.h3.copyWith(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: AppTheme.darkerBlue,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  patient.doctorName,
                  style: AppTheme.h4.copyWith(
                    fontSize: 12.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: AppTheme.darkerBlue,
                  ),
                ),
                Text(
                  patient.clinicAddress,
                  style: AppTheme.h4.copyWith(
                    fontSize: 12.sp,
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
    );
  }
}
