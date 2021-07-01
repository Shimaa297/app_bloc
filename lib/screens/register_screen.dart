import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_app/bloc/register/bloc_register.dart';
import 'package:learn_app/bloc/register/bloc_registerStates.dart';
import 'package:learn_app/constant.dart';
import 'package:learn_app/custom_widget/constant_button.dart';
import 'package:learn_app/custom_widget/textForm.dart';
import 'package:learn_app/screens/homePage.dart';
import 'package:learn_app/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  bool isPassword = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    var heightScreen = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => AppRegisterCubit(),
      child: BlocConsumer<AppRegisterCubit, AppRegisterStates>(
        listener: (context, state)
        {
          if(state is AppSuccessState)
          {
            navigateTo(context, HomePage());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'register'.toUpperCase(),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(
                          height: heightScreen * .05,
                        ),
                        defaultTextForm(
                          label: 'Enter Your Name',
                          controller: nameController,
                          prefixIcon: Icon(
                            Icons.person,
                            color: defaultColor,
                          ),
                          textInputType: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Name must not be empty';
                            }
                          },
                        ),
                        SizedBox(
                          height: heightScreen * .05,
                        ),
                        defaultTextForm(
                          label: 'Enter Your Email',
                          controller: emailController,
                          prefixIcon: Icon(
                            Icons.email,
                            color: defaultColor,
                          ),
                          textInputType: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Email must not be empty';
                            }
                          },
                        ),
                        SizedBox(
                          height: heightScreen * .05,
                        ),
                        defaultTextForm(
                            label: 'Enter Your Password',
                            controller: passwordController,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: defaultColor,
                            ),
                            suffixIcon: isPassword
                                ? Icon(Icons.visibility)
                                : Icon(
                                    Icons.visibility_off_rounded,
                                    color: defaultColor,
                                  ),
                            suffixPressed: () {
                              // setState(() {
                              //   isPassword =! isPassword;
                              // });
                            },
                            textInputType: TextInputType.visiblePassword,
                            isPassword: isPassword,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'PassWord too Short';
                              }
                            },
                            onSubmitted: (value) {
                              if (formKey.currentState.validate()) {
                                AppRegisterCubit.get(context).UserRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
                              }
                            }),
                        SizedBox(
                          height: heightScreen * .05,
                        ),
                        defaultTextForm(
                          label: 'Enter Your Phone',
                          controller: phoneController,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: defaultColor,
                          ),
                          textInputType: TextInputType.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Phone must not be empty';
                            }
                          },
                        ),
                        SizedBox(
                          height: heightScreen * .05,
                        ),
                        ConditionalBuilder(
                          condition: state is! AppLoadingState,
                          builder: (context) => defaultButton(
                              text: 'REGISTER',
                              function: () {
                                if (formKey.currentState.validate()) {
                                  AppRegisterCubit.get(context).UserRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                  );
                                }
                              }),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: heightScreen * .05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'I have account ?',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            TextButton(
                              onPressed: () {
                                navigateTo(context, LoginScreen());
                              },
                              child: Text(
                                'LOGIN',
                                textAlign: TextAlign.right,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: defaultColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
