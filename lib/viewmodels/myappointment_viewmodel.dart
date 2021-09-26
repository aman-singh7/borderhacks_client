import 'package:borderhacks_client/models/patient_model.dart';
import 'package:borderhacks_client/viewmodels/base_viewmodel.dart';

class MyAppointmentViewModel extends BaseViewModel {
  Patient getDummyData() {
    return Patient(
      appointmentDate: '29/09/2021',
      clinicAddress: '25/30 Awas Vikas',
      doctorName: 'Dr Vinay Singh',
      patientName: 'DelunRex',
      patientAge: '19',
    );
  }
}
