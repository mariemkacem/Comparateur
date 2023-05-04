import 'dart:io';

import 'package:comparateur_prix/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_errors.dart';
import '../../../components/user.dart';
import '../../../constants.dart';
import '../../../services/registerService.dart';
import '../../otp_screen/otp_screen.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {

  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _telController = TextEditingController();
  final List<String> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;

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
     final  data = ModalRoute.of(context)?.settings.arguments;
     final  user = data;

    return Form(
      
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
                var url = Uri.parse('https://localhost:7035/api/Categorie');
                var response = await http.get(url);
                print('Response status: ${response.statusCode}');
                print('Response body: ${response.body}');
               // _submitForm2(data);
                print("success");
               // Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

 

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: _telController,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
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

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: _prenomController,
      onSaved: (newValue) => lastName = newValue,
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
      onSaved: (newValue) => firstName = newValue,
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

void _submitForm2(User user) async {

  if (!_formKey.currentState!.validate()) {
    return;
  }
  
  final nomm = _nomController.text.trim();
  final prenom = _prenomController.text.trim();
  final tel = _telController.text.trim();
  user.nom = nomm;
  user.prenom = prenom ;
  user.tel = tel ;
  try {
    await registerUser(user);
    // Afficher un message de confirmation si l'inscription réussit
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Succès'),
        content: Text('Votre inscription a réussi.'),
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
  }
}
}