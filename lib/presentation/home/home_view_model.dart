import 'dart:math';

import 'package:colorify/presentation/common/main_view_model.dart';
import 'package:flutter/material.dart';
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
    notifyListeners();
  }



}
