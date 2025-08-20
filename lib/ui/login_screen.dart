import 'package:dratbasics/cubit/login/login_cubit.dart';
import 'package:dratbasics/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../core/fields_mixin.dart';
import '../core/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with FieldsMixin {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen')),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: phoneC,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.blue),
                  hintText: 'Enter your phone number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: Validator.validatePhoneNumber,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordC,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: Validator.validatePassword,
              ),

              SizedBox(height: 20),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  }
                  if (state is LoginError) {
                    Fluttertoast.showToast(
                      msg: state.errorMessage,
                      backgroundColor: Colors.red,
                    );
                  }
                },
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () {
                        if (!formkey.currentState!.validate()) return;

                        context.read<LoginCubit>().login(
                          phone: phoneC.text,
                          password: passwordC.text,
                        );
                      },
                      child: Text('Submit'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
