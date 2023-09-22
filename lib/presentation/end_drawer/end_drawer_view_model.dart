import 'package:colorify/presentation/common/main_view_model.dart';
import 'package:colorify/presentation/common/toast_message/toast_message_view.dart';
import 'package:colorify/presentation/resources/string_manager.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EndDrawerViewModel extends MainViewModel {
  EndDrawerViewModel(super.context);

  @override
  void start() {
    // TODO: implement start
    readPrefs();
  }

  Logger logger = Logger();

  listenToChanges() {
    notifyListeners();
  }

  copyHexCode(String hexCode) async {
    await Clipboard.setData(ClipboardData(text: "#$hexCode"));
    Fluttertoast.cancel();
    showToastMessage(AppString.copiedToTheClipboard);
  }

  List<String> lastHexCodes = [];
  List<Color> lastColors = [];
  readPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lastHexCodes = prefs.getStringList("lastHexCodes") ?? [];
    lastColors = lastHexCodes.map((element) => Color(int.parse("0xFF$element"))).toList();
    notifyListeners();
  }



}
