import 'package:flutter/material.dart';
import 'package:foodapp/core/constants/app_constants.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/DL_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bs_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/dm_text.dart';
import 'package:foodapp/src/tips/presentation/component/tips_reactive_form.dart';

class AddTipItemScreen extends StatelessWidget {
  final AppConstants myString = AppConstants();

  AddTipItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: context.imageDecoration,
          child: Padding(
            padding: context.pagePadding,
            child: ListView(children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DLText(text: myString.logo),
                    Image.asset('assets/images/Vector.png')
                  ],
                ),
                context.emptyLowBox,
                DMText(text: myString.addTip),
                context.emptyVeryLowBox,
                BSText(text: myString.addTipbody),
                context.emptyMeduimBox,
                Padding(
                    padding: context.pagePadding, child: TipsReactiveForm()),
              ]),
            ]),
          )),
    );
  }
}
