import 'package:borderhacks_client/locator.dart';
import 'package:borderhacks_client/services/firebase_auth_service.dart';
import 'package:borderhacks_client/services/local_storage_service.dart';
import 'package:borderhacks_client/viewmodels/base_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LandingViewModel extends BaseViewModel {
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  final FirebaseFirestore _firestore = locator<FirebaseFirestore>();
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

  Future<void> addAppointment(
      String name, int age, DateTime date, String id) async {
    await _firestore
        .collection('Doctors')
        .doc(id)
        .collection('appointments')
        .doc(DateFormat('dd-MM-yyyy').format(date))
        .set(
      {
        'date': Timestamp.fromDate(date),
        'patients': {
          name: {
            'address': age,
          }
        }
      },
      SetOptions(merge: true),
    );
  }

  void signout() async {
    await _authService.signOut();
    _localStorageService.isLoggedIn = false;
    Get.offAndToNamed('/');
  }

  //Initializer:

}
