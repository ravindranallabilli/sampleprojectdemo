

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class SignInBloc extends FormBloc<String,String>{
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

  SignInBloc() {
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
        showSuccessResponse,
      ],
    );
   
  }
  

  @override
  void onSubmitting() async {
    print(email.value);
    print(password.value);
    print(showSuccessResponse.value);

    await Future<void>.delayed(Duration(seconds: 1));
    emitSuccess(canSubmitAgain: true);
   
  }
}
