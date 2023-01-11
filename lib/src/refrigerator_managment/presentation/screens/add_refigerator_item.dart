import 'package:flutter/material.dart';
import 'package:foodapp/core/constants/app_constants.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/category_items.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/custom_reactive_textfield.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/validation_elevated_button.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/DL_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bs_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/dm_text.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddRefigeratorItemScreen extends StatefulWidget {
  const AddRefigeratorItemScreen({super.key});

  @override
  State<AddRefigeratorItemScreen> createState() =>
      _AddRefigeratorItemScreenState();
}

class _AddRefigeratorItemScreenState extends State<AddRefigeratorItemScreen> {
  AppConstants myString = AppConstants();

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

  final form = FormGroup({
    'email': FormControl(validators: [Validators.required, Validators.email]),
    'purchaseD': FormControl(validators: [
      Validators.required,
      Validators.pattern(RegExp(
          r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$'))
    ]),
    'expirationD': FormControl(validators: [
      Validators.required,
      Validators.pattern(RegExp(
          r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$'))
    ]),
    'quantity':
        FormControl(validators: [Validators.required, Validators.number]),
    'unit': FormControl(validators: [Validators.required]),
    'market': FormControl(validators: [Validators.required]),
    'notes': FormControl(validators: [Validators.required]),
  });
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
                  CategoryItemList(categories: categories),
                  context.emptyMeduimBox,
                  Padding(padding: context.pagePadding, child: newItemForm()),
                ]),
              ]),
            )),
      ),
    );
  }

  ReactiveForm newItemForm() {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          CustomReactiveTextField(
            formController: 'email',
            hint: 'Email',
            validation: {
              'required': (error) => 'The email must not be empty',
              'email': (error) => 'The email value must be a valid email'
            },
            onSubmit: (control) {
              form.patchValue({'email': control});
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
                  onSubmit: (control) {
                    form.patchValue({'purchaseD': control});
                  },
                ),
              ),
              context.emptyMeduimWidth,
              Expanded(
                  child: CustomReactiveTextField(
                formController: 'expirationD',
                hint: 'Expiration Date',
                validation: {'required': (error) => 'Must not be empty'},
                onSubmit: (control) {
                  form.patchValue({'expirationD': control});
                },
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
                  onSubmit: (control) {
                    form.patchValue({'quantity': control});
                  },
                ),
              ),
              context.emptyMeduimWidth,
              Expanded(
                  child: CustomReactiveTextField(
                formController: 'unit',
                hint: 'Unit',
                validation: {'required': (error) => 'Must not be empty'},
                onSubmit: (control) {
                  form.patchValue({'unit': control});
                },
              ))
            ],
          ),
          context.emptyMeduimBox,
          CustomReactiveTextField(
            formController: 'market',
            hint: 'Market Name',
            validation: {'required': (error) => 'The market must not be empty'},
            onSubmit: (control) {
              form.patchValue({'market': control});
            },
          ),
          context.emptyMeduimBox,
          CustomReactiveTextField(
            formController: 'notes',
            hint: 'notes ..',
            maxLine: 3,
            padding: context.paddingWideField,
            validation: {'required': (error) => 'The notes must not be empty'},
            onSubmit: (control) {
              form.patchValue({'notes': control});
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
