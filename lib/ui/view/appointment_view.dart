import 'package:intl/intl.dart';

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
  var date = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _ageEditingController = TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();
  final Doctor doctor = Get.arguments;

  String? validate(String? value) {
    if (value == null) {
      return 'Required Field';
    }
    return null;
  }

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

  Widget _buildInfo(IconData leading, String field, dynamic value) {
    return ListTile(
      leading: Icon(
        leading,
        color: AppTheme.blue,
      ),
      title: Text('$field : $value'),
    );
  }

  Widget _buildProfileInfo(String address, String time, int fee) {
    return ListView(
      children: [
        _buildInfo(Icons.timer, 'Timing', time),
        _buildInfo(Icons.money, 'Appointment fees', fee),
        _buildInfo(Icons.location_city, 'Address', address),
      ],
    );
  }

  Future<void> _showDialog(BuildContext context, LandingViewModel model) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Enter Patient Details"),
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _nameEditingController,
                      decoration: const InputDecoration(hintText: "Enter name"),
                      validator: validate,
                    ),
                    TextFormField(
                      controller: _ageEditingController,
                      decoration: const InputDecoration(hintText: "Enter age"),
                      validator: validate,
                    ),
                    ListTile(
                      onTap: () async {
                        var res = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: date,
                          lastDate: date.add(const Duration(days: 10)),
                        );
                        if (res != null) {
                          setState(() {
                            date = res;
                          });
                        }
                      },
                      title: const Text('Date'),
                      subtitle: Text(DateFormat('dd-MM-yyyy').format(date)),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await model.addAppointment(
                          _nameEditingController.text.trim(),
                          int.parse(_ageEditingController.text.trim()),
                          date,
                          doctor.id,
                        );
                        Get.back();
                      },
                      child: const Text(
                        "Confirm Booking",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () async {
                  await _showDialog(context, model);
                },
                child: Text(
                  'Book Appointment',
                  style: AppTheme.h2.copyWith(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
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
