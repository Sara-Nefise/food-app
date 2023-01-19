import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

final recipeFormProvider =
    Provider.family.autoDispose<FormGroup, int>((ref, __) {
  return FormGroup({
    'name': FormControl<String>(
      validators: [Validators.required],
    ),
    'category': FormControl<String>(),
    'details': FormControl<String>(
      validators: [Validators.required],
    ),
    'image': FormControl<String>(),
    'ingredients': FormControl<String>(
      validators: [Validators.required],
    ),
  });
});
