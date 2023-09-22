import 'package:colorify/globalVariables.dart';
import 'package:colorify/presentation/common/dialog/clear_dialog_view.dart';
import 'package:colorify/presentation/common/main_view_model.dart';
import 'package:colorify/presentation/common/toast_message/toast_message_view.dart';
import 'package:colorify/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerViewModel extends MainViewModel {
  DrawerViewModel(super.context);

  @override
  void start() {
    // TODO: implement start
  }

  Logger logger = Logger();

  listenToChanges() {
    notifyListeners();
  }

  showClearDialog() {
    clearDialogView(context, this);
  }

  cancelClear() {
    Navigator.pop(context);
  }

  clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    lastHexCodes.clear();
    Fluttertoast.cancel();
    Navigator.pop(context);
    showToastMessage(AppString.successfullyDeleted);
    notifyListeners();
  }

}
