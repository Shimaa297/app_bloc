import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_app/bloc/login/blocLogin.dart';
import 'package:learn_app/bloc/login/bloc_LoginStates.dart';
import 'package:learn_app/constant.dart';
import 'package:learn_app/custom_widget/constant_button.dart';
import 'package:learn_app/custom_widget/flutter_toast.dart';
import 'package:learn_app/custom_widget/textForm.dart';
import 'package:learn_app/screens/homePage.dart';
import 'package:learn_app/screens/register_screen.dart';
import 'package:learn_app/sharedPreferences/cacheHelper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  bool isPassword = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    var heightScreen = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, AppLoginStates>(
        listener: (context, state)
        {
          if(state is AppLoginSuccessState)
          {
            if(state.loginModel.status)
            {
              print(state.loginModel.message);
              print(state.loginModel.data.token);
              CacheHelper.saveData(
                  key: 'token',
                  value: state.loginModel.data.token,
              ).then((value){navigateTo(context, HomePage());});
              showToast(
                  text: state.loginModel.message,
                  state: ToastState.SUCCESS
              );
            }else
              {
                print(state.loginModel.message);
                showToast(
                    text: state.loginModel.message,
                    state: ToastState.ERROR
                );
              }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Log in'),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/iconLogin.jpg',
                          height: 200,
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
                              setState(() {
                                isPassword = !isPassword;
                              });
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
                                AppLoginCubit.get(context).UserLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            }),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forget Password?',
                              textAlign: TextAlign.right,
                              style: TextStyle(color: defaultColor, fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: heightScreen * .05,
                        ),
                        ConditionalBuilder(
                          condition: state is! AppLoginLoadingState,
                          builder: (context) => defaultButton(
                              text: 'LogIn',
                              function: () {
                                if (formKey.currentState.validate()) {
                                  AppLoginCubit.get(context).UserLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                //  navigateTo(context, HomePage());
                                }
                              }),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: heightScreen * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            defaultButton(
                                text: 'FaceBook',
                                function: () {},
                                background: Colors.blue[900],
                                width: 150),
                            defaultButton(
                                text: 'Google',
                                function: () {},
                                background: Colors.red,
                                width: 150),
                          ],
                        ),
                        SizedBox(
                          height: heightScreen * .04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'I don\' t have account ?',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            TextButton(
                              onPressed: () {
                                navigateTo(context, RegisterScreen());
                              },
                              child: Text(
                                'REGISTER',
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.bodyText1.copyWith(color: defaultColor),
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
