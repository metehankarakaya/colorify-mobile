import 'package:colorify/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width/3,
      height: size.height/16,
      child: Card(
        color: AppColor.green700,
        child: Center(
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColor.white, fontStyle: FontStyle.italic),
              children: const [
                TextSpan(text: "C", style: TextStyle(color: Color(0xFF00A5D0))),
                TextSpan(text: "o", style: TextStyle(color: Color(0xFF00ADD4))),
                TextSpan(text: "l", style: TextStyle(color: Color(0xFF00B4D8))),
                TextSpan(text: "o", style: TextStyle(color: Color(0xFF24BFDE))),
                TextSpan(text: "r", style: TextStyle(color: Color(0xFF48CAE4))),
                TextSpan(text: "i", style: TextStyle(color: Color(0xFF90E0EF))),
                TextSpan(text: "f", style: TextStyle(color: Color(0xFFADE8F4))),
                TextSpan(text: "y", style: TextStyle(color: Color(0xFFCAF0F8))),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
