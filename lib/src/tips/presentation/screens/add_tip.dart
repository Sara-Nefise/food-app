import 'package:flutter/material.dart';
import 'package:foodapp/core/constants/app_constants.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/category_items.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/custom_reactive_textfield.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/validation_elevated_button.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/screens/add_refigerator_item.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/DL_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bs_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/dm_text.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddTipItemScreen extends StatelessWidget {
  final AppConstants myString = AppConstants();

  final List<String> categories = ['Pastries', 'Grills', 'Soups', 'All'];

  final form = FormGroup({
    'name': FormControl(validators: [Validators.required]),
    'details': FormControl(validators: [Validators.required]),
  });

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
                context.emptyLowBox,
                Align(
                  alignment: Alignment.topLeft,
                  child: CategoryItemList(categories: categories),
                ),
                context.emptyMeduimBox,
                Padding(
                    padding: context.pagePadding, child: newItemForm(context)),
              ]),
            ]),
          )),
    );
  }

  ReactiveForm newItemForm(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          CustomReactiveTextField(
            formController: 'name',
            hint: 'Name',
            validation: {
              'required': (error) => 'The name must not be empty',
            },
            onSubmit: (control) {
              form.patchValue({'name': control});
            },
          ),
          context.emptyMeduimBox,
          CustomReactiveTextField(
            formController: 'details',
            hint: 'Details ..',
            maxLine: 2,
            padding: context.paddingTipDetailField,
            validation: {'required': (error) => 'The notes must not be empty'},
            onSubmit: (control) {
              form.patchValue({'details': control});
            },
            textAction: TextInputAction.send,
          ),
          context.emptyMeduimBox,
          ValidationButton(
            text: 'Procced',
            callback: form.valid
                ? () {
                    print(form.value.toString());
                  }
                : null,
          )
        ],
      ),
    );
  }
}
