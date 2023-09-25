

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ForgotPasswordBloc extends FormBloc<String,String>{
 final  email = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );


 

  final showSuccessResponse = BooleanFieldBloc();

  ForgotPasswordBloc() {
    addFieldBlocs(
      fieldBlocs: [
        email,
        showSuccessResponse,
      ],
    );
   
  }
  

  @override
  void onSubmitting() async {
    print(email.value);
    print(showSuccessResponse.value);

    await Future<void>.delayed(Duration(seconds: 1));
    emitSuccess(canSubmitAgain: true);
   
  }
}
