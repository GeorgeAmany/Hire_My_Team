import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemHome extends StatelessWidget {
  final String nameOfJob , nameOfCompany;
  const ItemHome({Key? key, required this.nameOfJob, required this.nameOfCompany}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 40.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text(
            nameOfJob,
            style: TextStyle(fontSize: 22.sp),
          ),
          Row(
            children: [
              Text(
                'Bangalore | Full Time',
                style: TextStyle(fontSize: 12.sp),
              ),
              Spacer(),
              InkWell(
                child: Container(
                  width: 22.w,
                  height: 22.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff5A55CA),
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Company : ',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                nameOfCompany ,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          const Divider(thickness: 3),

        ],
      ),
    );
  }
}
