import 'package:borderhacks_client/models/doctor_model.dart';
import 'package:borderhacks_client/viewmodels/base_viewmodel.dart';

class LandingViewModel extends BaseViewModel {
//Data:
  int _selectedIndex = 0;

  //Getters:
  int get selectedIndex => _selectedIndex;

  //Setters:
  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Doctor getDummyData() {
    return Doctor(
      name: 'Dr Vinay Singh',
      qualifications: 'MBBS/MD',
      specialization: 'Eye Specialist',
      clinicAddress: '25/30 Awas Vikas',
      appointmentFee: '500 Rs',
      clinicTime: '10am-6pm',
    );
  }

  //Initializer:

}
