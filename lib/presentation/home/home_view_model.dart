import 'dart:math';

import 'package:colorify/presentation/common/main_view_model.dart';
import 'package:colorify/presentation/common/toast_message/toast_message_view.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

class HomeViewModel extends MainViewModel {
  HomeViewModel(super.context);

  @override
  void start() {
    // TODO: implement start
  }

  Logger logger = Logger();

  listenToChanges() {
    notifyListeners();
  }

  copyHexCode(String hexCode) async {
    await Clipboard.setData(ClipboardData(text: "#$hexCode"));
    Fluttertoast.cancel();
    showToastMessage();
  }

  copyRGB(String rgb) async {
    await Clipboard.setData(ClipboardData(text: "($rgb)"));
    Fluttertoast.cancel();
    showToastMessage();
  }

  String hexPart = "";
  Color? randomColor;
  generateRandomShade(Color baseColor) {
    Random random = Random();
    String baseHex = baseColor.value.toRadixString(16).substring(2).toUpperCase(); //0XFFFF0000 -> FF0000
    String firstDigit = baseHex.startsWith('FF') ? 'F' : random.nextInt(16).toRadixString(16);
    String secondDigit = baseHex.startsWith('FF') ? 'F' : random.nextInt(16).toRadixString(16);
    String thirdDigit = baseHex.substring(2, 4) == 'FF' ? 'F' : random.nextInt(16).toRadixString(16);
    String fourthDigit = baseHex.substring(2, 4) == 'FF' ? 'F' : random.nextInt(16).toRadixString(16);
    String fifthDigit = baseHex.endsWith('FF') ? 'F' : random.nextInt(16).toRadixString(16);
    String sixthDigit = baseHex.endsWith('FF') ? 'F' : random.nextInt(16).toRadixString(16);
    hexPart = "$firstDigit$secondDigit$thirdDigit$fourthDigit$fifthDigit$sixthDigit".toUpperCase();
    String colorCode = "0xFF$hexPart";
    randomColor = Color(int.parse(colorCode));
    hexToRGB(hexPart);
    notifyListeners();
  }

  int R = 0;
  int G = 0;
  int B = 0;
  String RGB = "";
  hexToRGB(String hexCode) {
    int r = int.parse(hexCode.substring(0, 2), radix: 16);
    int g = int.parse(hexCode.substring(2, 4), radix: 16);
    int b = int.parse(hexCode.substring(4, 6), radix: 16);
    R = r;
    G = g;
    B = b;
    RGB = "$R, $G, $B";
    notifyListeners();
  }

}
