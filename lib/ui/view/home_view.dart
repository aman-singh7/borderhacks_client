import 'package:borderhacks_client/ui/view/base_view.dart';
import 'package:borderhacks_client/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        builder: (context, model, child) => const Scaffold());
  }
}
