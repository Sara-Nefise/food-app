import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

final refrigeratorFormProvider =
    Provider.family.autoDispose<FormGroup, int>((ref, __) {
  return FormGroup({
    'name': FormControl<String>(
      validators: [Validators.required],
    ),
    'category': FormControl<String>(),
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
});
