import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class SignupBloc extends FormBloc<String,String>{

 final userName = TextFieldBloc(
  validators: [
    FieldBlocValidators.required
  ]
 );
   final  email = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );
   final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final showSuccessResponse = BooleanFieldBloc();

  SignupBloc() {
    addFieldBlocs(
      fieldBlocs: [
        userName,
        email,
        password,
        showSuccessResponse,
      ],
    );
  }
  @override
  FutureOr<void> onSubmitting() async {
    await Future<void>.delayed(Duration(seconds: 1));
    emitSuccess(canSubmitAgain: true);
  }
  
}