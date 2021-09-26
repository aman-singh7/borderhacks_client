import 'package:borderhacks_client/locator.dart';
import 'package:borderhacks_client/services/local_storage_service.dart';
import 'package:borderhacks_client/viewmodels/base_viewmodel.dart';
import 'package:get/get.dart';

class StartUpViewModel extends BaseViewModel {
  LocalStorageService localStorageService = locator<LocalStorageService>();

  void onModelReady() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    await Get.offAllNamed(
      localStorageService.isLoggedIn ? '/landing' : '/login',
    );
  }
}
