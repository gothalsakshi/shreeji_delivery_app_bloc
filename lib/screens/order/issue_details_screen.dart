import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shreeji_delivery_app_bloc/cubits/issue_detail/issue_detail_cubit.dart';
import 'package:shreeji_delivery_app_bloc/screens/order/empty_issue_screen.dart';
import 'package:shreeji_delivery_app_bloc/theme/colors.dart';
import 'package:shreeji_delivery_app_bloc/utils/utility.dart';
import 'package:shreeji_delivery_app_bloc/widgets/custom_button_widget.dart';
import 'package:shreeji_delivery_app_bloc/widgets/custom_text_widget.dart';
import 'package:shreeji_delivery_app_bloc/widgets/custom_textfield.dart';

class IssueDetailsScreen extends StatelessWidget {
  const IssueDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final issueDetailCubit = BlocProvider.of<IssueDetailCubit>(context);
    return Scaffold(
      appBar: appbar('Issue Details', context),
      body: SingleChildScrollView(
        child: BlocBuilder<IssueDetailCubit, IssueDetailState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 20.w, right: 20.w, bottom: 15.h, top: 15.h),
                  decoration: BoxDecoration(color: whiteColor, boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 20,
                    )
                  ]),
                  padding: EdgeInsets.all(14.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: 'Issue Type',
                          fontSize: 14.sp,
                          color: textColor,
                          fontWeight: FontWeight.w500),
                      Padding(
                        padding: EdgeInsets.only(top: 14.h, bottom: 5.h),
                        child: Divider(
                            color: textColor.withOpacity(0.2), height: 1.h),
                      ),
                     
                      DropdownButton(
                          icon: SvgPicture.asset('assets/icons/down_arrow.svg'),
                          isExpanded: true,
                          hint: CustomText(text: 'Select the type of issue',fontSize: 13.sp,fontWeight: FontWeight.w600,color: textColor.withOpacity(0.5)),
                          value: issueDetailCubit.selectedDropValue == '' ? null : issueDetailCubit.selectedDropValue,
                          items: ["test1", "test2", "test3", "test4", "test5", "test6", "test7"].map((country){
                              return DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                              );
                          }).toList(),
                          onChanged: (country){
                            // issueDetailScreenController.selectedDropValue.value = country.toString();
                            context.read<IssueDetailCubit>().selecteCoutry(country);
                            debugPrint("You selected: $country");
                          },
                      ) 
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
                  decoration: BoxDecoration(color: whiteColor, boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 20,
                    )
                  ]),
                  padding: EdgeInsets.all(14.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: 'Remark',
                          fontSize: 14.sp,
                          color: textColor,
                          fontWeight: FontWeight.w500),
                      Padding(
                        padding: EdgeInsets.only(top: 14.h, bottom: 14.h),
                        child: Divider(
                            color: textColor.withOpacity(0.2), height: 1.h),
                      ),
                      const CustomTextfield(
                        hintText: 'Type your remarks here...',
                        maxLines: 4,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  decoration: BoxDecoration(color: whiteColor, boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 20,
                    )
                  ]),
                  padding: EdgeInsets.all(14.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: 'Upload Payment Document',
                              fontSize: 14.sp,
                              color: textColor,
                              fontWeight: FontWeight.w500),
                          issueDetailCubit.list.isNotEmpty
                           ?
                          InkWell(
                            onTap: () =>
                                showUploadImageDialog(context, context.read<IssueDetailCubit>().pickImage, context.read<IssueDetailCubit>().takeImage),
                            child: CircleAvatar(
                              radius: 14.r,
                              backgroundColor: secondaryColor.withOpacity(0.2),
                              child: Icon(Icons.add,
                                  color: secondaryColor, size: 18.h),
                            ),
                          )
                          : const SizedBox()
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14.h, bottom: 14.h),
                        child: Divider(
                            color: textColor.withOpacity(0.2), height: 1.h),
                      ),
                     
                      state is ListAddItemState && state.imageList.isNotEmpty || state is RemoveListItemState && state.removeImageList.isNotEmpty ?
                      SizedBox(
                        // color: Colors.amber,
                        height: 50.h,
                        // width: getWidth(context),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: state is ListAddItemState? state.imageList.length : state is RemoveListItemState ? state.removeImageList.length : 0,
                            itemBuilder: (ctx, index) {
                              return Stack(
                                fit: StackFit.loose,
                                clipBehavior: Clip.none,
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: secondaryColor)),
                                    margin: EdgeInsets.only(right: 7.w),
                                    padding: EdgeInsets.all(2.h),
                                    width: 40.w,
                                    height: 50.h,
                                    child:state is ListAddItemState?
                          Image.file(File(state.imageList[index]),fit: BoxFit.fill) 
                          : state is RemoveListItemState ? Image.file(File(state.removeImageList[index]),fit: BoxFit.fill)
                          :  Container(height: 10,width: 10,color: Colors.amberAccent),
                                  ),
                                  Positioned(
                                    right: 0.h,
                                    bottom: 38.h,
                                    child: InkWell(
                                      onTap: () {
                                        context.read<IssueDetailCubit>().removeItemsFrOmList(index);
                                      },
                                      child: CircleAvatar(
                                        radius: 9.r,
                                        backgroundColor: whiteColor,
                                        child: CircleAvatar(
                                          radius: 8.r,
                                          backgroundColor: const Color(0xff8d2626),
                                          child: Center(
                                              child: Icon(Icons.close,
                                                  size: 14.h,
                                                  color: whiteColor)),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                      )
                      : issueDetailCubit.list.isEmpty ?  
                      InkWell(
                        onTap: ()=> showUploadImageDialog(context,context.read<IssueDetailCubit>().pickImage,context.read<IssueDetailCubit>().takeImage),
                        child: DottedBorder(
                          color: secondaryColor,
                          dashPattern: const [7, 4],
                          strokeWidth: 1.w,
                          borderType: BorderType.RRect,
                          child: Container(
                            padding: EdgeInsets.only(top: 10.h,bottom: 10.h),
                            width: getWidth(context),
                            color:const Color(0xfff4f3f6),
                            child: SvgPicture.asset('assets/icons/upload_icon.svg',height: 25.h,width: 25.h,),
                          )),
                      ) : const SizedBox()
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.w, right: 30.w, top: 40.h, bottom: 20.h),
                  child: CustomAuthButtonWidget(
                      onTap: () {
                        Navigator.of(context).push(customPageRouteBuilder(const EmptyIssueScreen()));
                        // Navigator.of(co
                        // ntext).pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const CustomText(
                                text: 'Payment done successfully',
                                color: whiteColor),
                            backgroundColor: secondaryColor.withOpacity(0.8)));
                      },
                      buttonName: 'Submit'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
