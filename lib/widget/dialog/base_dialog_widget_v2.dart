import 'dart:math' as math;

import 'package:flutter/material.dart';

abstract class BaseDialogWidgetV2 extends StatelessWidget {
  BaseDialogWidgetV2({
    Key? key,
    this.titlePadding,
    this.contentPadding,
    this.buttonPadding,
    this.backgroundColor,
    this.borderRadius = 0.0,
  }) : super(key: key);

  final Color? backgroundColor;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? buttonPadding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(math.max(0, borderRadius)),
      ),
      elevation: 0.0,
      backgroundColor: backgroundColor ?? Colors.transparent,
      titlePadding: titlePadding ?? const EdgeInsets.all(0.0),
      contentPadding: contentPadding ?? const EdgeInsets.all(0.0),
      buttonPadding: buttonPadding ?? const EdgeInsets.all(0.0),
      title: buildDialogTitle(context),
      content: buildDialogContent(context),
      actions: buildActions(context),
    );
  }

  Widget? buildDialogTitle(BuildContext context) => null;

  Widget buildDialogContent(BuildContext context);

  List<Widget>? buildActions(BuildContext context) => null;
}
