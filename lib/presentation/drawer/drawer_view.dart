import 'package:colorify/presentation/common/card/app_card.dart';
import 'package:colorify/presentation/drawer/drawer_view_model.dart';
import 'package:colorify/presentation/resources/color_manager.dart';
import 'package:colorify/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerViewModel>.reactive(
      viewModelBuilder: () => DrawerViewModel(context),
      builder: (context, viewModel, child) => Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              child: ListTile(
                title: AppCard(),
              ),
            ),
            ListTile(
              onTap: () => viewModel.clearPrefs(),
              trailing: const Icon(Icons.delete_outline),
              title: const Text(AppString.clearCastColors),
            ),
            const Expanded(child: SizedBox(),),
            const Divider(height: 0,),
            ListTile(
              tileColor: AppColor.green100,
              title: const Text(AppString.appVersion),
            )
          ],
        ),
      ),
    );
  }
}
