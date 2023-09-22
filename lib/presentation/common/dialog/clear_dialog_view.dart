import 'package:colorify/presentation/drawer/drawer_view_model.dart';
import 'package:colorify/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';

void clearDialogView(BuildContext context, DrawerViewModel viewModel) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(AppString.clearCastColors),
        contentPadding: EdgeInsets.zero,
        content: ListTile(
          title: Text(
            AppString.clearAlertContent,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => viewModel.cancelClear(),
            child: const Text(AppString.cancel),
          ),
          TextButton(
            onPressed: () => viewModel.clearPrefs(),
            child: const Text(AppString.delete),
          ),
        ],
      );
    }
  );
}