import 'package:borderhacks_client/services/local_storage_service.dart';
import 'package:borderhacks_client/viewmodels/home_viewmodel.dart';
import 'package:borderhacks_client/viewmodels/auth_viewmodel.dart';
import 'package:borderhacks_client/viewmodels/startup_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  var localStorage = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(localStorage);
  var _firebaseAuth = FirebaseAuth.instance;
  locator.registerSingleton<FirebaseAuth>(_firebaseAuth);
  var _firebaseFirestore = FirebaseFirestore.instance;
  locator.registerSingleton<FirebaseFirestore>(_firebaseFirestore);

  locator.registerFactory(() => StartUpViewModel());
  locator.registerFactory(() => AuthViewModel());
  locator.registerFactory(() => HomeViewModel());
}
