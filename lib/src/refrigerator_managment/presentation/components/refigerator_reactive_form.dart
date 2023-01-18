import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/main.dart';
import 'package:foodapp/src/refrigerator_managment/application/refrigerator_form_controller.dart';
import 'package:foodapp/src/refrigerator_managment/data/firebase_refigerator_repository.dart';
import 'package:foodapp/src/refrigerator_managment/domain/refrigerator.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/category_items.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/custom_reactive_textfield.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/validation_elevated_button.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_context/riverpod_context.dart';

class RefigeratorReactiveForm extends ConsumerWidget {
  RefigeratorReactiveForm({super.key});
  List<String> categories = [
    'Groceries',
    'Dairy products',
    'Meat products',
    'All',
    'Groceries',
    'Dairy products',
    'Meat products',
    'All'
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FormGroup refigeratorForm = ref.watch(refrigeratorFormProvider(0));

    return ReactiveForm(
      formGroup: refigeratorForm,
      child: Column(
        children: [
          CategoryItemList(
            categories: categories,
            cotrolName: 'category',
            form: refigeratorForm,
          ),
          context.emptyMeduimBox,
          CustomReactiveTextField(
            formController: 'name',
            hint: 'Name',
            validation: {
              'required': (error) => 'The email must not be empty',
            },
          ),
          context.emptyMeduimBox,
          Row(
            children: [
              Expanded(
                child: CustomReactiveTextField(
                  formController: 'purchaseD',
                  hint: 'Purchase Date',
                  validation: {'required': (error) => 'Must not be empty'},
                ),
              ),
              context.emptyMeduimWidth,
              Expanded(
                  child: CustomReactiveTextField(
                formController: 'expirationD',
                hint: 'Expiration Date',
                validation: {'required': (error) => 'Must not be empty'},
              ))
            ],
          ),
          context.emptyMeduimBox,
          Row(
            children: [
              Expanded(
                child: CustomReactiveTextField(
                  formController: 'quantity',
                  hint: 'Quantity ',
                  validation: {
                    'required': (error) => 'Must not be empty',
                    'number': (error) => 'Must be number',
                  },
                ),
              ),
              context.emptyMeduimWidth,
              Expanded(
                  child: CustomReactiveTextField(
                formController: 'unit',
                hint: 'Unit',
                validation: {'required': (error) => 'Must not be empty'},
              ))
            ],
          ),
          context.emptyMeduimBox,
          CustomReactiveTextField(
            formController: 'market',
            hint: 'Market Name',
            validation: {'required': (error) => 'The market must not be empty'},
          ),
          context.emptyMeduimBox,
          CustomReactiveTextField(
            formController: 'notes',
            hint: 'notes ..',
            maxLine: 3,
            padding: context.paddingWideField,
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
                          print(
                              "Form is valid, the value is ${formGroup.value}");
                          try {
                            await context
                                .read(refigertorRepositoryProvider)
                                .createRefigertorItem(item: formGroup.value);
                            context.read(currentIndex.notifier).state = 0;
                          } catch (e) {}
                        }
                      : null);
            },
          )
        ],
      ),
    );
  }
}
