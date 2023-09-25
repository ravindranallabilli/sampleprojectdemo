// ignore: invalid_language_version_override

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sampleproject/bloc/signup_bloc.dart';
import 'package:sampleproject/screens/signin_screen.dart';


// ignore: import_of_legacy_library_into_null_safe

 


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  
  

   
   

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SignupBloc(),
        child: Builder(builder: (context) {
          final signupBloc = context.read<SignupBloc>();
          return SafeArea(
              child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.grey.shade200,
            
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: (){
                  
              exit(0);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
            body: FormBlocListener<SignupBloc, String, String>(
              onSubmitting: (context, state) {
              
              },
              onSuccess: (context, state) {
              

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Signup successful'),
                  backgroundColor: Colors.green.shade400,
                ));
                 Navigator.pushNamedAndRemoveUntil(context, '/HomeScreen', (Route<dynamic> route) => false);
              },
              onFailure: (context, state) {
               

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.failureResponse!)));
              },
              child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: AutofillGroup(
                      child: Container(child:  drawUI(signupBloc)))),
            ),
          ));
        }));
  }

  drawUI(SignupBloc signupBloc)    {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(

             margin: const EdgeInsets.only(left: 30),
            child: const Text("Sign up",style:    TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.bold),)
          ),
          SizedBox(
            // ignore: use_build_context_synchronously
            height: MediaQuery.of(context).size.height * 0.05,
          ),
           Container(
           margin: const EdgeInsets.all(30),
           
           
            child: TextFieldBlocBuilder(
              
              padding: const EdgeInsets.all(10),
              textFieldBloc: signupBloc.userName,
              cursorColor: Colors.black,
              textStyle: const TextStyle(fontSize: 14,color: Colors.black),
              textColor: MaterialStateProperty.all(Colors.black),
              autocorrect: false,
              hideOnSuggestionsError: false,
              suffixButton: SuffixButton.asyncValidating,
              decoration: const InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  labelText: 'UserName',
                
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
         margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
           
           
            child: TextFieldBlocBuilder(
              
              padding: const EdgeInsets.all(10),
              textFieldBloc: signupBloc.email,
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
          margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
           
            child: TextFieldBlocBuilder(
              padding: const EdgeInsets.all(10),
              textFieldBloc: signupBloc.password,
              textStyle: const TextStyle(fontSize: 14,color: Colors.black),
              textColor: MaterialStateProperty.all(Colors.black),
              obscureText: false,
              
              decoration: const InputDecoration(
                filled: true,
                 border: InputBorder.none,
                  labelText: 'Password',
                   errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintStyle: TextStyle(fontSize: 14,color: Colors.black),
                  fillColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 14,color: Colors.black),
                   enabled: false),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {

                     Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: SignInScreen()),
                    );
                  },
                  child: const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(onTap: (){},child: const Icon(Icons.arrow_forward,color: Colors.red,),)
              ],
            ),
          ),
         
          Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: GestureDetector(
             
                  onTap: () {
                    signupBloc.submit();
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
                        'SIGN UP',
                        style: TextStyle(fontSize: 16,color: Colors.white),
                      ),
                    ),
                  ))),
                    SizedBox(
            // ignore: use_build_context_synchronously
            height: MediaQuery.of(context).size.height * 0.15,
          ),
        
          
            Container(
              alignment: Alignment.center,
              child: const Text('Or signup with social account',style:TextStyle(fontSize: 14,color: Colors.black) ),
              
            
           ),
           Container(
            padding: EdgeInsets.all(10),
             child: Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  height: 50,
                  width: 50,
             decoration: const BoxDecoration(
               
              color: Colors.white,
               borderRadius: BorderRadius.all(Radius.circular(10))
             ),
             child: Image.asset('assets/images/google.png',height: 10,width: 10,),
                ),
                 Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(15),
                  height: 50,
                  width: 50,
             decoration: const BoxDecoration(
               
              color: Colors.white,
               borderRadius: BorderRadius.all(Radius.circular(10))
             ),
             child: Image.asset('assets/images/facebook.png',height: 10,width: 10,),
                )
              ],
             ),
           )
        
       
        ]);
  }
  
 
}
