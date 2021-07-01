import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_app/custom_widget/constant_button.dart';
import 'package:learn_app/screens/login_screen.dart';
import 'package:learn_app/screens/register_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/splash.jpg')
            ),
                ),),
                defaultButton(
                    text: 'Create account',
                    function: () {
                      navigateTo(context, RegisterScreen());
                    }),
                SizedBox(
                  height: 10,
                ),
                defaultButton(
                    text: 'Log In'.toUpperCase(),
                    background: Colors.white12,
                    function: () {
                      navigateTo(context, LoginScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
