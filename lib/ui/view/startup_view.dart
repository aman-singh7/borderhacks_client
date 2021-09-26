import 'package:borderhacks_client/ui/view/base_view.dart';
import 'package:borderhacks_client/viewmodels/startup_viewmodel.dart';
import 'package:flutter/material.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<StartUpViewModel>(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
