import 'package:comparateur_prix/components/default_button.dart';
import 'package:comparateur_prix/constants.dart';
import 'package:comparateur_prix/screens/forgot_password/forgot_password.dart';
import 'package:comparateur_prix/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_errors.dart';
import '../../../components/no_accounts_text.dart';
import '../../../components/social_card.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
 const Body({super.key});
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
            children:   [
            SizedBox(height: SizeConfig.screenHeight*0.04),
          
              Text ("Welcome Back",
              style: TextStyle(
                color: Colors.black,
                //fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold,
              ),
              ),
                Text ("Sign in with your email and password \nor continue with social media",
                textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight*0.08,),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight*0.08,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/google-icon.svg",
                       press: (){},),
                  
                   SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                       press: (){},),
                  
                   SocialCard(
                      icon: "assets/icons/twitter.svg",
                       press: (){},),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
          
                NoAccountText(),
            ],
                ),
          ),
        ),
      ),
    );
  }
}

