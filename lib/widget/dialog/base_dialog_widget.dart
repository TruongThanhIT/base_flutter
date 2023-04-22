import 'package:flutter/material.dart';

abstract class BaseDialogWidget extends StatelessWidget {
  BaseDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: buildDialogContent(context),
    );
  }

  Widget buildDialogContent(BuildContext context);
}
