import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shreeji_delivery_app_bloc/theme/colors.dart';
import 'package:shreeji_delivery_app_bloc/utils/utility.dart';
import 'package:shreeji_delivery_app_bloc/widgets/custom_button_widget.dart';
import 'package:shreeji_delivery_app_bloc/widgets/custom_text_widget.dart';
import 'package:shreeji_delivery_app_bloc/widgets/custom_textfield.dart';

class IssueDetailsScreen extends StatelessWidget {
  const IssueDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Issue Details',context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 15.h,top: 15.h),
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 20,
                    )
                  ]
                ),
                padding: EdgeInsets.all(14.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Issue Type',fontSize: 14.sp,color: textColor,fontWeight: FontWeight.w500),
                    Padding(
                      padding: EdgeInsets.only(top: 14.h,bottom: 5.h),
                      child: Divider(color: textColor.withOpacity(0.2),height: 1.h),
                    ),
                    // const CustomTextfield(hintText: 'Type your remarks here...',),
                  //   DropdownButton(
                  //     icon: SvgPicture.asset('assets/icons/down_arrow.svg'),
                  //     isExpanded: true,
                  //     hint: CustomText(text: 'Select the type of issue',fontSize: 13.sp,fontWeight: FontWeight.w600,color: textColor.withOpacity(0.5)),
                  //     value: 1,
                  //     items: ["test1", "test2", "test3", "test4", "test5", "test6", "test7"].map((country){
                  //         return DropdownMenuItem( 
                  //             child: Text(country),
                  //             value: country,
                  //         );
                  //     }).toList(),
                  //     onChanged: (country){
                  //       // issueDetailScreenController.selectedDropValue.value = country.toString();
                  //       print("You selected: $country");
                  //     },
                  // )
                  ],
                ),
              ),
            Container(
                margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 15.h),
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 20,
                    )
                  ]
                ),
                padding: EdgeInsets.all(14.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Remark',fontSize: 14.sp,color: textColor,fontWeight: FontWeight.w500),
                    Padding(
                      padding: EdgeInsets.only(top: 14.h,bottom: 14.h),
                      child: Divider(color: textColor.withOpacity(0.2),height: 1.h),
                    ),
                    const CustomTextfield(hintText: 'Type your remarks here...',maxLines: 4,)
                  ],
                ),
              ),
            Container(
              margin: EdgeInsets.only(left: 20.w,right: 20.w),
              decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 20,
                  )
                ]
              ),
              padding: EdgeInsets.all(14.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'Upload Payment Document',fontSize: 14.sp,color: textColor,fontWeight: FontWeight.w500),
                    
                      InkWell(
                        onTap: ()=> showUploadImageDialog(context, (){},(){}),
                        child: CircleAvatar(
                          radius: 14.r,
                          backgroundColor: secondaryColor.withOpacity(0.2),
                          child: Icon(Icons.add,color: secondaryColor,size:18.h),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 14.h,bottom: 14.h),
                    child: Divider(color: textColor.withOpacity(0.2),height: 1.h),
                  ),
                  // issueDetailScreenController.list.isEmpty ?
                  // InkWell(
                  //   onTap: ()=> showUploadImageDialog(context,(){},(){}),
                  //   child: DottedBorder(
                  //     color: secondaryColor,
                  //     dashPattern: [7, 4],
                  //     strokeWidth: 1.w,
                  //     borderType: BorderType.RRect,
                  //     child: Container(
                  //       padding: EdgeInsets.only(top: 10.h,bottom: 10.h),
                  //       width: getWidth(context),
                  //       color: Color(0xfff4f3f6),
                  //       child: SvgPicture.asset('assets/icons/upload_icon.svg',height: 25.h,width: 25.h,),
                  //     )),
                  // ) 
                  // : 
                  Container(
                    // color: Colors.amber,
                    height: 50.h,
                    // width: getWidth(context),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (ctx,index){
                      return Stack(
                        fit: StackFit.loose,
                        clipBehavior: Clip.none,
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: secondaryColor)
                          ),
                          margin: EdgeInsets.only(right: 7.w),
                          padding: EdgeInsets.all(2.h),
                          width: 40.w,height: 50.h,
                          child: Image.file(File(''),fit: BoxFit.fill,),
                        ),
                        Positioned(
                          right: 0.h,
                          bottom: 38.h,
                          child: InkWell(
                            onTap: (){
                              // issueDetailScreenController.list.removeAt(index);
                            },
                            child: CircleAvatar(
                              radius: 9.r,
                              backgroundColor: whiteColor,
                              child: CircleAvatar(
                                radius: 8.r,
                                backgroundColor: Color(0xff8d2626),
                                child: Center(child: Icon(Icons.close,size: 14.h,color: whiteColor)),
                              ),
                            ),
                          ),
                        )
                        ],
                      );
                    }),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 30.w,right: 30.w,top: 40.h,bottom: 20.h),
                child: CustomAuthButtonWidget(
                  onTap: (){
                    // Get.toNamed(AppRoutes.emptyOrderScreen);
                    // goBack();
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomText(text: 'Upload successfully',color: whiteColor),backgroundColor: secondaryColor.withOpacity(0.8)));
                  },
                  buttonName: 'Submit'),
              ),
          ],
        ),
      ),
    );
  }
}