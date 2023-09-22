import 'package:colorify/presentation/end_drawer/end_drawer_view_model.dart';
import 'package:colorify/presentation/resources/color_manager.dart';
import 'package:colorify/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EndDrawerView extends StatefulWidget {
  const EndDrawerView({Key? key}) : super(key: key);

  @override
  State<EndDrawerView> createState() => _EndDrawerViewState();
}

class _EndDrawerViewState extends State<EndDrawerView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ViewModelBuilder<EndDrawerViewModel>.reactive(
      viewModelBuilder: () {
        EndDrawerViewModel viewModel = EndDrawerViewModel(context);
        viewModel.start();
        return viewModel;
      },
      builder: (context, viewModel, child) => SafeArea(
        child: Drawer(
          width: size.width*0.85,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    AppString.lastColors,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: viewModel.lastHexCodes.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                          highlightColor: AppColor.transparent,
                        ),
                        child: ListTile(
                          onTap: () => viewModel.copyHexCode(viewModel.lastHexCodes[index]),
                          splashColor: AppColor.transparent,
                          trailing: SizedBox(
                            width: size.width/2,
                            height: size.height/16,
                            child: Card(
                              color: viewModel.lastColors[index],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                            ),
                          ),
                          title: Text(
                            "#${viewModel.lastHexCodes[index]}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
