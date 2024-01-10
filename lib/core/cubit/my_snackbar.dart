import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySnackBarCubit extends Cubit<GlobalKey?> {
  MySnackBarCubit() : super(null);

  //MySnackBar for Notification
  mySnackBar(BuildContext context, Text mex, Color? backgroundColor) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          width: 300.0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: backgroundColor,
          content: mex,
        ),
      );
  }
}
