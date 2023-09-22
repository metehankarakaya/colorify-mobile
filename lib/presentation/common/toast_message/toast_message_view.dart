import 'package:colorify/presentation/resources/color_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastMessage(String msg) => Fluttertoast.showToast(
  msg: msg,
  backgroundColor: AppColor.grey700
);
