import 'package:comparateur_prix/models/User.dart';
import 'package:comparateur_prix/screens/forgot_password/components/body.dart';
import 'package:comparateur_prix/screens/forgot_password/forgot_password.dart';
import 'package:comparateur_prix/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

//import '../../../components/authdata.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_errors.dart';
import '../../../constants.dart';
import '../../../services/apiservice.dart';
import '../../../services/login_service.dart';
import '../../../size_config.dart';
import '../../home/home_screen.dart';
import '../../login_success/login_success_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}


class _SignFormState extends State<SignForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  User? user;



 

  
 
    _handleLogin() async {
    var email = _emailController.text;
    var password = _passwordController.text;

    try {
      
      var data = await loginUser(email, password);
      
      //final user = data.user;
      // Utilisez le token et les détails de l'utilisateur comme nécessaire
       print(data);
       //Map<String, dynamic> decodedToken = JwtDecoder.decode(data);
      
     //  String email = decodedToken['Email'];
      //int id = decodedToken['identity']['IdUser'];
      //String username = decodedToken['username'];

    //print('Email: $email');
    //print('ID: $id');
    //print('Username: $username');
      // print('User: ${user.username}');
     // print(user);
      //Navigator.pushNamed(context, LoginSuccessScreen.routeName);
    } catch (e) {
      print('Erreur de connexion: $e');
    }
  }
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
              onTap : (() =>  Navigator.pushNamed(context,HomeScreen.routeName)),
              child:Text("Forgot Password",
            style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        FormError(errors: errors),
        SizedBox(height: getProportionateScreenHeight(20),),
        DefaultButton(
          text: "Login", 
          press: (){
            if (_formKey.currentState!.validate()){
              _formKey.currentState!.save();
              
              _handleLogin();
              }
          },
          ),
      ],
      ),
    );
  }


  TextFormField builPasswordFormField() {
        
    return TextFormField(
      controller: _passwordController,
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
      controller: _emailController,
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


  