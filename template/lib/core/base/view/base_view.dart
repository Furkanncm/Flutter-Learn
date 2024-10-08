import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final T viewmodel;
  final Function(T model) onModelReady;
  final VoidCallback onDispose;
  final Widget Function(BuildContext context, T viewmodel) onPageBuilder;

  const BaseView({
    super.key,
    required this.viewmodel,
    required this.onModelReady,
    required this.onDispose,
    required this.onPageBuilder,
  });

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store > extends State<BaseView<T>> {
  @override
  void initState() {
    super.initState();
    widget.onModelReady(widget.viewmodel);
  }

  @override
  void dispose() {
    super.dispose();
    widget.onDispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, widget.viewmodel);
  }
}
