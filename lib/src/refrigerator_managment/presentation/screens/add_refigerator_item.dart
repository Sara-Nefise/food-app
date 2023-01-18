import 'package:flutter/material.dart';
import 'package:foodapp/core/constants/app_constants.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/category_items.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/custom_reactive_textfield.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/refigerator_reactive_form.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/validation_elevated_button.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/DL_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bs_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/dm_text.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddRefigeratorItemScreen extends StatelessWidget {
  AddRefigeratorItemScreen({super.key});

  AppConstants myString = AppConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                  DMText(text: myString.newItem),
                  context.emptyVeryLowBox,
                  BSText(text: myString.newItembody),
                  context.emptyMeduimBox,
                  context.emptyLowBox,
                  Padding(
                      padding: context.pagePadding,
                      child: RefigeratorReactiveForm()),
                ]),
              ]),
            )),
      ),
    );
  }
}
