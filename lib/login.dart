import 'package:exp/exp.dart';
import 'package:exp/home.dart';
import 'package:exp/widgets.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    'Welcome!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Please enter your data to continue',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'UserEmail',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: HexColor('#F2F2F2'),
                    ),
                    child: DefaultFieldForm(
                        controller: emailController,
                        keyboard: TextInputType.emailAddress,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Your Email';
                          }
                          return null;
                        },
                        prefix: Icons.email,
                        hint: 'Email',
                        hintStyle: const TextStyle(color: Colors.grey),
                        show: false),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: HexColor('#F2F2F2'),
                    ),
                    child: DefaultFieldForm(
                        controller: phoneController,
                        keyboard: TextInputType.emailAddress,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Your Phone';
                          }
                          return null;
                        },
                        prefix: Icons.lock,
                        hint: 'Phone',
                        hintStyle: const TextStyle(color: Colors.grey),
                        show: false,
                        suffix: Icons.visibility,
                        suffixPress: () {
                          //cubit.changePasswordIcon();
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 1,
                          width: 100,
                          color: Colors.black,
                        ),
                        const Text(
                          'Or',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Container(
                          height: 1,
                          width: 100,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultButton(
                      //backgroundColor: HexColor('#07094D'),
                      buttonWidget: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      function: () {
                        if (formKey.currentState!.validate()) {
                          if (Exp.isEmailValid(emailController.text)) {
                            print('Email Is Valid');
                          } else {
                            print('Email Is InValid');
                          }
                          if (Exp.isPhoneValid(phoneController.text)) {
                            print('phone Is Valid');
                          } else {
                            print('Phone Is InValid');
                          }
                        }
                        if (Exp.isEmailValid(emailController.text) &&
                            (Exp.isPhoneValid(phoneController.text))) {
                          navigateTo(
                              context, const MyHomePage(title: 'Exp Flutter'));
                        }
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Row(
                      children: [
                        const Text('I don\'t Have account?'),
                        MaterialButton(
                            onPressed: () {
                              // navigateTo(context, Register());
                            },
                            child: const Text(
                              'Create Account',
                            ))
                        //style: TextStyle(color: HexColor('#07094D'),),))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
