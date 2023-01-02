import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_with_api/screens/login/model.dart';
import 'package:play_with_api/screens/login/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  User? model;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static LoginCubit getObject(context) => BlocProvider.of(context);

  void login() async {
    String email = emailController.text;
    String password = passwordController.text;
    try {
      emit(LoginLoadingState());
      // Make API call
      final response = await Dio().get('https://george-22084-default-rtdb.firebaseio.com/users.json');
      final user = User.fromJson(response.data);
      // Compare user input with API response
      if (user.email == email && user.password == password) {
        emit(LoginSuccessState());
      } else {
        emit(LoginFailedState());
      }
    } catch (e) {
      emit(LoginFailedState());
    }
  }
}
