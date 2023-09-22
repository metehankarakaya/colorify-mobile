import 'package:colorify/presentation/common/button/color_button_view.dart';
import 'package:colorify/presentation/common/card/app_card.dart';
import 'package:colorify/presentation/home/home_view_model.dart';
import 'package:colorify/presentation/resources/color_manager.dart';
import 'package:colorify/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          title: const AppCard(),
        ),
        body: Column(
          children: [
            if (viewModel.randomColor != null) ... [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: viewModel.randomColor,
                      ),
                    ),
                    TextFormField(
                      controller: viewModel.hexController,
                      onChanged: (val) => viewModel.listenToChanges(),
                      onFieldSubmitted: (val) {
                        if (val.length == 6) {
                          viewModel.pickColor(viewModel.hexController.text);
                        }
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[\da-fA-F]')),
                        LengthLimitingTextInputFormatter(6),
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.grey300,
                        labelText: "Hex Code",
                        labelStyle: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold
                        ),
                        suffixIcon: IconButton(
                          onPressed: viewModel.hexController.text.length == 6
                            ? () => viewModel.pickColor(viewModel.hexController.text)
                            : null,
                          splashRadius: 20,
                          icon: const Icon(Icons.send),
                        ),
                        prefixIcon: const Icon(Icons.color_lens_outlined),
                        border: InputBorder.none,
                      ),
                    ),
                    ListTile(
                      trailing: const Icon(Icons.copy),
                      tileColor: AppColor.grey300,
                      title: Text("Hex: #${viewModel.hexPart}"),
                      onTap: () => viewModel.copyHexCode(viewModel.hexPart),
                    ),
                    ListTile(
                      trailing: const Icon(Icons.copy),
                      tileColor: AppColor.grey300,
                      title: Text("RGB (${viewModel.RGB})"),
                      onTap: () => viewModel.copyRGB(viewModel.RGB),
                    ),
                    ListTile(
                      trailing: const Icon(Icons.copy),
                      tileColor: AppColor.grey300,
                      title: Text("CMYK (${viewModel.CMYK})"),
                      onTap: () => viewModel.copyCMYK(viewModel.CMYK),
                    ),
                  ],
                ),
              )
            ]
            else ... [
              Expanded(
                child: Container(
                  color: AppColor.white,
                ),
              ),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ColorButton(
                  buttonName: AppString.red,
                  buttonColor: AppColor.red,
                  onPressed: () => viewModel.generateRandomShade(const Color(0XFFFF0000)),
                ),
                ColorButton(
                  buttonName: AppString.green,
                  buttonColor: AppColor.green,
                  onPressed: () => viewModel.generateRandomShade(const Color(0XFF00FF00)),
                ),
                ColorButton(
                  buttonName: AppString.blue,
                  buttonColor: AppColor.blue,
                  onPressed: () => viewModel.generateRandomShade(const Color(0XFF0000FF)),
                ),
              ],
            ),
            SizedBox(
              width: size.width,
              child: ColorButton(
                buttonName: AppString.randomColor,
                buttonColor: AppColor.black,
                onPressed: () => viewModel.generateRandomShade(const Color(0XFF000000)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
