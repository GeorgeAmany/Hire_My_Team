import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_with_api/screens/home/view.dart';
import 'package:play_with_api/screens/login/cubit.dart';
import 'package:play_with_api/screens/login/states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        final cubit = LoginCubit.getObject(context);
        cubit.login();
        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 51,
                ),
                const Text(
                  'LOGIN',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                const SizedBox(height: 38),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Enter email"),
                  ),
                  controller: cubit.emailController,
                ),
                const SizedBox(height: 38),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Enter password"),
                  ),
                  controller: cubit.passwordController,
                ),
                const SizedBox(
                  height: 100,
                ),
                BlocBuilder<LoginCubit, LoginStates>(builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 63, end: 63),
                    child: ElevatedButton(
                      onPressed: () {
                        cubit.login();
                        if (state is LoginSuccessState ){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                              const HomeScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(294, 54),
                      ),
                      child: Text(
                        'Login'.toUpperCase(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
