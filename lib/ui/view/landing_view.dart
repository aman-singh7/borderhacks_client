import 'package:borderhacks_client/locator.dart';
import 'package:borderhacks_client/models/doctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_view.dart';
import 'package:borderhacks_client/app_theme.dart';
import 'package:borderhacks_client/ui/components/bottom_appbar.dart';
import 'package:borderhacks_client/ui/components/doctor_tile.dart';
import 'package:borderhacks_client/ui/view/myappointment_view.dart';
import 'package:borderhacks_client/viewmodels/landing_viewmodel.dart';
import 'package:flutter/material.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  final _firestore = locator<FirebaseFirestore>();
  @override
  Widget build(BuildContext context) {
    return BaseView<LandingViewModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: _buildAppBar(model),
        body: _buildBody(model),
        bottomNavigationBar: const BottomAppbar(),
      );
    });
  }

  AppBar _buildAppBar(LandingViewModel model) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (model.selectedIndex == 1)
              ? const Text('My Appointments')
              : const Text('Home'),
          IconButton(
            onPressed: () => model.signout(),
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      backgroundColor: AppTheme.blue,
    );
  }

  Widget _buildBody(LandingViewModel model) {
    if (model.selectedIndex == 1) {
      return const MyAppointmentView();
    }

    //ELSE
    return StreamBuilder(
      stream: _firestore.collection('Doctors').snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return DoctorTile(Doctor(
                id: snapshot.data!.docs[index].id,
                name: snapshot.data!.docs[index]['name'],
                clinicAddress: snapshot.data!.docs[index]['address'],
                clinicTime: snapshot.data!.docs[index]['timing'],
                appointmentFee: snapshot.data!.docs[index]['fee'],
                qualifications: snapshot.data!.docs[index]['qualification'],
                specialization: snapshot.data!.docs[index]['specialization'],
              ));
            },
          );
        }
        return const Center(
          child: Text('There is no doctor list avaliable at this moment'),
        );
      },
    );
  }
}
