import 'dart:js';

import 'package:comparateur_prix/components/product_card.dart';
import 'package:comparateur_prix/screens/complete_profile/complete_profile_screen.dart';
import 'package:comparateur_prix/screens/complete_profile/components/complete_profile_form.dart';
import 'package:comparateur_prix/screens/details/details_screen.dart';
import 'package:comparateur_prix/screens/editprofile/editprofile.dart';
import 'package:comparateur_prix/screens/favori/favori_screen.dart';
import 'package:comparateur_prix/screens/forgot_password/forgot_password.dart';
import 'package:comparateur_prix/screens/home/home_screen.dart';
import 'package:comparateur_prix/screens/otp_screen/otp_screen.dart';
import 'package:comparateur_prix/screens/profile/profile_screen.dart';
import 'package:comparateur_prix/screens/sign_in/sign_screen.dart';
import 'package:comparateur_prix/screens/sign_up/signup_screen.dart';
import 'package:flutter/material.dart';

import 'screens/login_success/login_success_screen.dart';
import 'screens/splash/splash_screen.dart';




final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen( ForgotPasswordScreen.routeName),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(callback: (data) { },),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
 DetailsScreen.routeName : (context) => DetailsScreen(),
 ProfileScreen.routeName : (context) => ProfileScreen(),
 FavoriScreen.routeName : (context) => FavoriScreen(),
EditProfileScreen.routeName : (context) => EditProfileScreen(),
};