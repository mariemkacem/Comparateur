import 'dart:io';

import 'package:comparateur_prix/screens/complete_profile/complete_profile_screen.dart';
import 'package:comparateur_prix/screens/sign_in/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_errors.dart';
import '../../../constants.dart';
import '../../../services/register_service.dart';
import '../../../size_config.dart';
import '../../complete_profile/components/complete_profile_form.dart';
import '../../home/home_screen.dart';

class SignUpForm extends StatefulWidget {



  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final TextEditingController _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _telController = TextEditingController();
  final _usernamecontroller = TextEditingController();
  final List<String> errors = [];
  late String firstName;
  late String lastName;
  late String phoneNumber;
  String? nom;
  String? prenom;
  String? phone;

  String? email;
  String? password;
  String? conform_password;
  bool remember = false;

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
bool _isVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: _isVisible,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                buildUserNameFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildEmailFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildPasswordFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildConformPassFormField(),
                FormError(errors: errors),
                SizedBox(height: getProportionateScreenHeight(40)),
                DefaultButton(
                  text: "Continue",
                  
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                     _toggleVisibility();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        Visibility(visible:!_isVisible,
         child: Form(
      
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
           
          DefaultButton(
            text: "Register",
            press: () async {
              if (_formKey.currentState!.validate()) {
                
                _submitForm2();
                //print("success");
               // Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          ),
        ],
      ),
    )
         
         ),
      ],
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
 _submitForm2() async {
 
  final email = _emailController.text.trim();
  final password = _passwordController.text.trim();
  final nom = _nomController.text.trim();
  final prenom = _prenomController.text.trim();
  final phone = _telController.text.trim();
  const role = "client";
  final username = _usernamecontroller.text.trim();
  
  try {
    await registerUser( username,  email,  password, nom,  prenom,  phone ,role);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Succès'),
        content: Text('Votre inscription a réussi.'),
        actions: <Widget>[
          ElevatedButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
               
            },
          )
        ],
      ),
    );
  } on HttpException catch (error) {
    // Afficher un message d'erreur si l'inscription a échoué
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Erreur'),
        content: Text(error.message),
        actions: <Widget>[
          ElevatedButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  } catch (error) {
    // Afficher un message d'erreur si une exception est levée
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Erreur'),
        content: Text('Une erreur s\'est produite. Veuillez réessayer.'),
        actions: <Widget>[
          ElevatedButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ));
  }}
  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: _telController,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration:const  InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
       
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }
TextFormField buildUserNameFormField() {
    return TextFormField(
      controller: _usernamecontroller,
      onSaved: (newValue) => lastName = newValue!,
       onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kLastNamenameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kLastNamenameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Enter your username",
       
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: _prenomController,
      onSaved: (newValue) => lastName = newValue!,
       onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kLastNamenameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kLastNamenameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
       
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: _nomController,
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );

  }



}