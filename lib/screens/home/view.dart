import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_with_api/screens/home/cubit.dart';
import 'package:play_with_api/screens/home/states.dart';

import 'components/item_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobCubit(),
      child: Builder(builder: (context) {
        final cubit = JobCubit.getObject(context);
        cubit.getJobDetails();

        return Scaffold(
          backgroundColor: const Color(0xff5A55CA),
          body: SafeArea(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 40.w, top: 50.h),
                  child: Text(
                    'Welcome',
                    style: TextStyle(fontSize: 24.sp, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 40.w, top: 15.h, end: 39.w, bottom: 37.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: TextFormField(
                      style: TextStyle(fontSize: 16.sp),
                      decoration: const InputDecoration(
                        hintText: 'Search job',
                        fillColor: Color(0xffffffff),
                        border: InputBorder.none,
                        filled: true,
                        suffixIcon: Icon(Icons.search_outlined),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<JobCubit, JobStates>(builder: (context, state) {
                  if (state is GetJobLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  return Container(
                    width: 390.w,
                    height: 530.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(40.r),
                        topStart: Radius.circular(40.r),
                      ),
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) => ItemHome(
                        nameOfJob: cubit.model!.jobs[index],
                        nameOfCompany: cubit.model!.companies[index],
                      ),
                      itemCount: cubit.model!.jobs.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                    ),
                  );
                }),
                SizedBox(height: 50.h),
              ],
            ),
          ),
          floatingActionButton: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 30.w,
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(270.w, 40.h),
                  ),
                  backgroundColor: const MaterialStatePropertyAll(
                    Color(0xff5A55CA),
                  ),
                  shadowColor: const MaterialStatePropertyAll(Colors.white),
                  elevation: const MaterialStatePropertyAll(20),
                ),
                child: Text(
                  'Publish Your Jobs',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
