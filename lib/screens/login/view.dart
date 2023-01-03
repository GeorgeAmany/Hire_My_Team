import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          backgroundColor: const Color(0xff5A55CA),
          body: Padding(
            padding: EdgeInsetsDirectional.only(top: 100.h),
            child: Container(
              width: 390.w,
              height: double.infinity.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(40.r),
                  topStart: Radius.circular(40.r),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 70.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 11.h,
                    ),
                    Text(
                      'LOGIN',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28.sp),
                    ),
                    SizedBox(height: 38.h),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Enter email"),
                      ),
                      controller: cubit.emailController,
                    ),
                    SizedBox(height: 38.h),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Enter password"),
                      ),
                      controller: cubit.passwordController,
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    BlocBuilder<LoginCubit, LoginStates>(
                        builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.only(start: 63.w, end: 63.w),
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.login();
                            if (state is LoginSuccessState) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const HomeScreen()));
                            }
                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(
                              Size(270.w, 40.h),
                            ),
                            backgroundColor: const MaterialStatePropertyAll(
                              Color(0xff5A55CA),
                            ),
                          ),
                          child: Text(
                            'Login'.toUpperCase(),
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 120.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
