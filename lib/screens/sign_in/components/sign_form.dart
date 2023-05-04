import 'package:comparateur_prix/screens/forgot_password/components/body.dart';
import 'package:comparateur_prix/screens/forgot_password/forgot_password.dart';
import 'package:comparateur_prix/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../components/authdata.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_errors.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../login_success/login_success_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}


class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String email ;
  late String password ;
  late bool remember = false ;
  final List<String> errors = [];
    void addError({String? error}) {
        if (!errors.contains(error))
          setState(() {
            errors.add(error!);
          });
      }

      void removeError({String? error}) {
        if (errors.contains(error))
          setState(() {
            errors.remove(error);
          });
      }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        SizedBox(height: getProportionateScreenHeight(30),),
        builEmailFormField(),
        SizedBox(height: getProportionateScreenHeight(30),),
        builPasswordFormField(),
        SizedBox(height: getProportionateScreenHeight(30),),
        Row(
          children: [
            Checkbox(
            value: remember, 
            activeColor: kPrimaryColor,
            onChanged: (value){
              setState(() {
                remember = value! ;
              });
            },
            ),
            Text("Remember me"),
            Spacer(),
            GestureDetector(
              onTap : (() =>  Navigator.pushNamed(context,ForgotPasswordScreen.routeName)),
              child:Text("Forgot Password",
            style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        FormError(errors: errors),
        SizedBox(height: getProportionateScreenHeight(20),),
        DefaultButton(
          text: "Continue", 
          press: (){
            if (_formKey.currentState!.validate()){
              _formKey.currentState!.save();
              submitForm();
              Navigator.pushNamed(context, LoginSuccessScreen.routeName);         }
          },
          ),
      ],
      ),
    );
  }
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
void submitForm() {
  final email = emailController.text;
  final password = passwordController.text;
  final authData = AuthData(email: email, password: password);
  authenticate(authData,"login");
}


  TextFormField builPasswordFormField() {
        
    return TextFormField(
      controller: passwordController,
        obscureText: true,
        onSaved: (newValue) => password = newValue! ,
        onChanged: (value) {
          if (value.isNotEmpty ){
           removeError(error: kPassNullError);
          }else if (value.length >= 8 ){
            removeError(error: kShortPassError);
            }
            return null ;
        },
         validator: (value) {
          if (value!.isEmpty ){
             addError(error: kPassNullError);
             return "";
          }else if (value.length < 8 ){
           addError(error: kShortPassError);
          return "";
          }
          return null ;
        },
        decoration:const  InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg",),
            ),
      );
  }

  TextFormField builEmailFormField() {
    return TextFormField(
      controller: emailController,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue! ,
        onChanged: (value) {
           if (value.isNotEmpty ){
             removeError(error: kEmailNullError);
           
          }else if ( emailValidatorRegExp.hasMatch(value)){
            removeError(error: kInvalidEmailError);
          }
        },
        validator: (value) {
          if (value!.isEmpty ){
            addError(error: kEmailNullError);
             return"";
          }else if (!emailValidatorRegExp.hasMatch(value) ){
            setState(() {
              addError(error: kInvalidEmailError);
            });
             return"";
          }
         
          return null ;
        },
        decoration:const  InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg",),
            ),
      );
  }
}


  