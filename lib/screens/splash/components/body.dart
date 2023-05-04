import 'package:comparateur_prix/constants.dart';
import 'package:comparateur_prix/screens/sign_in/sign_screen.dart';
import 'package:comparateur_prix/screens/splash/splash_screen.dart';
import 'package:comparateur_prix/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../components/default_button.dart';
import 'splash_content.dart';


class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
    int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/3.png"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/3.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children:  <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value ;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) =>  SplashContent(
                 image: splashData[index]["image"],
                 text: splashData[index]['text'],
              ),
              ),
              ),
              Expanded(
              flex: 2,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                        List.generate(splashData.length, (index) => buildDot(index ),),
                      
                    ),
                    Spacer(flex:3),
                DefaultButton(
                  text: 'Continue',
                  press: () {
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  },
                ),
                Spacer(),
                
                  ],
                ),
              ) ,
              ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
                  duration: kAnimationDuration,
                  margin: EdgeInsets.only(right: 5),
                  height: 6,
                  width: currentPage == index ? 20 :6 ,
                  decoration: BoxDecoration(
                    color: currentPage == index ? kPrimaryColor: Color(0xFFD8D8D8),
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
  }
}

