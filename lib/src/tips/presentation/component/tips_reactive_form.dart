import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/main.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/category_items.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/custom_reactive_textfield.dart';
import 'package:foodapp/src/tips/application/tips_form_controller.dart';
import 'package:foodapp/src/tips/data/firebase_tips_repository.dart';

import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_context/riverpod_context.dart';

import '../../../refrigerator_managment/presentation/components/validation_elevated_button.dart';

class TipsReactiveForm extends ConsumerWidget {
  TipsReactiveForm({super.key});
  final List<String> categories = [
    'Groceries',
    'Dairy products',
    'Meat products',
    'All',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FormGroup tipsForm = ref.watch((tipsFormProvider(0)));

    return ReactiveForm(
      formGroup: tipsForm,
      child: Column(
        children: [
          context.emptyLowBox,
          Align(
            alignment: Alignment.topLeft,
            child: CategoryItemList(
              categories: categories,
              cotrolName: 'category',
              form: tipsForm,
            ),
          ),
          context.emptyMeduimBox,
          CustomReactiveTextField(
            formController: 'name',
            hint: 'Name',
            validation: {
              'required': (error) => 'The name must not be empty',
            },
          ),
          context.emptyMeduimBox,
          CustomReactiveTextField(
            formController: 'details',
            hint: 'Details ..',
            maxLine: 5,
            padding: context.paddingTipDetailField,
            validation: {'required': (error) => 'The notes must not be empty'},
            textAction: TextInputAction.send,
          ),
          context.emptyMeduimBox,
          ReactiveFormConsumer(
            builder:
                (BuildContext context, FormGroup formGroup, Widget? child) {
              return ValidationButton(
                text: 'Procced',
                callback: formGroup.valid
                    ? () async {
                        print("Form is valid, the value is ${formGroup.value}");
                        try {
                          await context
                              .read(tipsRepositoryProvider)
                              .createTipsItem(item: formGroup.value);
                          context.read(currentIndex.notifier).state = 4;
                        } catch (e) {}
                      }
                    : null,
              );
            },
          )
        ],
      ),
    );
  }
}
