import 'dart:math';

import 'package:colorify/presentation/common/main_view_model.dart';
import 'package:colorify/presentation/common/toast_message/toast_message_view.dart';
import 'package:colorify/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  TextEditingController hexController = TextEditingController();

  copyHexCode(String hexCode) async {
    await Clipboard.setData(ClipboardData(text: "#$hexCode"));
    Fluttertoast.cancel();
    showToastMessage(AppString.copiedToTheClipboard);
  }

  copyRGB(String rgb) async {
    await Clipboard.setData(ClipboardData(text: "($rgb)"));
    Fluttertoast.cancel();
    showToastMessage(AppString.copiedToTheClipboard);
  }

  copyCMYK(String cmyk) async {
    await Clipboard.setData(ClipboardData(text: "($cmyk)"));
    Fluttertoast.cancel();
    showToastMessage(AppString.copiedToTheClipboard);
  }

  pickColor(String pickedColor) {
    String colorCode = "0XFF$pickedColor";
    randomColor = Color(int.parse(colorCode));
    hexPart = pickedColor.toUpperCase();
    hexToRGB(hexPart);
    rgbToCMYK(R, G, B);
    saveHexCode(hexPart);
    notifyListeners();
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
    rgbToCMYK(R, G, B);
    saveHexCode(hexPart);
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

  String CMYK = "";
  rgbToCMYK(int R, int G, int B) {
    double rDivided = R / 255.0;
    double gDivided = G / 255.0;
    double bDivided = B / 255.0;
    double k = 1 - max(rDivided, max(gDivided, bDivided));
    double c = (1 - rDivided - k) / (1 - k);
    double m = (1 - gDivided - k) / (1 - k);
    double y = (1 - bDivided - k) / (1 - k);
    double C = c * 100;
    double M = m * 100;
    double Y = y * 100;
    double K = k * 100;
    CMYK = "${C.round()}%, ${M.round()}%, ${Y.round()}%, ${K.round()}%";
  }

  List<String> lastHexCodes = [];
  saveHexCode(String hexCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lastHexCodes.insert(0, hexCode.toUpperCase());
    while (lastHexCodes.length > 20) {
      lastHexCodes.removeAt(20);
    }
    prefs.setStringList("lastHexCodes", lastHexCodes);
    logger.i(lastHexCodes);
    logger.e(lastHexCodes.length);
    notifyListeners();
  }


}
