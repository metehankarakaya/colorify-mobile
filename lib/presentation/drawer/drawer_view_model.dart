import 'package:colorify/presentation/common/main_view_model.dart';
import 'package:colorify/presentation/common/toast_message/toast_message_view.dart';
import 'package:colorify/presentation/resources/string_manager.dart';
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

  clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Fluttertoast.cancel();
    showToastMessage(AppString.successfullyDeleted);
  }

}
