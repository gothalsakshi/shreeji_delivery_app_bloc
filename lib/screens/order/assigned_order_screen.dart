import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shreeji_delivery_app_bloc/cubits/assigned_order/assigned_order_cubit.dart';
import 'package:shreeji_delivery_app_bloc/screens/order/order_details_screen.dart';
import 'package:shreeji_delivery_app_bloc/theme/colors.dart';
import 'package:shreeji_delivery_app_bloc/utils/utility.dart';
import 'package:shreeji_delivery_app_bloc/widgets/common_drawer.dart';
import 'package:shreeji_delivery_app_bloc/widgets/custom_button_widget.dart';
import 'package:shreeji_delivery_app_bloc/widgets/custom_text_widget.dart';
import 'package:shreeji_delivery_app_bloc/widgets/custom_textfield.dart';
import 'package:shreeji_delivery_app_bloc/widgets/order_box_widget.dart';

class AssignedOrderScreen extends StatelessWidget {
  const AssignedOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final assignedOrderCubit = BlocProvider.of<AssignedOrderCubit>(context);
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          showGeneralDialog(
              barrierLabel: "Label",
              barrierDismissible: true,
              barrierColor: Colors.black.withOpacity(0.5),
              transitionDuration: const Duration(milliseconds: 100),
              context: context,
              pageBuilder: (context, anim1, anim2) {
                return Material(
                  type: MaterialType.transparency,
                  child: StatefulBuilder(
                    builder: (con, setState) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child:
                            BlocBuilder<AssignedOrderCubit, AssignedOrderState>(
                          builder: (context, state) {
                            return Container(
                              clipBehavior: Clip.antiAlias,
                              height: state is DateSelectedState 
                                  ? 280.h
                                  : 250.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20))),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 18.w,
                                        right: 18.w,
                                        top: 20.h,
                                        bottom: 14.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                            text: 'Filter by',
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w600,
                                            color: textColor),
                                        InkWell(
                                            onTap: () =>
                                                Navigator.of(context).pop(),
                                            child:
                                                Icon(Icons.close, size: 20.h))
                                      ],
                                    ),
                                  ),
                                  Divider(color: textColor.withOpacity(0.2)),
                                  Expanded(
                                      child: Container(
                                          color: whiteColor,
                                          height: 100.h,
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount: assignedOrderCubit
                                                      .timeList.length,
                                                  itemBuilder: (ctx, index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                AssignedOrderCubit>()
                                                            .applyFilter(index);
                                                        if (index ==
                                                            assignedOrderCubit
                                                                    .timeList
                                                                    .length -
                                                                1) {
                                                          assignedOrderCubit
                                                                  .isCustomDateSelected =
                                                              true;
                                                          context
                                                              .read<
                                                                  AssignedOrderCubit>()
                                                              .openDatePicker(
                                                                  context);
                                                        } else {
                                                          assignedOrderCubit
                                                                  .isCustomDateSelected =
                                                              false;
                                                        }
                                                      },
                                                      child: Container(
                                                          color: whiteColor,
                                                          height: 25.h,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 5.w),
                                                            child: Row(
                                                              children: [
                                                                index == 3
                                                                    ? Padding(
                                                                        padding: EdgeInsets.only(
                                                                            left:
                                                                                10.w,
                                                                            right: 8.w),
                                                                        child: const Icon(
                                                                            Icons.calendar_month),
                                                                      )
                                                                    : Transform
                                                                        .scale(
                                                                        scale:
                                                                            0.9.h,
                                                                        child: Padding(
                                                                            padding: EdgeInsets.only(right: 5.w, left: 5.w),
                                                                            child: BlocBuilder<AssignedOrderCubit, AssignedOrderState>(
                                                                              builder: (context, state) {
                                                                                if (state is FilterAppliedState) {
                                                                                  return Radio(
                                                                                      value: index,
                                                                                      visualDensity: const VisualDensity(horizontal: -2, vertical: 0),
                                                                                      activeColor: secondaryColor,
                                                                                      hoverColor: Colors.grey,
                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                      groupValue: assignedOrderCubit.selectedTime,
                                                                                      onChanged: (value) {
                                                                                        context.read<AssignedOrderCubit>().applyFilter(value!);
                                                                                        // setState(() {
                                                                                        //   // assignedOrderScreenController.selectedTime = value!;
                                                                                        // });
                                                                                      });
                                                                                } else {
                                                                                  return Radio(
                                                                                      value: index,
                                                                                      visualDensity: const VisualDensity(horizontal: -2, vertical: 0),
                                                                                      activeColor: secondaryColor,
                                                                                      hoverColor: Colors.grey,
                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                      groupValue: assignedOrderCubit.selectedTime,
                                                                                      onChanged: (value) {
                                                                                        context.read<AssignedOrderCubit>().applyFilter(value!);
                                                                                        // setState(() {
                                                                                        //   // assignedOrderScreenController.selectedTime = value!;
                                                                                        // });
                                                                                      });
                                                                                }
                                                                              },
                                                                            )),
                                                                      ),
                                                                CustomText(
                                                                    text: assignedOrderCubit
                                                                            .timeList[
                                                                        index],
                                                                    color:
                                                                        textColor,
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)
                                                              ],
                                                            ),
                                                          )),
                                                    );
                                                  }),
                                              BlocBuilder<AssignedOrderCubit,
                                                  AssignedOrderState>(
                                                builder: (context, state) {
                                                  if (state
                                                      is DateSelectedState) {
                                                    return Container(
                                                      // color: Colors.cyanAccent,
                                                      margin: EdgeInsets.only(
                                                          left: 17.w,
                                                          right: 17.w),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Expanded(
                                                              child: SizedBox(
                                                                  height: 30.h,
                                                                  child: ListTile(
                                                                      dense:
                                                                          true,
                                                                      horizontalTitleGap:
                                                                          5.w,
                                                                      minLeadingWidth:
                                                                          0,
                                                                      tileColor:
                                                                          Colors
                                                                              .brown,
                                                                      minVerticalPadding:
                                                                          0,
                                                                      enabled:
                                                                          true,
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      leading: Icon(
                                                                          Icons
                                                                              .calendar_month,
                                                                          color:
                                                                              secondaryColor,
                                                                          size: 18
                                                                              .h),
                                                                      title: CustomTextfield(
                                                                          isReadyOnly:
                                                                              true,
                                                                          controller:
                                                                              assignedOrderCubit.fromDate)))),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 12.w,
                                                                    right:
                                                                        12.w),
                                                            child:
                                                                const CustomText(
                                                                    text: 'To'),
                                                          ),
                                                          Expanded(
                                                            child: SizedBox(
                                                                height: 30.h,
                                                                child: ListTile(
                                                                    dense: true,
                                                                    horizontalTitleGap:
                                                                        5.w,
                                                                    minLeadingWidth:
                                                                        0,
                                                                    tileColor:
                                                                        Colors
                                                                            .brown,
                                                                    minVerticalPadding:
                                                                        0,
                                                                    enabled:
                                                                        true,
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    leading: Icon(
                                                                        Icons
                                                                            .calendar_month,
                                                                        color:
                                                                            secondaryColor,
                                                                        size: 18
                                                                            .h),
                                                                    title: CustomTextfield(
                                                                        isReadyOnly:
                                                                            true,
                                                                        controller:
                                                                            assignedOrderCubit.toDate))),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  } else {
                                                    return const SizedBox();
                                                  }
                                                },
                                              )
                                            ],
                                          ))),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 18.w,
                                        right: 18.w,
                                        bottom: 20.h,
                                        top: 14.h),
                                    child: CustomAuthButtonWidget(
                                        buttonName: 'Apply',
                                        onTap: () =>
                                            Navigator.of(context).pop()),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              });
        },
        child: CircleAvatar(
          radius: 19.r,
          backgroundColor: primaryColor,
          child: Center(
            child: SizedBox(
                height: 17.h,
                width: 17.h,
                child: SvgPicture.asset('assets/icons/filter_icon.svg')),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Assigned Orders'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xff280d4b),
                  Color(0xff320a65),
                  Color(0xff3b077d)
                ]),
          ),
        ),
      ),
      drawer: const Drawer(child: CommonDrawer()),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        customPageRouteBuilder(const OrderDetailsScreen()));
                    // MaterialPageRoute(builder: (ctx)=> const OrderDetailsScreen()));
                  },
                  child: const OrderBox()),
            );
          }),
    );
  }
}
