import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shreeji_delivery_app_bloc/screens/order/assigned_order_screen.dart';
import 'package:shreeji_delivery_app_bloc/screens/order/completed_order_screen.dart';
import 'package:shreeji_delivery_app_bloc/screens/profile/profile_screen.dart';
import 'package:shreeji_delivery_app_bloc/theme/colors.dart';
import 'package:shreeji_delivery_app_bloc/utils/pop_up_widget.dart';
import 'package:shreeji_delivery_app_bloc/utils/routes.dart';
import 'package:shreeji_delivery_app_bloc/utils/utility.dart';
import 'package:shreeji_delivery_app_bloc/widgets/custom_text_widget.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h,right: 25.w),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=> const AssignedOrderScreen()), (route) => false);
                  },
                  child: Icon(Icons.close,size: 20.h,))
              ],),
            ),
            Container(
              margin: EdgeInsets.only(top: 24.h,left: 15.w,bottom: 22.h),
              height: 80.h,
              width: 100.w,
              child: Image.asset('assets/images/frame.png',fit: BoxFit.fill)),
            InkWell(
              onTap: (){
                if(ModalRoute.of(context)!.settings.name == AppRoutes.assignedOrderScreen){
                  Navigator.of(context).pop();
                }else{
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> const AssignedOrderScreen()));
                  // Get.offNamed(AppRoutes.assignedOrderScreen);
                }
                
              },
              child: drawerOption('Assigned Orders','assets/icons/assigned_order_icon.svg',false)),
            gradientDivider(context),
            InkWell(
              onTap: (){
                if(ModalRoute.of(context)!.settings.name == AppRoutes.completedOrderScreen){
                  Navigator.of(context).pop();
                }else{
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> const CompletedOrderScreen()));
                  // Get.offNamed(AppRoutes.completedOrderScreen);
                }
                
              },
              child: drawerOption('Completed Orders','assets/icons/completed_order_icon.svg',false)),
            gradientDivider(context),
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const ProfileScreen()));
              },
              child: drawerOption('My Profile','assets/icons/profile_icon.svg',false)),
            gradientDivider(context),
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
                showAlertDialog(context);
              },
              child: drawerOption('Logout','assets/icons/logout_icon.svg',true)),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 28.h),
          child: Text('Version 0.0.1',style: GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.w500,color: textColor.withOpacity(0.3)),),
        )
      ],
    );
  }

  
   Widget drawerOption(String optionName,String optionAsset,bool isLogout){
    return Padding(
      padding: EdgeInsets.only(left: 12.w,top: 12.h,bottom: 12.h,right: 35.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14.r,
                backgroundColor: secondaryColor.withOpacity(0.1),
                child: Center(
                  child: SizedBox(
                    height: 15.h,width: 15.h,
                    child: SvgPicture.asset(optionAsset)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: CustomText(text: optionName,fontSize: 12.sp,fontWeight: FontWeight.w500,color: textColor),
              )
            ],
          ),
          SizedBox(
            height: 16.h,width: 16.h,
            child: SvgPicture.asset('assets/icons/arrow_icon.svg',colorFilter: isLogout == true ? const ColorFilter.mode(Color(0xff8d2626), BlendMode.srcIn): null))
        ],
      ),
    );
  }

  Widget gradientDivider(context){
    return Container(
      margin: EdgeInsets.only(left: 12.w,right: 35.w),
      height: 1.h,
      width: getWidth(context),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
          const Color(0xffeba500).withOpacity(0.3),
          const Color(0xffeba500).withOpacity(0.1),whiteColor
        ])
      ),
    );
  }
}