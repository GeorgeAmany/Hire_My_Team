import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobDetail extends StatelessWidget {
  final String nameOfSelectedJob, nameOfSelectedCompany , textBody;

  const JobDetail(
      {Key? key,
      required this.nameOfSelectedJob,
      required this.nameOfSelectedCompany, required this.textBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5A55CA),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            InkWell(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 40.w, top: 20.h),
                child: Row(
                  children: [
                    Container(
                      width: 22.w,
                      height: 22.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 17.w,
                    ),
                    Text(
                      'Job details',
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 40.w),
              child: Text(
                nameOfSelectedJob,
                style: TextStyle(fontSize: 24.sp, color: Colors.white),
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 40.w),
              child: Text(
                'Bangalore | Full Time',
                style: TextStyle(fontSize: 12.sp, color: Colors.white),
              ),
            ),
            SizedBox(height: 26.h),
            Container(
              width: 390.w,
              height: 800.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(40.r),
                  topStart: Radius.circular(40.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 40.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Company : ',
                          style: TextStyle(
                              fontSize: 22.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          nameOfSelectedCompany,
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Text(
                      textBody,
                      style: TextStyle(fontSize: 18.sp, color: Colors.black ,),
                      textAlign: TextAlign.values.first,
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: 30.w,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
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
                'Apply Now',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
