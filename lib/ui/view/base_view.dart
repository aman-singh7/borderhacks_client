import 'package:borderhacks_client/locator.dart';
import 'package:borderhacks_client/viewmodels/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDestroy;

  // ignore: use_key_in_widget_constructors
  const BaseView(
      {required this.builder, this.onModelReady, this.onModelDestroy});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onModelDestroy != null) {
      widget.onModelDestroy!(model);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
