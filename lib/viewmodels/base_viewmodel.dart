import 'package:borderhacks_client/enums/view_state.dart';
import 'package:flutter/foundation.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.IDLE;
  String _errorMessage = '';

  //Getters
  ViewState get state => _state;

  String get errorMessage => _errorMessage;

  //Setters
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }
}
