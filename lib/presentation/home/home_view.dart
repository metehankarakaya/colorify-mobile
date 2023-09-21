import 'package:colorify/presentation/common/button/color_button_view.dart';
import 'package:colorify/presentation/home/home_view_model.dart';
import 'package:colorify/presentation/resources/color_manager.dart';
import 'package:colorify/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(context),
      builder: (context, viewModel, child) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.transparent,
          title: const Text(AppString.appName),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.red.shade300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ColorButton(
                  buttonName: AppString.red,
                  buttonColor: AppColor.red,
                  onPressed: () {},
                ),
                ColorButton(
                  buttonName: AppString.green,
                  buttonColor: AppColor.green,
                  onPressed: () {},
                ),
                ColorButton(
                  buttonName: AppString.blue,
                  buttonColor: AppColor.blue,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              width: size.width,
              child: ColorButton(
                buttonName: AppString.randomColor,
                buttonColor: AppColor.black,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
