import 'package:comparateur_prix/components/default_button.dart';
import 'package:comparateur_prix/components/form_errors.dart';
import 'package:comparateur_prix/components/no_accounts_text.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column (
                  children:   [
                    SizedBox(height: SizeConfig.screenHeight * 0.1),
                    Text ("Forgot Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                      Text ("Please enter your email and we will send \nyou a link to return your account",
                      textAlign: TextAlign.center,
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.1),
                      ForgotPasswordForm(),
                  ],
          ),
        ),
      ),
    );
    
    }
}
class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
final _formKey = GlobalKey<FormState>();
final List<String> errors = [];
 late String email ;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue! ,
        onChanged: (value) {
           if (value.isNotEmpty && errors.contains(kEmailNullError)){
            setState(() {
              errors.remove(kEmailNullError);
            });
          }else if (!emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)){
            setState(() {
              errors.remove(kInvalidEmailError);
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kEmailNullError)){
            setState(() {
              errors.add(kEmailNullError);
            });
          }else if (!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)){
            setState(() {
              errors.add(kInvalidEmailError);
            });
          }
         
          return null ;
        },
        decoration:const  InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg",),
            ),
      ),
      SizedBox(height: getProportionateScreenHeight(30)),
      FormError(errors: errors),
      SizedBox(height: SizeConfig.screenHeight * 0.1),
      DefaultButton(text: "Continue",
       press: (){
          if (_formKey.currentState!.validate()){
              _formKey.currentState!.save()
;            } 
      }),
      SizedBox(height: SizeConfig.screenHeight * 0.1),
      NoAccountText(),
     ],
      ),
      );
  }
}