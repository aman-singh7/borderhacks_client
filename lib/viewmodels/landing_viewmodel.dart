import 'package:borderhacks_client/locator.dart';
import 'package:borderhacks_client/models/doctor_model.dart';
import 'package:borderhacks_client/services/firebase_auth_service.dart';
import 'package:borderhacks_client/services/local_storage_service.dart';
import 'package:borderhacks_client/viewmodels/base_viewmodel.dart';
import 'package:get/get.dart';

class LandingViewModel extends BaseViewModel {
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();
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

  void signout() async {
    await _authService.signOut();
    _localStorageService.isLoggedIn = false;
    Get.offAndToNamed('/');
  }

  //Initializer:

}
