import 'package:colorify/presentation/resources/color_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastMessage() => Fluttertoast.showToast(
  msg: "Copied to the clipboard.",
  backgroundColor: AppColor.grey700
);
