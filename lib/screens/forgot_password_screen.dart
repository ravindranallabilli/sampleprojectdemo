// ignore: invalid_language_version_override

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:sampleproject/bloc/forgot_password_bloc.dart';
import 'package:sampleproject/bloc/signin_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe

 


class ForgotScreenPassword extends StatefulWidget {
  @override
  _ForgotScreenPasswordState createState() => _ForgotScreenPasswordState();
}

class _ForgotScreenPasswordState extends State<ForgotScreenPassword> {
  
  

   
   

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ForgotPasswordBloc(),
        child: Builder(builder: (context) {
          final forgotPasswordBloc = context.read<ForgotPasswordBloc>();
          return SafeArea(
              child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.grey.shade200,
            
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: (){
                 Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
            body: FormBlocListener<ForgotPasswordBloc, String, String>(
              onSubmitting: (context, state) {
              
              },
              onSuccess: (context, state) {
              

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Reset link sent  successful'),
                  backgroundColor: Colors.green.shade400,
                ));
              },
              onFailure: (context, state) {
               

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.failureResponse!)));
              },
              child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: AutofillGroup(
                      child: Container(child:  drawUI(forgotPasswordBloc)))),
            ),
          ));
        }));
  }

  drawUI(ForgotPasswordBloc loginFormBloc)    {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(

             margin: const EdgeInsets.only(left: 30),
            child: const Text("Forgot password",style:    TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.bold),)
          ),
          SizedBox(
            // ignore: use_build_context_synchronously
            height: MediaQuery.of(context).size.height * 0.05,
          ),
         Container(
          padding: EdgeInsets.only(left: 40,right: 40),
          alignment: Alignment.center,
          child: Text('Please,enter your email address. You will receive a link to create a new password', style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)),
          Container(
           margin: const EdgeInsets.all(30),
           
           
            child: TextFieldBlocBuilder(
              
              padding: const EdgeInsets.all(10),
              textFieldBloc: loginFormBloc.email,
              cursorColor: Colors.black,
              textStyle: const TextStyle(fontSize: 14,color: Colors.black),
              textColor: MaterialStateProperty.all(Colors.black),
              autocorrect: false,
              hideOnSuggestionsError: false,
              decoration: const InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  labelText: 'Email',
                     errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintStyle: TextStyle(fontSize: 14,color: Colors.black),
                  fillColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 14,color: Colors.black),
                   enabled: false
                      ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          
          
          Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: GestureDetector(
             
                  onTap: () {
                    loginFormBloc.submit();
                  },
                  child: Container(
                    height: 42,
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(25)),
                        color: Colors.red,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              blurRadius: 20,
                              offset: Offset.zero,
                              color: Colors.grey.withOpacity(0.5))
                        ]),
                    child: Container(
                      alignment: const Alignment(0, 0),
                      child: const Text(
                        'SEND',
                        style: TextStyle(fontSize: 16,color: Colors.white),
                      ),
                    ),
                  ))),
          
            
        
       
        ]);
  }
  
 
}
